package models

import (
	"gorm.io/gorm"
)


type User struct {
	gorm.Model
	Name     string
	Email    string
	Password string
}

func (user *User) Create(database *gorm.DB) error {
	return database.Create(&user).Error
}
