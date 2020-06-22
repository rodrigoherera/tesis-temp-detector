package controllers

import (
	"encoding/json"
	"errors"
	"fmt"
	"strings"

	m "temp/middleware"
	"temp/models"
	"temp/proto"

	"golang.org/x/crypto/bcrypt"
)

//SetUser new user
func SetUser(name, lastname, email, password string, isAdmin bool) ([]byte, error) {

	admin := false

	if name == "" || lastname == "" || email == "" || password == "" {
		return nil, errors.New("Not enough parameters, Empty name, lastname, email or password field")
	}

	if !strings.Contains(email, "@") {
		return nil, errors.New("Invalid email format, @ required")
	}

	if len(password) < 8 {
		return nil, errors.New("Invalid password lenght, minimun lenght is 8")
	}

	bytePwd := []byte(password)
	hashedPassword, err := bcrypt.GenerateFromPassword(bytePwd, bcrypt.DefaultCost)
	if err != nil {
		return nil, err
	}
	if isAdmin {
		admin = isAdmin
	}

	user := &models.User{Name: name, LastName: lastname, Email: email, Password: string(hashedPassword), Admin: admin}
	val, err := user.NewUser()

	if err != nil {
		return nil, err
	}
	if val == 201 {
		result, err := m.Signin(user)
		if err != nil {
			return nil, err
		}

		jsonRet := struct {
			ID    uint   `json:"id"`
			Name  string `json:"name"`
			Email string `json:"email"`
			Jwt   string `json:"jwt"`
		}{
			ID:    user.ID,
			Name:  user.Name,
			Email: user.Email,
			Jwt:   result,
		}

		rr, err := json.Marshal(&jsonRet)
		if err != nil {
			return nil, err
		}
		return rr, nil
	}

	return nil, errors.New("Unexpected error")
}

//Login a user
func Login(email, password string) ([]byte, error) {
	if email == "" || password == "" {
		return nil, errors.New("Not enough parameters, Empty email or password field")
	}

	if !strings.Contains(email, "@") {
		return nil, errors.New("Invalid email format, @ required")
	}
	user := &models.User{Email: email}
	val, err := user.CheckUser()

	if err != nil {
		return nil, err
	}
	if val == 200 {

		err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password))
		if err != nil { //Password does not match!
			fmt.Printf("Error checking password for user:%v , error: %v", user.Email, err)
			return nil, errors.New("Email or Password incorrect")
		}
		result, err := m.Signin(user)
		if err != nil {
			return nil, err
		}

		jsonRet := struct {
			ID    uint   `json:"id"`
			Name  string `json:"name"`
			Email string `json:"email"`
			Jwt   string `json:"jwt"`
		}{
			ID:    user.ID,
			Name:  user.Name,
			Email: user.Email,
			Jwt:   result,
		}

		rr, err := json.Marshal(&jsonRet)
		if err != nil {
			return nil, err
		}
		return rr, nil
	}

	return nil, errors.New("Unexpected error")
}

//GetUsers return the existence users
func GetUsers() ([]*proto.User, error) {
	var u *models.User
	usersSlice := []*proto.User{}
	users, val, err := u.GetUsers()
	if err != nil {
		return usersSlice, err
	}
	if val == 200 {
		for _, usr := range users {
			usrInt := int64(usr.ID)
			newUser := proto.User{Id: usrInt, Name: usr.Name, LastName: usr.LastName, Email: usr.Email, Admin: usr.Admin}
			usersSlice = append(usersSlice, &newUser)
		}
		return usersSlice, nil
	}
	return usersSlice, errors.New("Unexpected error")
}
