require 'minitest/autorun'

require_relative '../lib/currency.rb'

class CurrencyTest < Minitest::Test

  def test_existance
    assert(Currency)
  end

  def test_adding
    currency1 = Currency.new(1.50, "USD")
    currency2 = Currency.new(1.50, "USD")
    combined_currency = currency1 + currency2
    assert_equal(Currency.new(3.0, "USD"), combined_currency)
  end

  def test_different_currencies_cannot_be_added
    currency1 = Currency.new(1.50, "USD")
    currency2 = Currency.new(1.50, "AUS")
    combined_currency = currency1 + currency2
    assert_equal(nil, combined_currency)
  end
end
