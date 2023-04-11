package router

import (
	"testing"
	"Back-End.clothway/models"
	"gorm.io/gorm"
	"github.com/gin-gonic/gin"
	"encoding/json"
	"io"
    "gorm.io/driver/sqlite"
)
func TestGetAllClothsRequest(t *testing.T) {
	db, err := gorm.Open(sqlite.Open("file::memory:?cache=shared"), &gorm.Config{})
    if err != nil {
        t.Fatalf("Can't create fake database : %v", err)
    }

    err = db.AutoMigrate(&models.Cloth{})
    if err != nil {
        t.Fatalf("Error on database migration: %v", err)
    }

    db.Create(&models.Cloth{Greenhouse_gaz_conso: "3", Water_conso: "3", Quality_product: "4",
	Conditions_working:  "2", Workers_salary: "200", Materials: "Coton,Cuir", Factory: "4",
	Pre_wash: "1", Packaging: "1", Original_country: "China", Means_of_transports: "Plane", Brand: "Nike",
	Type: "Pantalon", Score: "1", Water_score: "3", Materials_score: "2", Gaz_score: "1",
	Description: "oui", Price: "23", Picture: "path/",})


    context := &gin.Context{Keys: make(map[string]interface{})}
    context.Set("gorm", *db)

    Handle_get_all_cloths_request(context)

    string_body, _ := io.ReadAll(context.Request.Body)
    var response map[string][]models.Cloth
    err = json.Unmarshal([]byte(string_body), &response)
    if err != nil {
        t.Errorf("Failed to decrypt json: %v", err)
    }
    if len(response) <= 0 {
        t.Errorf("0 cloths retreived")
    }
}