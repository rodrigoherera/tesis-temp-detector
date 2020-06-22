package services

import (
	"encoding/json"
	"errors"
	"log"
	"net/http"
	"strconv"
	"sync"

	"github.com/gorilla/websocket"
)

const (
	maxMessageSize = 1024
)

var client = make(map[*websocket.Conn]Client)
var messageChannel = make(chan Message)

var upgrader = websocket.Upgrader{} // use default options

//Client requiere structure for ws conn
type Client struct {
	User     string `json:"user"`
	DeviceID string `json:"deviceID"`
	UserID   string `json:"userid"`
}

//Message structure for the ws communication
type Message struct {
	Type    string      `json:"type"`
	Content string      `json:"content"`
	Data    interface{} `json:"data"`
}

// ServeWs ws conn handler
func ServeWs(w http.ResponseWriter, r *http.Request) {
	c, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		log.Print("upgrade:", err)
		return
	}
	defer c.Close()
	for {
		_, message, err := c.ReadMessage()
		if err != nil {
			_killConn(c, "Closed connection")
			log.Println("read:", err)
			break
		}

		var Cli Client
		err = json.Unmarshal(message, &Cli)
		if err != nil {
			_killConn(c, "malformed message!")
			log.Println(err)
			break
		}
		client[c] = Cli

		log.Printf("recv: %v", Cli)
	}
}

func _killConn(conn *websocket.Conn, message string) {
	if conn == nil {
		return
	}
	conn.Close()
	delete(client, conn)
	return
}

func writeToConnection(c *websocket.Conn, msg Message) (e error) {

	if c == nil {
		return errors.New("connection not found")
	}
	var mtx = &sync.Mutex{}
	mtx.Lock()
	e = c.WriteJSON(msg)
	mtx.Unlock()
	if e != nil {
		log.Printf("\nError al escribir en el socket: %s", e.Error())
	}
	return e
}

func _sendmsg(temperature string, user int64) {

	valueVal := strconv.FormatInt(user, 10)
	msg := Message{
		Type:    "event",
		Content: valueVal,
		Data:    temperature,
	}

	// Send it out to every client that is currently connected
	go func() {
		messageChannel <- msg
	}()
}

//Handle start the ws listerner
func Handle() {
	for {
		var msg Message
		select {
		case msg = <-messageChannel:
			conn, err := _getConnByClient(msg.Content)
			if err != nil {
				log.Println(err)
				break
			}

			err = writeToConnection(conn, msg)
			_checkError(conn, err)
		}
	}
}

func _checkError(conn *websocket.Conn, err error) {
	if err != nil {
		_killConn(conn, err.Error())
		delete(client, conn)
		return
	}
}

func _getConnByClient(userid string) (*websocket.Conn, error) {
	for k, v := range client {
		if v.UserID == userid {
			return k, nil
		}
	}
	return nil, errors.New("Client not found")
}
