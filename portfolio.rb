require_relative 'stock'
require_relative 'helpers'

class Portfolio
    attr_accessor :stocks
    attr_reader :end_value, :begin_value

    DEFAULT_STOCKS_QTY = 5

    def initialize
        @stocks = Array.new(DEFAULT_STOCKS_QTY) { Stock.new }
        @begin_value = 0.0
        @end_value = 0.0
    end

    # @param from [String]
    # @param to [String]
    # @return [Hash]
    def profit(from, to)
        calculate_totals(from, to)

        {
            total_return_rate: Helpers.to_percentage(total_return_rate),
            annualized_return: Helpers.to_percentage(annualized_return(from, to))
        }
    end

    private

    # @param from [String]
    # @param to [String]
    def calculate_totals(from, to)
        @stocks.each do |stock|
            @begin_value += stock.price(from)
            @end_value += stock.price(to)
        end
    end

    # @param from [String]
    # @param to [String]
    # @return [Integer]
    def time_period(from, to)
        Date.parse(to).year - Date.parse(from).year
    end

    # @return [Float]
    def total_return_rate
        @total_return_rate ||= Helpers.calculate_total_return_rate(@begin_value, @end_value)
    end

    # @return [Float]
    def annualized_return(from, to)
        @annualized_return ||= Helpers.calculate_annualized_return(total_return_rate, time_period(from, to))
    end
end
