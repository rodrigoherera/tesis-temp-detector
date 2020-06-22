package routes

import (
	"context"

	ctrl "temp/controllers"
	"temp/proto"
)

//Server main router for GRPC function
type Server struct{}

//SetUser new user to the db
func (s *Server) SetUser(ctx context.Context, in *proto.User) (*proto.ServerResponse, error) {
	value, err := ctrl.SetUser(in.GetName(), in.GetLastName(), in.GetEmail(), in.GetPassword(), in.GetAdmin())
	return generateResponse(value, err)
}

// Login with a user
func (s *Server) Login(ctx context.Context, in *proto.User) (*proto.ServerResponse, error) {
	value, err := ctrl.Login(in.GetEmail(), in.GetPassword())
	return generateResponse(value, err)
}

//Get the temperature
func (s *Server) Get(ctx context.Context, in *proto.Temperature) (*proto.GetTemperatures, error) {
	result, err := ctrl.GetTemperature(in.GetUserId(), in.GetFrom(), in.GetTo())
	if err != nil {
		return nil, err
	}
	ret := proto.GetTemperatures{Temperatures: result}
	return &ret, nil
}

//GetUser the users
func (s *Server) GetUser(ctx context.Context, in *proto.User) (*proto.GetUsers, error) {
	result, err := ctrl.GetUsers()
	if err != nil {
		return nil, err
	}
	ret := proto.GetUsers{User: result}
	return &ret, nil
}

func generateResponse(value []byte, err error) (*proto.ServerResponse, error) {
	if err != nil {
		return &proto.ServerResponse{Success: false, Value: value, Error: err.Error()}, nil
	}
	return &proto.ServerResponse{Success: true, Value: value, Error: ""}, nil
}
