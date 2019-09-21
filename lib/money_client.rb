# frozen_string_literal: true

require 'russian_central_bank'

# Central bank rate
class MoneyClient
  def initialize
    Money.locale_backend = :currency
    bank = Money::Bank::RussianCentralBank.new
    Money.default_bank = bank
    bank.update_rates
  end

  def rate(currency)
    Money.new(1_00, currency).exchange_to('RUB').format
  end
end
