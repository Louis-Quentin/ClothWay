package router

import (
	"bytes"
	"github.com/gin-gonic/gin"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestHandleHomeRequest(t *testing.T) {
	// Create a new Gin router
	router := gin.Default()

	// Register the route with the Handle_home_request function
	router.GET("/home", Handle_home_request)
	// Test case 1: Valid request
	jsonStr := []byte(`{"msg": "Hello"}`)
	req, _ := http.NewRequest("GET", "/home", bytes.NewBuffer(jsonStr))
	w := httptest.NewRecorder()
	router.ServeHTTP(w, req)

	// Check the response status code
	if w.Code != http.StatusOK {
		t.Errorf("Test case 1 failed: expected status code %d, got %d", http.StatusOK, w.Code)
	}

	// Test case 2: Invalid request
	req, _ = http.NewRequest("GET", "/home", nil)
	w = httptest.NewRecorder()
	router.ServeHTTP(w, req)

	// Check the response status code
	if w.Code != http.StatusBadRequest {
		t.Errorf("Test case 2 failed: expected status code %d, got %d", http.StatusBadRequest, w.Code)
	}
}
