package models

import (
	"log"
	"time"

	dao "temp/database"
)

//User main structure for user
type User struct {
	ID        uint       `gorm:"primary_key"`
	Name      string     `json:"name"`
	LastName  string     `json:"lastname" gorm:"column:lastname"`
	Email     string     `json:"email" gorm:"unique_index"`
	Password  string     `json:"password"`
	Admin     bool       `json:"admin"`
	CreatedAt time.Time  `json:"-" gorm:"column:created_at"`
	UpdatedAt time.Time  `json:"-" gorm:"column:updated_At"`
	DeletedAt *time.Time `json:"-" gorm:"column:deleted_at"`
}

func (u *User) tableName() string {
	return "user"
}

//NewUser creates a new user
func (u *User) NewUser() (int, error) {

	tx := dao.Client.Begin()

	defer func() {
		if r := recover(); r != nil {
			tx.Rollback()
		}
	}()

	if err := tx.Error; err != nil {
		tx.Rollback()
		return 500, err
	}
	err := tx.Create(&u).Error
	if err != nil {
		tx.Rollback()
		return 500, err
	}

	if err := tx.Commit().Error; err != nil {
		tx.Rollback()
		return 500, err
	}
	log.Println("User created: ", u.Email)
	return 201, nil
}

//CheckUser check if a email already exists
func (u *User) CheckUser() (int, error) {

	err := dao.Client.Select("id, name, email, password").Model(&User{}).Where("email = ?", u.Email).Find(&u).Error
	if err != nil {
		return 500, err
	}
	return 200, nil
}

//GetUsers return all the users
func (u *User) GetUsers() ([]User, int, error) {
	var users []User

	err := dao.Client.Select("id, name, lastname, email, admin").Model(&User{}).Find(&users).Error
	if err != nil {
		return users, 500, err
	}

	return users, 200, nil
}
