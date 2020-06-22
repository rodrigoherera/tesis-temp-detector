package main

import (
	"flag"
	"fmt"
	"log"
	"net"
	"net/http"
	"os"
	dao "temp/database"
	"temp/proto"
	rr "temp/routes"
	"temp/services"

	"github.com/joho/godotenv"
	"google.golang.org/grpc"
)

func main() {
	fmt.Println("App : App initializing...")
	e := godotenv.Load()
	if e != nil {
		fmt.Print(e)
	}
	protocol := os.Getenv("PROTOCOL")
	grpcPORT := os.Getenv("GRPC_PORT")
	httpPORT := os.Getenv("HTTP_PORT")
	addr := flag.String("addr", ":"+httpPORT, "http service address")

	_runDatabase()
	go _runHTTP(addr, httpPORT)
	_runMQTT()
	_runGRPC(protocol, grpcPORT)
}

func _runDatabase() {

	fmt.Println("MariaDB : database initializing...")
	db, err := dao.CreateMariaDBDatabase()
	if err != nil {
		panic(err)
	}
	dao.Client = db
	fmt.Println("MariaDB : database is ready!")
}

func _runHTTP(addr *string, httpPORT string) {
	fmt.Println("WEBSOCKET : WEBSOCKET initializing...")
	go services.Handle()
	fmt.Println("WEBSOCKET : WEBSOCKET is ready!")

	fmt.Printf("HTTP : HTTP is ready on %v", httpPORT)
	http.HandleFunc("/ws", services.ServeWs)
	err := http.ListenAndServe(*addr, nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}

func _runMQTT() {
	fmt.Println("MQTT : MQTT initializing...")
	services.Init()
	fmt.Println("\n MQTT : MQTT is ready!")
}

func _runGRPC(protocol, grpcPORT string) {
	fmt.Println("GRPC : GRPC initializing...")
	listener, err := net.Listen(protocol, ":"+grpcPORT)
	if err != nil {
		panic(err)
	}
	fmt.Printf("GRPC : GRPC is ready on TCP %v", grpcPORT)
	srv := grpc.NewServer()
	proto.RegisterBasicServiceServer(srv, &rr.Server{})

	if c := srv.Serve(listener); c != nil {
		panic(err)
	}
}
