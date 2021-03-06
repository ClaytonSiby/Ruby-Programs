require_relative '../lib/board.rb'
require_relative '..\lib\player.rb'

# determine if an array includes given elements.
class Array
  def contain_all?(arr)
    arr.all? { |elem| include?(elem) }
  end
end

# PlayGame module holding the game possible wins.
module PlayGame
  POSSIBLE_WINS = [
    [1, 2, 3], [4, 5, 6],
    [7, 8, 9], [1, 5, 9],
    [2, 5, 8], [3, 5, 7],
    [1, 4, 7], [3, 6, 9]
  ].freeze

  def self.won?(player)
    POSSIBLE_WINS.any? { |elem| player.choices.contain_all?(elem) }
  end
end

def name_players
  name = gets.chomp
  name = gets.chomp while name.empty?

  name
end

def go_player(player)
  puts "#{player.name} select (in range 1..9) a number to make a move >> "
  choice = gets.chomp.strip.to_i
  choice_result = player.my_move(choice)
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
second_player = Player.new(name_players, 'O')

puts "Game's gonna be between #{first_player.name} (X) & #{second_player.name} (O). Good luck!!! \n\n"

loop do
  game_over = false
  count = 0
  while count < 9
    go_player(first_player)
    puts Board.update_board
    break if announce_winner?(first_player)

    count += 1
    break if count >= 9

    go_player(second_player)
    puts Board.update_board
    break if announce_winner?(second_player)

    count += 1
  end
  puts Board.game_draw if count >= 9
  break unless game_over
end
