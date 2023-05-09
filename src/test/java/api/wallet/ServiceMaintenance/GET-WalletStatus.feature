Feature: Wallet Status

  Background:
    * def base_url =  read('classpath:api/wallet/GlobalVariable.json')
    * url base_url.Wallet_Common_URL
    * header x-userid = '7341'
    * header x-lang = 'id'
    * header x-currency = 'IDR'
    * header x-user-level = 0
    * header x-wd-level = 0

  Scenario Outline: Success GET Wallet Status
    Given path '/wallet/status'
    When method GET
    Then status 200
    And print response
    Then match response.service == "walletMaintenance.list"
    Then match response.status == true
    Then match response.message == "Data berhasil diambil"
    Then match response.data[<index>].id == <index_id>
    Then match response.data[<index>].name == "<name>"
    Then match response.data[<index>].service_name == "<service-name>"
    Then match response.data[<index>].is_active == <is_active>
    Then match response.data[<index>].user_level == <user_level>

    Examples:
      | read('../data/GET-WalletStatus-data.csv') |
