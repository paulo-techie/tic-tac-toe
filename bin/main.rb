#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/player'

class Tictactoe
  attr_accessor :board, :players, :turn, :p1_move, :p2_move

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @players = []
    @turn = 1 
    @p1_move = []
    @p2_move = []
    @move = ""
    @used = []
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
      puts "please #{@players[1]} enter a number between 1-9"
      @move = gets.chomp
      if @used.include?(@move)  
        puts "that spot is already taken"
      elsif (@move.respond_to?(:to_i) == false) || @move.to_i > 9 || @move.to_i < 1 
        puts "thats and invalid answer"
      else
        @used.push(@move.to_i)
        @p2_move.push(@move.to_i)
        @turn += 1
      end
      else
      puts "please #{@players[0]} enter a number between 1-9"
      @move = gets.chomp
      if @used.include?(@move)  
        puts "that spot is already taken"
      elsif (@move.respond_to?(:to_i) == false) || @move.to_i > 9 || @move.to_i < 1 
        puts "thats and invalid answer"
      else
        @used.push(@move.to_i)
        @p1_move.push(@move.to_i)
        @turn += 1
      end
    end
end
