Feature: Auto Subscribe Earn

  Background:
    * def base_url =  read('classpath:api/wallet/GlobalVariable.json')
    * url base_url.Wallet_Common_URL
    * header x-lang = 'id'
    * header x-currency = 'IDR'
    * header x-user-level = 0
    * header x-wd-level = 0


  Scenario Outline: Get Data from Auto Subscribe Earn Table
    Given header x-userid = '<user_id>'
    Given path 'v1/subscribe-earn'
    Then param coin_id = '<coin_id>'
    When method GET
    And print response
    Then match response.service == "subscribeEarn.GetSubscribeEarn"
    Then match response.status == <status>

    Examples:
      | read('../data/GET-AutoSubscribeEarn-data.csv') |