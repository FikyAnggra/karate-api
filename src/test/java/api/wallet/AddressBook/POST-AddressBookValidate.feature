Feature: Address Book

  Background:
    * def base_url =  read('classpath:api/wallet/GlobalVariable.json')
    * url base_url.Wallet_Common_URL
    * header x-lang = 'id'

  Scenario Outline: Success Validate Coin ID, Crypto Address, and Crypto Network
    Given path 'v1/address-book/validate'
    And header x-userid = '<user_id>'
    And request {"coin_id" : <coin_id>,"crypto_address":<crypto_address>,"crypto_network" : <crypto_network>,"wallet_label" : <wallet_label>,"memo" : "<memo>","recipient_name" : <recipient_name>,"recipient_address" : <recipient_address>}
    When method POST
    Then status 200
    And print response
    Then match response.service == "walletAddressBook.validate"
    Then match response.message == "Data berhasil diambil"
    Then match response.status == true
    Then match response.data == true

  Examples:
    | read('../data/POST-AddressBookValidate-data.csv') |


