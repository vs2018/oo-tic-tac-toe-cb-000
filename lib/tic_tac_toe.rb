class TicTacToe
  
  def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move (index, character)
  @board[index] = character
end

def valid_move?(index)
  if(index < 0 || index > 8)
    return false
  elsif((index >= 0 || index < 9) && !(position_taken?(index)))
    return true
  end
end

def position_taken?(index)
  if(@board[index] == " " || @board[index] == "" || @board[index] == nil)
    return false
  else
    return true
  end
end

def turn
  puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  until valid_move?(index) do
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    break
  end
  character = current_player
  move(index,character)
  display_board
end

def turn_count
  counter = 0
  @board.each do |element|
    if(element == "X" || element == "O")
      counter += 1
    end
  end
  return counter
end

def current_player
  if(turn_count == 0)
    return "X"
  elsif(turn_count % 2 != 0)
    return "O"
  else
    return "X"
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = @board[win_combination[0]]
    position_2 = @board[win_combination[1]]
    position_3 = @board[win_combination[2]]
    if(position_1 == "X" && position_2 == "X" && position_3 == "X")
      return win_combination
    end
    if(position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
  return false
end

def full?
  full = false
  @board.each do |element|
    if(element == "X" || element == "O")
      full = true
    else
      full = false
    end
  end
  return full
end

def draw?
  if(!won? && full?)
    return true
  else
    return false
  end
end

def over?
  if(won? || full? || draw?)
    return true
  else
    return false
end
end

def winner
  if(won?)
    if(@board[won?[0]] == "X")
      return "X"
    else
      return "O"
    end
  end
end

def play
  until over? do
  turn
  end
  if(won?)
    puts "Congratulations #{winner}!"
  elsif(draw?)
    puts "Cat's Game!"
  end
end
  
  
  
  
  
  
  
  
  
  
  
end
