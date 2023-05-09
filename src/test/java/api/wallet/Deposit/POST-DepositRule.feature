Feature: Deposit

  Background:
    * def base_url =  read('classpath:api/wallet/GlobalVariable.json')
    * url base_url.Wallet_Common_URL
    * header x-userid = '7341'
    * header x-lang = 'id'
    * header x-currency = 'IDR'
    * header x-user-level = 9
    * header x-wd-level = 0


  Scenario Outline: GET Crypto Deposit Rules
    Given path 'v4/deposit/rule'
    And request {"coin_id" : <coin_id>}
    When method POST
    Then status 200
    And print response
    Then match response.service == "bemn.deposit.qr"
    Then match response.message == "Data berhasil diambil"
    Then match response.status == true
    Then match response.data.coin_address.address == "<address>"
    Then match response.data.memo == "<memo>"
    Then match response.data.name == "<name>"

    Examples:
      | read('../data/POST-DepositRule-data.csv') |