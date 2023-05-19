package main_test

import (
  "testing"
)

func TestHealthCheckHandler(t *testing.T) {
	req, err := http.NewRequest("GET", "/health", nil)
	if err != nil {
	  t.Fatal(err)
	}
  
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(HealthCheckHandler)
  
	handler.ServeHTTP(rr, req)
  
	// Check the response status code
	if rr.Code != http.StatusOK {
	  t.Errorf("expected status %d; got %d", http.StatusOK, rr.Code)
	}
  
	// Check the response body
	expected := "ALIVE"
	if rr.Body.String() != expected {
	  t.Errorf("expected body to be %s; got %s", expected, rr.Body.String())
	}
}
  