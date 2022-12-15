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
	Greenhouse_gaz_conso 	int
	Water_conso 			int
	Quality_product 		int
	Conditions_working 		string
	Workers_salary 			int
	Materials 				string
	Factory 				string
	Pre_wash 				int
	Packaging 				int
	Original_country 		string
	Means_of_transports 	string
	ID 						int
	Brand 					string
}

func (user *User) Create(database *gorm.DB) error {
	return database.Create(&user).Error
}
