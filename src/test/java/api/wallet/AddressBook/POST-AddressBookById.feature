Feature: POST Address Book By ID Wallet Internak

  Background:
    * def base_url =  read('classpath:api/wallet/GlobalVariable.json')
    * url base_url.Wallet_Internal_URL


  Scenario Outline: Positive Test Case
    Given path 'address-book/<uuid>'
    When method POST
    Then match response.service == "wallet-internal.address-book.find"
    Then status 200
    Then match response.status == true
    Then match response.data.id == "<uuid>"
    Then match response.data.user_id == <user_id>
    Then match response.data.coin_id == <coin_id>
    Then match response.data.coin_name == "<coin_name>"
    Then match response.data.crypto_address == "<crypto_address>"
    Then match response.data.crypto_network == "<crypto_network>"
    Then match response.data.wallet_label == "<wallet_label>"
    Then match response.data.memo == "<memo>"
    Then match response.data.recipient_address == "<recipient_address>"
    Then match response.data.recipient_name == "<recipient_name>"
    Then match response.data.status == <status>


    Examples:
      | read('../data/POST-AddressBookById-positive-data.csv') |


  Scenario Outline: Negative Test Case
    Given path 'address-book/<uuid>'
    When method POST
    Then match response.service == "wallet-internal.address-book.find"
    Then status 404
    Then match response.status == false
    Then match response.message == "<message>"
    Then match response.error == "<error>"
    Examples:
      | read('../data/POST-AddressBookById-negative-data.csv') |