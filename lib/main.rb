class Hangman
    attr_reader :key

    def initialize
        @key = []
    end

    def generate_key
        word_list = []

        File.open('google-10000-english-no-swears.txt').readlines.each do |word|
            word_list.push(word.chomp)
        end
        
        while @key.length < 5 || @key.length > 12
            @key = word_list.sample.split("")
        end
    end

    
end

game = Hangman.new
game.generate_key
p game.key