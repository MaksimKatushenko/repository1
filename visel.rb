class Game

	def initialize(word)
		@letters = get_letters(word)

		@errors = 0

		@good_letters = []
		@bad_letters = []

		@status = 0
    end

    def get_letters(word)
    	if (word == nil || word == "")
		    abort "Вы не ввели слово для игры"
	    end

        return word.split("")
    end

    # 1.спросить букву с консоли
    # 2. проверить результат
    def ask_next_letter
    	puts "\n Введите следующую букву"

    	letter = ""

    	while letter == "" do
    		letter = STDIN.gets.encode("UTF-8").chomp   		
    	end
    
        next_step(letter)
    end

    # Метод next_step должен проверить наличие буквы в слове
    # Или среди уже названных букв
    # Аналог метода check_result
    def next_step(bukva)
        if @status == -1 || @status == 1
        	return        
    end

    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
    	return
    end

    if @letters.include?(bukva)

    	@good_letters << bukva

    	if @good_letters.size == @letters.uniq.size
    		status = 1
    	end

    else
    	@bad_letters << bukva 

    	@errors += 1

    	    if @errors >= 7
    	 	@status = -1
    	    end
        end
    end

    def letters
        @letters
    end

    def good_letters
        @good_letters
    end

    def bad_letters
        @bad_letters
    end

    def status
        @status
    end

    def errors
        @errors
    end
end