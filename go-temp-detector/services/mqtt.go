package services

import (
	"encoding/json"
	"fmt"

	ctlr "temp/controllers"

	MQTT "github.com/eclipse/paho.mqtt.golang"
)

type tempMsg struct {
	User  int64  `json:"user"`
	Value string `json:"value"`
}

func brokerUsersHandler(client MQTT.Client, msg MQTT.Message) {
	msgJSON := &tempMsg{}
	b := msg.Payload()
	err := json.Unmarshal(b, &msgJSON)
	if err != nil {
		fmt.Println("Error: user/temperature: ", msg.Topic(), string(msg.Payload()))
	}

	fmt.Println(" \nTopico: " + msg.Topic() + " Payload:" + string(msg.Payload()))

	go ctlr.SetTemperature(msgJSON.User, msgJSON.Value)
	go _sendmsg(msgJSON.Value, msgJSON.User)
}

// Init initialize the main function of mqtt
func Init() {

	optsPub := MQTT.NewClientOptions()
	// optsPub.AddBroker("topomqtt.ddns.net:1883")
	optsPub.AddBroker("broker.hivemq.com:1883")
	//optsPub.SetUsername("htmbxcyz")
	//optsPub.SetPassword("rH2_IZj43nDy")
	optsPub.SetClientID("go-temp-detector")
	optsPub.SetCleanSession(false)
	optsPub.SetDefaultPublishHandler(func(client MQTT.Client, msg MQTT.Message) {
		fmt.Println("SetDefaultPublishHandler : ", msg.Topic(), string(msg.Payload()))
	})

	client := MQTT.NewClient(optsPub)
	if token := client.Connect(); token.Wait() && token.Error() != nil {
		panic(token.Error())
	}

	client.Subscribe("user/temperature", 0, brokerUsersHandler)

}
