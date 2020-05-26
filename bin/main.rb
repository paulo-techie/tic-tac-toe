#!/usr/bin/env ruby
# frozen_string_literal: true

class Tictactoe
  attr_reader :players, :board, :turn, :p1_move, :p2_move

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @players = []
    @turn = 1 
    @p1_move = []
    @p2_move = []
    @move = ""
    @used = []
    $win = false
    $draw = false
    @condition = [[1, 2, 3], [1, 4, 7], [1, 5, 9], [2, 5, 8], [3, 5, 7], [3, 6, 9], [4, 5, 6], [7, 8, 9]]
  end

  def start
    puts "enter player 1 name"
    @players.push(gets.chomp)
    puts "enter player 2 name"
    @players.push(gets.chomp)
  end

  def show_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "---------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "---------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def player_turn
    if @turn.even? 
    puts "this is #{@players[1]} turn"
    else
    puts "this is #{@players[0]} turn"
    end
  end
 
    def action 
    if @turn.even? 
      @check = @turn
      while @check == @turn
      puts "please #{@players[1]} enter a number between 1-9"
      @move = gets.chomp
      if @used.include?(@move.to_i)  
        puts "that spot is already taken"
      elsif (@move.respond_to?(:to_i) == false) || @move.to_i > 9 || @move.to_i < 1 
        puts "thats and invalid answer"
      else
        @used.push(@move.to_i)
        @p2_move.push(@move.to_i)
        @turn += 1
        @board[@move.to_i - 1] =  "O"
      end
    end
      else
      @check = @turn
      while @check == @turn
      puts "please #{@players[0]} enter a number between 1-9"
      @move = gets.chomp
      if @used.include?(@move.to_i)  
        puts "that spot is already taken"
      elsif (@move.respond_to?(:to_i) == false) || @move.to_i > 9 || @move.to_i < 1 
        puts "thats and invalid answer"
      else
        @used.push(@move.to_i)
        @p1_move.push(@move.to_i)
        @turn += 1
        @board[@move.to_i - 1] =  "X"
      end
    end
    end
  end
  def look
    if @condition.include?(@p1_move.sort)
      puts "player 1 is the winner"
      $win = true
    elsif @condition.include?(@p2_move.sort)
      puts "player 2 is the winner"
      $win = true  
    elsif @turn > 9
      puts "this is a nice Draw"
      $draw = true
    end  
  end    
end

party = Tictactoe.new
party.start
party.show_board 
while $win == false && $draw == false
  party.action
  party.show_board
  party.look
end 