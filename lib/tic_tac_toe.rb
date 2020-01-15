class TicTacToe
  attr_accessor :board
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [1,4,7],
    [0,3,6],
    [2,5,8],
  ]
  
  def initialize
    @board = board || Array.new(9, " ")
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(string) 
      string.to_i - 1
  end 
    
  def move(index, token = "X")
    @board[index] = token
  end 
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" 
  end 
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end
  
  def turn_count
    @board.count { | token | token == "X" || token == "O" }
  end 
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O" 
  end 
  
  def turn
    puts "Choose between 1-9"
    input = gets.strip
    index = input_to_index(input)
     pl = current_player
       if valid_move?(index)
        move(index, pl)
        display_board
       else
      turn
    end
  end 
  
  def won?
    WIN_COMBINATIONS.each do | combinations |
     if @board[combinations[0]] == "X" && @board[combinations[1]] == "X" && @board[combinations[2]] == "X" || @board[combinations[0]] == "O" && @board[combinations[1]] == "O" && @board[combinations[2]] == "O"
     return combinations
    end 
   end 
   false
  end 
  
  def full?
    if index.between?(0, 8) == @board[index] == "X" || @board[index] == "O"
      true 
    end 
  end 
    
  
end 