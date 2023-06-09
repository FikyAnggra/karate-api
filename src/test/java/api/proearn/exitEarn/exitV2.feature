@Regression
@ExitEarn
Feature: Exit

  Background:
    * def auth = call read('classpath:api/proearn/authGenerate/authGenerateV2.feature')
    * def header = read('classpath:api/proearn/exitEarn/header.json')
    * set header.x-signature = auth.response.data.token
    * headers header

  Scenario Outline: [<testType>] -> <testCase>
    Given url 'https://dev-earn.honestmining.org/v2'
    And path '/earn/user/exit/inquiry'
    And headers header
    And request body = {"coin_id" : <coinId>, "amount" : <amount>}
    When method POST
    Then status 200
    And print response
    Then match response.status == <status>
    Then match response.status_code == "<statusCode>"
    Then match response.status_number == "<statusNumber>"
    Then match response.status_service == "<statusService>"
    Then match response.message == "<messageExitInquiry>"
    Then def contract = response.data.contract
    And url 'https://dev-earn.honestmining.org/v2'
    And path '/earn/user/exit'
    And headers header
    And request body = {"contract" : contract}
    And method POST
    Then status 200
    And print response
    Then match response.status == <status>
    Then match response.status_code == "<statusCode>"
    Then match response.status_number == "<statusNumber>"
    Then match response.status_service == "<statusService>"
    Then match response.message == "<messageExit>"

    Examples:
      |testCase	                  |testType	|coinId	|amount	|status	|statusService	|statusNumber	|statusCode	|messageExitInquiry	|messageExit  |
      |Success - User Exit DAI	  |Positive	|911	|1	    |1	    |10	            |F010001	    |SSSSSS	    |Success		    |Success Exit |
      |Success - User Exit ETH	  |Positive	|907	|0.001	|1	    |10	            |F010001	    |SSSSSS	    |Success		    |Success Exit |
      |Success - User Exit ONE	  |Positive	|864	|5	    |1	    |10	            |F010001	    |SSSSSS	    |Success		    |Success Exit |
      |Success - User Exit USDC	  |Positive	|914	|1	    |1	    |10	            |F010001	    |SSSSSS	    |Success		    |Success Exit |
      |Success - User Exit USDT	  |Positive	|913	|1	    |1	    |10	            |F010001	    |SSSSSS	    |Success		    |Success Exit |
      |Success - User Exit VEX	  |Positive	|867	|1000	|1	    |10	            |F010001	    |SSSSSS	    |Success		    |Success Exit |
      |Success - User Exit UNI	  |Positive	|916	|0.1	|1	    |10	            |F010001	    |SSSSSS	    |Success		    |Success Exit |
      |Success - User Exit XZC	  |Positive	|4	    |0.1	|1	    |10	            |F010001	    |SSSSSS	    |Success		    |Success Exit |
      |Success - User Exit BNB	  |Positive	|920	|0.005	|1	    |10	            |F010001	    |SSSSSS	    |Success		    |Success Exit |
      |Success - User Exit BTC	  |Positive	|5	    |0.0001	|1	    |10	            |F010001	    |SSSSSS	    |Success		    |Success Exit |
      |Success - User Exit ADA	  |Positive	|906	|7	    |1	    |10	            |F010001	    |SSSSSS	    |Success		    |Success Exit |
      |Success - User Exit METIC  |Positive	|908	|3	    |1	    |10	            |F010001	    |SSSSSS	    |Success		    |Success Exit |
      |Success - User Exit SOL	  |Positive	|921	|0.1	|1	    |10	            |F010001	    |SSSSSS	    |Success		    |Success Exit |
      |Success - User Exit DOT	  |Positive	|922	|0.25	|1	    |10	            |F010001	    |SSSSSS	    |Success		    |Success Exit |
