require 'date'

class Stock
    INITIAL_PRICE = 1.5
    FINAL_PRICE = 20.0

    def initialize
        @historical = historical
    end

    # @param date [String]
    # @return [String]
    def price(date)
        @historical[date]
    end

    private

    # @return [Hash]
    def historical
        Array.new(16) do |index|
            {
                date: Date.today.next_year(index).to_s,
                price: rand(INITIAL_PRICE..FINAL_PRICE)
            }
        end.each_with_object({}) do |value, hash|
            hash[value[:date]] = value[:price]
        end
    end
end
