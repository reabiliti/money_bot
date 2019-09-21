# frozen_string_literal: true

require './lib/telegram_bot'
require './lib/money_client'

money_client = MoneyClient.new
settings = YAML.safe_load(File.read('./config/settings.yml'))
telegram_bot = TelegramBot.new(settings: settings)
telegram_bot.send_message(money_client.rate('USD'))
