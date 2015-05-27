class NotCurrency       < StandardError; end
class WrongCurrencyCode < StandardError; end
class Currency
  attr_reader :value, :currency_code

  def initialize(value, currency_code)
    @value = value
    @currency_code = currency_code
  end

  def ==(other)
    other.is_a?(Currency) &&
    other.currency_code == @currency_code &&
    other.value == @value
  end

  def +(other)
    if other.is_a?(Currency) &&
      other.currency_code == @currency_code
      amt = @value + other.value
      Currency.new(amt, other.currency_code)
    end
  end

  def -(other)
    raise NotCurrency unless other.is_a?(self.class)
    raise WrongCurrencyCode unless other.currency_code == @currency_code
    Currency.new(@value - other.value, @currency_code)
  end

  def *(other)
    puts other.class
    case other.class
    when Fixnum
      return Currency.new(@value * other, @currency_code)
    when Float
      return Currency.new(@value.to_f * other, @currency_code)
    when Currency
      return Currency.new(@value * other.value, @currency_code)
    end
  end
end
