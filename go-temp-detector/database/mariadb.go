package databases

import (
	"fmt"
	"log"
	"os"
	"time"

	//Mysql dialect from gorm pkg
	_ "github.com/jinzhu/gorm/dialects/mysql"

	"github.com/jinzhu/gorm"
	"github.com/joho/godotenv"
)

// Client instance of mariadb
var Client *gorm.DB

// CreateMariaDBDatabase creates the mariadb database
func CreateMariaDBDatabase() (*gorm.DB, error) {
	var retryCount int
	e := godotenv.Load()
	if e != nil {
		fmt.Print(e)
	}

	DbUser := os.Getenv("DB_USER")
	DbPassword := os.Getenv("DB_PASSWORD")
	DbName := os.Getenv("DB_NAME")
	DbHost := os.Getenv("DB_HOST")
	DbPort := "3306"

	DBURL := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8&parseTime=true&loc=Local", DbUser, DbPassword, DbHost, DbPort, DbName)
	fmt.Println(DBURL)
	retryCount = 30
	for {
		conn, err := gorm.Open("mysql", DBURL)
		if err != nil {
			log.Println(err)
			retryCount--
			time.Sleep(2 * time.Second)
		} else {

			conn.SingularTable(true)
			conn.Debug()
			conn.LogMode(true)
			Client = conn
			break
		}
	}
	return Client, nil
}
