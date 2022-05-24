# Task

Construct a simple Portfolio class that has a collection of Stocks and a "Profit" method that receives 2 dates and returns the profit of the Portfolio between those dates. Assume each Stock has a "Price" method that receives a date and returns its price.
Bonus Track: make the Profit method return the "annualized return" of the portfolio between the given dates.

Using:

- 16 historical `records` per stock with dates from today only incrementing one year at a time (2022 ~> 2037) and random prices from `1.5` to `20`
- 5 stocks as initial collection

## Formulas

```bash

Total return date: (ending_value - beginning_value) / beginning_value
Annualized return: (1 + total_return_rate) ** (1.0 / (time_period)) - 1

```

## Test

```bash

$ irb
$ require_relative 'portfolio'
$ portfolio = Portfolio.new
$ portfolio.profit("2022-05-24", "2037-05-24")

```

```diff
+ {:total_return_rate=>"45.62%", :annualized_return=>"5.52%"}
```
