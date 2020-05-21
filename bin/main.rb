#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/player'

class Tictactoe
  attr_accessor :board, :players

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @players = []
  end

  def start
    puts "enter player 1 name"
    @players.push(gets.chomp)
    puts "enter player 2 name"
    @players.push(gets.chomp)
  end

  def show_board
    puts "#{@board[0]} #{@board[1]} #{@board[3]}"
    puts "#{@board[4]} #{@board[5]} #{@board[6]}"
    puts "#{@board[7]} #{@board[8]} #{@board[9]}"
  end
end