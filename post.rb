require "pony"
require "io/console"

my_mail = "maks040796@mail.ru"

puts "Введите пароль от вашей почты #{my_mail} для отправки письма:"
pass = STDIN.noecho(&:gets).chomp

puts "Кому отправить письмо?"
send_to = STDIN.gets.chomp

puts "Что написать в письме?"
body = STDIN.gets.chomp

begin

Pony.mail(
{
	:subject => "привет из руби!",
	:body => body,
	:to => send_to,
	:form => my_mail,

	:via => :smtp,
	:via_options => {
		          :address => 'smtp.mail.ru',
		          :port => '465',
		          :tls => true,
		          :user_name => my_mail
		          :pass => pass,
		          :authentication => :plain
		      }
}

    )
rescue
  puts "Не удалось отправить письмо"
ensure
  puts "Попытка отправки письма закончена"
end

puts "Письмо успешно отправлено!"