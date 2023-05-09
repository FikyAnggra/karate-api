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
    Given path 'v4/wallet'
    And request {"paginate": {"current_page": 1,"per_page": 50},"filter": {"search": "<search>","hidden_zero": 1,"sku": [],"is_assets": 1}}
    When method POST
    Then status 200
    And print response
    Then match response.service == "bemn.currencies.list"
    Then match response.message == "Data berhasil diambil"
    Then match response.status == true
    Then match response.data.details[0].balances.base_asset.active.ticker == "<search>"
    Then match response.data.details[0].name == "<name>"
    Then match response.data.details[0].have_history == true
    Then match response.data.details[0].hide_depo_wd == false
    Then match response.data.details[0].setting.allow_deposit == true
    Then match response.data.details[0].setting.allow_withdrawal == true

    Examples:
      | read('../data/POST-Wallet-data.csv') |