Feature: Auth Generate

  Background:
    * url 'https://dev-earn.honestmining.org/v2'
    * header Authorization = 'Bearer d7e6f20a-b4c5-4b0b-8771-c059d3dced2e'

  Scenario: Success Generate AUTH Token
    Given path '/auth/generate'
    When method POST
    Then status 200
    And print response
    Then match response.status == 1
    Then match response.status_code == "SSSSSS"
    Then match response.status_number == "F010001"
    Then match response.status_service == "10"
    Then match response.message == "Key Generated"

