# frozen_string_literal: true

require 'telegram/bot'
require 'socksify'

# Telegram bot with settings for send message
class TelegramBot
  def initialize(settings:)
    TCPSocket.socks_server = settings['socks_server']
    TCPSocket.socks_port = settings['socks_port']
    TCPSocket.socks_username = settings['socks_username']
    TCPSocket.socks_password = settings['socks_password']
    @client = Telegram::Bot::Client
    @chat_bot_token = settings['chat_bot_token']
    @bot_token = settings['bot_token']
  end

  def send_message(message)
    client.run(bot_token) { |bot| bot.api.send_message(chat_id: chat_bot_token, text: message) }
  end

  private

  attr_reader :client, :chat_bot_token, :bot_token
end
