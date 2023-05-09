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
      |Success - User Join DAI	|Positive	|911	|7	    |1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join ETH	|Positive	|907	|0.007	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join DASH	|Positive	|3	    |0.07	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join ONE	|Positive	|864	|35	    |1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join USDC	|Positive	|914	|7	    |1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join USDT	|Positive	|913	|7	    |1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join VEX	|Positive	|867	|7000	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join UNI	|Positive	|916	|0.7	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join XZC	|Positive	|4	    |0.7	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join BNB	|Positive	|920	|0.035	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join BTC	|Positive	|5	    |0.0007	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join ADA	|Positive	|906	|49	    |1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join METIC|Positive	|908	|21	    |1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join SOL	|Positive	|921	|0.7	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
      |Success - User Join DOT	|Positive	|922	|1.75	|1	    |10	            |F010001	    |SSSSSS	    |Success Join |
