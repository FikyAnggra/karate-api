Feature: Auto Subscribe Earn

  Background:
    * def base_url =  read('classpath:api/wallet/GlobalVariable.json')
    * url base_url.Wallet_Common_URL
    * header x-lang = 'id'
    * header x-currency = 'IDR'
    * header x-user-level = 0
    * header x-wd-level = 0


  Scenario Outline: Validate Eligible Coin for Auto Join Earn
    Given header x-userid = '7832'
    Given path 'v1/subscribe-earn'
    And request {"coin_id" : <coin_id>}
    When method POST
    Then status 200
    And print response
    Then match response.service == "subscribeEarn.CreateOrUpdateSubscribeEarn"
    Then match response.message == "Data berhasil diambil"
    Then match response.status == true
    Then match response.data.status == 1
    Then match response.data.coin_id == <coin_id>

    Examples:
      | read('../data/POST-AutoSubscribeEarn-positive-data.csv') |

  Scenario Outline: Validate Error Message for Incorrect Auto Subs Earn
    Given header x-userid = '<user_id>'
    Given path 'v1/subscribe-earn'
    And request {"coin_id" : <coin_id>}
    When method POST
    And print response
    Then match response.service == "subscribeEarn.CreateOrUpdateSubscribeEarn"
    Then match response.message == "<message>"
    Then match response.status == <status>
    Then match response.error == "<error_message>"

    Examples:
      | read('../data/POST-AutoSubscribeEarn-negative-data.csv') |