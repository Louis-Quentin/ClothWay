package models

import (
	"gorm.io/gorm"
)

type User struct {
	gorm.Model
	Email    string
	Password string
}

type Cloth struct {
	gorm.Model
	Greenhouse_gaz_conso string
	Water_conso          string
	Quality_product      string
	Conditions_working   string
	Workers_salary       string
	Materials            string
	Factory              string
	Pre_wash             string
	Packaging            string
	Original_country     string
	Means_of_transports  string
	Brand                string
	Type                 string
	Score                string
	Water_score          string
	Materials_score      string
	Gaz_score            string
	Description          string
	Price                string
	Picture              string
}

func (user *User) Create(database *gorm.DB) error {
	return database.Create(&user).Error
}
