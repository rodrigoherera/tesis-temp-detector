package models

import (
	"log"
	"time"

	dao "temp/database"
)

//Temperature structure
type Temperature struct {
	ID        uint      `gorm:"primary_key"`
	Value     float64   `json:"value"`
	User      User      `json:"-" gorm:"foreignkey:UserID"`
	UserID    uint      `json:"userid,omitempty"`
	CreatedAt time.Time `json:"-" gorm:"column:created_at"`
}

func (t *Temperature) tableName() string {
	return "temperature"
}

//SetTemperature set new temperature
func (t *Temperature) SetTemperature() (int, error) {
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
	err := tx.Create(&t).Error
	if err != nil {
		tx.Rollback()
		return 500, err
	}

	if err := tx.Commit().Error; err != nil {
		tx.Rollback()
		return 500, err
	}
	log.Println("Temperature data created")
	return 201, nil
}

//GetTemperature get temperature filter by user_id and optional a date value
func (t *Temperature) GetTemperature(dateFrom, dateTo string) ([]Temperature, int, error) {
	var temperature []Temperature

	if t.UserID != 0 {
		err := dao.Client.Select("id, value, user_id, created_at").Model(&Temperature{}).Where("user_id = ?", t.UserID).Order("created_at DESC").Find(&temperature).Error
		if err != nil {
			return temperature, 500, nil
		}
	} else {
		err := dao.Client.Select("id, value, user_id, created_at").Model(&Temperature{}).Order("created_at DESC").Find(&temperature).Error
		if err != nil {
			return temperature, 500, nil
		}
	}

	if dateFrom != "" && dateTo != "" {
		dateFrom, err := time.Parse("2006-01-02 15:04:05", dateFrom)
		if err != nil {
			return temperature, 500, err
		}
		dateTo, err := time.Parse("2006-01-02 15:04:05", dateTo)
		if err != nil {
			return temperature, 500, err
		}

		for i := 0; i < len(temperature); i++ {
			if inTimeSpan(dateFrom, dateTo, temperature[i].CreatedAt) {
			} else {
				temperature = removeElement(temperature, i)
				i--
			}
		}
	}
	return temperature, 200, nil
}

func removeElement(t []Temperature, i int) []Temperature {
	t[len(t)-1], t[i] = t[i], t[len(t)-1]
	return t[:len(t)-1]
}

func inTimeSpan(start, end, check time.Time) bool {
	return check.After(end) && check.Before(start)
}
