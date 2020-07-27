# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/player.rb'

# PlayGame module holding the game possible wins.
module PlayGame
  POSSIBLE_WINS = [
    [1, 2, 3], [4, 5, 6],
    [7, 8, 9], [1, 4, 7],
    [2, 5, 8], [3, 6, 9],
    [3, 5, 7], [1, 5, 9]
  ].freeze

  # check if array includes give element.
  class CheckArr
    def does_contain?(arr)
      arr.all? { |el| include?(el) }
    end
  end

  def self.won?(player)
    POSSIBLE_WINS.any? { |element| player.choices.does_contain?(element) }
  end
end

def name_players
  name = gets.chomp
  name = gets.chomp while name.empty

  name
end

def go_player(player)
  puts "#{player.name} select (in range 1..9) a number to make a move >> "
  choice = gets.chomp.strip.to_i
  choice_result = player.make_move(choice)
  while choice_result != choice
    puts choice_result
    choice = gets.chomp.strip.to_i
  end
end

def announce_winner?(player)
  if PlayGame.won?(player)
    puts "Congatulations #{player.name} you've won the game!!"
    return true
  end
  false
end

puts 'First player please state your name >> '
first_player = Player.new(name_players, 'X')

puts 'Second player please enter your name >> '
first_player = Player.new(name_players, 'X')

puts "Game's gonna be between #{fist_player.name} (X) & #{second_player} (O). Good luck!!!"

loop do
  replay = false
  game_on = 0
  sleep(2)
  while game_on < 9
    puts Boad.update_board
    game_on(first_player)
    puts Board.update_board
    break if announce_winner?(first_player)

    game_on += 1
    break if game_on > 8

    puts Boad.update_board
    game_on(first_player)
    puts Board.update_board
    break if announce_winner?(second_player)

    game_on += 1
  end
  puts 'Game over & it is a draw' if game_on > 8
  puts 'Do you wish to replay? (Y/N) >> '
  answer = gets.chomp.upcase
  replay = true if answer == 'Y'
  Board.reset_board
  first_player.reset_choices
  second_player.reset_choices
  break unless replay
end
