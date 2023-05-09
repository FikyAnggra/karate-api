Feature: History Detail Transaction

  Background:
    * url 'https://dev-trade-core.honestmining.org/api/v2'
    * header X-Lang = 'id'
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  Scenario Outline: [<testType>] -> <testCase>
    Given path '/trade/order-detail'
    And request body = {"filter": {"transaction_id": "7333X1678093403979428X919X907","category": "fiat_trade_plus","user_id": 7333}}
    When method POST
    Then status 200
    And print response
    Then match response.status == parseInt(status)
    Then match response.service == "<service>"
    Then match response.created_at == '#notnull'
    Then match response.success == <success>
    Then match response.message == "<message>"
    Then match response.data.exchange == "<data.exchange>"
    Then match response.data.ref_id == "<data.ref_id>"
    Then match response.data.price == <data.price>
    Then match response.data.amount == <data.amount>
    Then match response.data.crypto_amount.value == "<data.crypto_amount.value>"
    Then match response.data.crypto_amount.ticker == "<data.crypto_amount.ticker>"
    Then match response.data.fiat_amount.value == <data.fiat_amount.value>
    Then match response.data.fiat_amount.ticker == "<data.fiat_amount.ticker>"
    Then match response.data.unfilled_order.value == <data.unfilled_order.value>
    Then match response.data.unfilled_order.ticker == "<data.unfilled_order.ticker>"
    Then match response.data.destination == "<data.destination>"
    Then match response.data.fee.percentage == <data.fee.percentage>
    Then match response.data.fee.amount == <data.fee.amount>
    Then match response.data.status.step == <data.status.step>
    Then match response.data.status.label == "<data.status.label>"
    Then match response.data.symbol == "<data.symbol>"
    Then match response.data.ticker == "<data.ticker>"
    Then match response.data.date == "<data.date>"
    Then match response.data.side == "<data.side>"
    Then match response.data.category == "<data.category>"
    Then match response.data.prices[0].crypto == "<data.prices.crypto>"
    Then match response.data.prices[0].fiat == "<data.prices.fiat>"
    Then match response.data.prices[0].price == "<data.prices.price>"
    Then match response.data.tax.dpp_amount == <data.tax.dpp_amount>
    Then match response.data.tax.buyer.name == "<data.tax.buyer.name>"
    Then match response.data.tax.buyer.id == "<data.tax.buyer.id>"
    Then match response.data.tax.buyer.tax_amount == <data.tax.buyer.tax_amount>
    Then match response.data.tax.buyer.status == "<data.tax.buyer.status>"
    Then match response.data.tax.seller.name == "<data.tax.seller.name>"
    Then match response.data.tax.seller.id == "<data.tax.seller.id>"
    Then match response.data.tax.seller.tax_amount == <data.tax.seller.tax_amount>
    Then match response.data.tax.seller.status == "<data.tax.seller.status>"





    Examples:
      |testCase	                          |status|service               |created_at               |success|message|data.exchange|data.ref_id                  |data.price|data.amount      |data.crypto_amount.value|data.crypto_amount.ticker|data.fiat_amount.value|data.fiat_amount.ticker|data.unfilled_order.value|data.unfilled_order.ticker|data.destination|data.fee.percentage|data.fee.amount|data.status.step|data.status.label|data.symbol|data.ticker|data.date                     |data.side|data.category               |data.prices.crypto|data.prices.fiat|data.prices.price  |data.tax.dpp_amount|data.tax.buyer.name|data.tax.buyer.id|data.tax.buyer.tax_amount|data.tax.buyer.status|data.tax.seller.name        |data.tax.seller.id|data.tax.seller.tax_amount|data.tax.seller.status|
      |Success - History Detail Coin	  |200   |development-Trade Core|2023-03-07T11:17:21+07:00|true   |Success|OKX          |7333X1678093403979428X919X907|24279243  |35454.05957546371|0.00146026              |ETH                      |35454.05957546371     |IDR                    |0                        |IDR                       |Wallet ETH      |0                  |0              |3               |Completed        |ETH        |ETH        |2023-03-06T09:03:24.000Z      |buy.buy  |fiat_trade_plus             |0.00146026         |2               |1574               |35454              |Afiz               |6307060101900001 |70                       |Normal               |PT Enkripsi Teknologi Handal|847471364022000   |77                        |Normal                |