# frozen_string_literal: true

require 'russian_central_bank'

Money.locale_backend = :currency
bank = Money::Bank::RussianCentralBank.new

Money.default_bank = bank

# Load today's rates
bank.update_rates

p Money.new(1_00, 'USD').exchange_to('RUB').format
