#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/logic.rb'

class Game < Tictactoe

  def start
    puts '************************************************************'
    puts '*                Please enter player 1 name                *'
    puts '************************************************************'
    @players.push(gets.chomp)
    puts '************************************************************'
    puts '*                Please enter player 2 name                *'
    puts '************************************************************'
    @players.push(gets.chomp)
  end

  def show_board
    puts '************************************************************'
    puts '                         ___________                                     '
    puts '                        |           |                                     '
    puts "                        | #{@board[0]} | #{@board[1]} | #{@board[2]} |         "
    puts '                        | --------- |                          '
    puts "                        | #{@board[3]} | #{@board[4]} | #{@board[5]} |         "
    puts '                        | --------- |                         '
    puts "                        | #{@board[6]} | #{@board[7]} | #{@board[8]} |         "
    puts '                        |___________|                                     '
    puts ''
    puts '************************************************************'
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
        puts '************************************************************'
        puts "*     please #{@players[1]} enter a number between 1-9     *"
        puts '************************************************************'
      @move = gets.chomp
      if @used.include?(@move.to_i)  
        puts 'that spot is already taken'
      elsif (@move.respond_to?(:to_i) == false) || @move.to_i > 9 || @move.to_i < 1 
        puts 'thats and invalid answer'
      else
        @used.push(@move.to_i)
        @p2_move.push(@move.to_i)
        @turn += 1
        @board[@move.to_i - 1] = 'O'
      end
    end
      else
      @check = @turn
      while @check == @turn
        puts '************************************************************'
        puts "*     please #{@players[0]} enter a number between 1-9     *"
        puts '************************************************************'
      @move = gets.chomp
        if @used.include?(@move.to_i)
          puts '************************************************************'
          puts '*               that spot is already taken                 *'
          puts '************************************************************'
        elsif (@move.respond_to?(:to_i) == false) || @move.to_i > 9 || @move.to_i < 1
          puts '************************************************************'
          puts '*                thats and invalid answer                  *'
          puts '************************************************************'
        else
        @used.push(@move.to_i)
        @p1_move.push(@move.to_i)
        @turn += 1
        @board[@move.to_i - 1] = 'X'
      end
    end
    end
  end
  def look
    if @win1 == true
      puts '************************************************************'
      puts '*                player 1 is the winner                    *'
      puts '************************************************************'
    elsif @win2 == true
      puts '************************************************************'
      puts '*                player 2 is the winner                    *'
      puts '************************************************************'
    elsif @draw == true
      puts '************************************************************'
      puts '*                   this is a nice Draw                    *'
      puts '************************************************************'
    end  
  end
end

party = Game.new
party.start
party.show_board 
while party.wining == false && party.to_draw == false
  party.player_turn
  party.action
  party.show_board
  party.check
  party.look
end
