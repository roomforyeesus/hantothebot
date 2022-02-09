require 'telegram_bot'

token = '5137644332:AAGjfq93gDi2BmjbnOk4yAtFTMCaYw5ubX4'

bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username|: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /start/i
      reply.text = "all i do is say what'sup bitch. try /greet hoe"
    when /greet/i
      reply.text = "Hello, #{message.from.first_name}."
    else
      reply.text = "ionno kno #{command.inspect} mufuka, try that shit again"
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
