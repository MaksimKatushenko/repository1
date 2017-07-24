require "./visel.rb"
require "./result.rb"


printer = Result.new

word = ARGV[0]

if (Gem.win_platform? && ARGV[0])
	word = word.encode(ARGV[0].encoding, "cp1251").encode("UTF-8")
end

game = Game.new(word)


while game.status == 0 do	
	printer_print_status(game)
	game.ask_next_letter
end

printer_print_status(game)
