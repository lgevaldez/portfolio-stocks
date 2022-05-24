class Helpers
    # @param beginning_value [Float]
    # @param ending_value [Float]
    # @return [Float]
    def self.calculate_total_return_rate(beginning_value, ending_value)
        (ending_value - beginning_value) / beginning_value
    end

    # @return [Complex]
    def self.calculate_annualized_return(total_return_rate, time_period)
        (1 + total_return_rate.to_f) ** (1.0 / (time_period.to_f)) - 1
    end

    # @param value [Float]
    # @return [String]
    def self.to_percentage(value)
        "#{(value * 100).round(2)}%"
    end
end
