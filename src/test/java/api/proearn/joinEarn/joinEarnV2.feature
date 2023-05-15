@Regression
@JoinEarn
Feature: Join Earn

  Background:
    * url 'https://dev-earn.honestmining.org/v2'
    * def auth = call read('classpath:api/proearn/authGenerate/authGenerateV2.feature')
    * def token = auth.response.data.token
    * header x-signature = token
    * header z-userid = '20841'
    * header z-lang = 'ID'
    * header z-currency = 'IDR'

  Scenario Outline: [<testType>] -> <testCase>
    Given path '/earn/user/join'
    And request body = {"coin_id" : <coinId>, "amount" : <amount>}
    When method POST
    Then status 200
    And print response
    Then match response.status == <status>
    Then match response.status_code == "<statusCode>"
    Then match response.status_number == "<statusNumber>"
    Then match response.status_service == "<statusService>"
    Then match response.message == "<message>"
    Then match response.data.contract == "#present"

    Examples:
      |testCase	                |testType	|coinId	|amount	|status	|statusService	|statusNumber	|statusCode	|message      |
      |Success - User Join DAI	|Positive	|911	|1	    |1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join ETH	|Positive	|907	|0.001	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join ONE	|Positive	|864	|5	    |1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join USDC	|Positive	|914	|1	    |1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join USDT	|Positive	|913	|1	    |1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join VEX	|Positive	|867	|1000	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join UNI	|Positive	|916	|0.1	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join XZC	|Positive	|4	    |0.1	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join BNB	|Positive	|920	|0.005	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join BTC	|Positive	|5	    |0.0001	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join ADA	|Positive	|906	|7	    |1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join METIC|Positive	|908	|3	    |1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join SOL	|Positive	|921	|0.3	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join DOT	|Positive	|922	|0.25	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
