Feature: AddressBook

  Background:
    * def base_url =  read('classpath:api/wallet/GlobalVariable.json')
    * url base_url.Wallet_Common_URL
    * header x-lang = 'id'

  Scenario Outline: Success GET Wallet Status
    Given path 'v1/address-book'
    And header x-userid = '<user_id>'
    And param current_page = 1
    And param per_page = 100
    When method GET
    Then status 200
    And print response
    Then match response.service == "<service>"
    Then match response.message == "<message>"
    Then match response.status == true
    Then match response.data.data[<index_data>].id == "<id>"
    Then match response.data.data[<index_data>].user_id == <user_id>
    Then match response.data.data[<index_data>].coin_id == <coin_id>
    Then match response.data.data[<index_data>].coin_name == "<coin_name>"
    Then match response.data.data[<index_data>].crypto_address == "<crypto_address>"
    Then match response.data.data[<index_data>].crypto_network == "<crypto_network>"
    Then match response.data.data[<index_data>].wallet_label == "<wallet_label>"
    Then match response.data.data[<index_data>].memo == "<memo>"
    Then match response.data.data[<index_data>].recipient_address == "<recipient_address>"
    Then match response.data.data[<index_data>].recipient_name == "<recipient_name>"
    Then match response.data.data[<index_data>].crypto_address_validate == true
    Then match response.data.data[<index_data>].status == <status>

    Examples:
      | read('../data/GET-AddressBook-data.csv') |


