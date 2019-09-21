# frozen_string_literal: true

require './lib/telegram_bot'
require './lib/money_bot'

money_bot = MoneyBot.new
settings = YAML.safe_load(File.read('./config/settings.yml'))
telegram_bot = TelegramBot.new(settings: settings)
telegram_bot.send_message(money_bot.rate('USD'))
