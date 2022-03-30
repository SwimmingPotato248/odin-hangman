require 'pry-byebug'

class Hangman
    attr_reader :key, :guess

    def initialize
        @key = []
        @display = []
    end

    def generate_key
        word_list = []

        File.open('google-10000-english-no-swears.txt').readlines.each do |word|
            word_list.push(word.chomp)
        end
        
        while @key.length < 5 || @key.length > 12
            @key = word_list.sample.split("")
        end

        @display = Array.new(@key.length, "_")
    end

    def play_game
        lives = 6
        generate_key()
        guessed = []
        while lives > 0 && @display != @key do
            puts " "
            puts @display.join(" ")
            puts "Make your guess"
            puts "Incorrect guesses left: #{lives}"
            puts "Guessed letters: #{guessed.sort.join(" ")}"
            guess = gets.chomp
            guessed.push(guess)
            if !@key.include?(guess)
                lives -= 1
            else
                @key.length.times do |i|
                    if @key[i] == guess
                        @display[i] = guess
                    end
                end
            end
        end
        if lives == 0
            puts "Game over!"
            puts @display.join(" ")
            puts @key.join
        else
            puts @display.join()
            puts "You win."
        end
    end
end

game = Hangman.new
game.play_game