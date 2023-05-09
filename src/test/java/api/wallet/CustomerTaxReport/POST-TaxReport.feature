Feature: Get Tax Report Wallet Common

  Background:
    * def base_url =  read('classpath:api/wallet/GlobalVariable.json')
    * url base_url.Wallet_Common_URL
    * header x-lang = 'id'
    * header x-currency = 'IDR'
    * header x-user-level = 0
    * header x-wd-level = 0


  Scenario Outline: Positive Test Case
    Given header x-userid = '<user_id>'
    Given path 'v4/taxreport/get'
    And request {"year" : <year>}
    When method POST
    Then match response.message == "<message>"
    Then match response.status == <status>
    Then match response.data.year == <year>
    Then match response.data.id == <id>
    Examples:
      | read('../data/POST-TaxReport-positive-data.csv') |


  Scenario Outline: Negative Test Case
    Given header x-userid = '<user_id>'
    Given path 'v4/taxreport/get'
    And request {"year" : <year>}
    When method POST
    Then match response.message == "<message>"
    Then match response.status == <status>
    Then match response.error == "<error_message>"
    Examples:
      | read('../data/POST-TaxReport-negative-data.csv') |

