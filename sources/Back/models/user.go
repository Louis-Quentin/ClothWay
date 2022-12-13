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

type Cloth struct {
	gorm.Model
	Price int
	Elec_Conso int
	Co2_Conso int
	Water_Conso int
	ID int
	Brand string
}

func (user *User) Create(database *gorm.DB) error {
	return database.Create(&user).Error
}
