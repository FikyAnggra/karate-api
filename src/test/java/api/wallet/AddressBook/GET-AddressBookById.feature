Feature: Address Book

  Background:
    * def base_url =  read('classpath:api/wallet/GlobalVariable.json')
    * url base_url.Wallet_Common_URL
    * header x-lang = 'id'

  Scenario Outline: Success GET Address Book by ID
    Given path 'v1/address-book/<address_book_id>'
    And header x-userid = '<user_id>'
    When method GET
    Then status 200
    And print response
    Then match response.service == "<service>"
    Then match response.message == "<message>"
    Then match response.status == true
    Then match response.data.id == "<address_book_id>"
    Then match response.data.user_id == <user_id>
    Then match response.data.coin_id == <coin_id>
    Then match response.data.coin_name == "<coin_name>"
    Then match response.data.crypto_address == "<crypto_address>"
    Then match response.data.crypto_network == "<crypto_network>"
    Then match response.data.wallet_label == "<wallet_label>"
    Then match response.data.memo == "<memo>"
    Then match response.data.recipient_address == "<recipient_address>"
    Then match response.data.recipient_name == "<recipient_name>"

  Examples:
    | read('../data/GET-AddressBookID-positive-data.csv') |

  Scenario Outline: Failed Retrieve by ID
    Given path 'v1/address-book/<address_book_id>'
    And header x-userid = '<user_id>'
    When method GET
    Then status 500
    And print response
    Then match response.service == "<service>"
    Then match response.message == "<message>"
    Then match response.status == false
    Then match response.error == "<error_message>"

#
    Examples:
      | read('../data/GET-AddressBookID-negative-data.csv') |
