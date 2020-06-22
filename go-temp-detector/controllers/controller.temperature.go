package controllers

import (
	"errors"
	"fmt"
	"strconv"
	"time"

	"temp/models"
	"temp/proto"
)

//SetTemperature set the temeprature for a user
func SetTemperature(userID int64, tempValue string) {
	if userID == 0 {
		fmt.Printf("Error, userID not provided")
	}
	userUint := uint(userID)

	if tempValue == "" {
		fmt.Printf("Error, temperature not provided")
	}
	temperature, err := strconv.ParseFloat(tempValue, 64)
	if err != nil {
		fmt.Printf("Error %s", err)
	}

	t := &models.Temperature{UserID: userUint, Value: temperature, CreatedAt: time.Now()}
	val, err := t.SetTemperature()

	if err != nil {
		fmt.Printf("Error with insert temperature: %s", err)
	}
	if val == 201 {
		fmt.Printf("Success with temperature creation for: %s", string(t.UserID))
	}
}

//GetTemperature for a user
func GetTemperature(userID int64, dateFrom, dateTo string) ([]*proto.Temperature, error) {

	t := &models.Temperature{}
	protoTemp := []*proto.Temperature{}

	if userID != 0 {
		userUint := uint(userID)
		t.UserID = userUint
	}

	temperature, val, err := t.GetTemperature(dateFrom, dateTo)

	if err != nil {
		return protoTemp, err
	}
	if val == 200 {
		for _, temp := range temperature {
			valueTemp := strconv.FormatFloat(temp.Value, 'f', 2, 64)
			newTmp := proto.Temperature{UserId: int64(temp.UserID), Date: temp.CreatedAt.Format("2006-01-02 15:04:05"), Value: valueTemp}
			protoTemp = append(protoTemp, &newTmp)
		}
		return protoTemp, nil
	}
	return protoTemp, errors.New("Unexpected error")
}
