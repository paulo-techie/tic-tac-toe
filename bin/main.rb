#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/logic.rb'

class Game < Tictactoe

  def start
    puts '********************** TIC TAC TOE ***************************'
    puts '************************************************************'
    puts '                         ___________                                     '
    puts '                        |           |                                     '
    puts '                        | 1 | 2 | 3 |         '
    puts '                        | --------- |                          '
    puts '                        | 4 | 5 | 6 |         '
    puts '                        | --------- |                         '
    puts '                        | 7 | 8 | 9 |         '
    puts '                        |___________|                                     '
    puts ''
    puts '************************************************************'
    puts '* to play enter numbers (1-9) according to the board above *'
    puts '************************************************************'
    puts ''
    puts '************************************************************'
    puts '*                Please enter player 1 name                *'
    puts '************************************************************'
    @player1 = Player.new(gets.chomp)
    puts '************************************************************'
    puts '*                Please enter player 2 name                *'
    puts '************************************************************'
    @player2 = Player.new(gets.chomp)
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
      puts "this is #{@player2.name} turn"
    else
      puts "this is #{@player1.name} turn"
    end
  end
 
    def action 
    if @turn.even? 
      @check = @turn
      while @check == @turn
        puts "*     please #{@player2.name} enter a number between 1-9     *"
        puts '************************************************************'
      @move = gets.chomp
      if @used.include?(@move.to_i)  
        puts 'that spot is already taken'
      elsif (@move.respond_to?(:to_i) == false) || @move.to_i > 9 || @move.to_i < 1 
        puts 'thats an invalid answer'
      else
        @used.push(@move.to_i)
        @player2.move << @move.to_i
        @turn += 1
        @board[@move.to_i - 1] = 'O'
      end
    end
      else
      @check = @turn
      while @check == @turn
        puts "*     please #{@player1.name} enter a number between 1-9     *"
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
        @player1.move << @move.to_i
        @turn += 1
        @board[@move.to_i - 1] = 'X'
      end
    end
    end
  end
  def look
    if @win1 == true
      puts '************************************************************'
      puts "                #{@player1.name} is the winner                    "
      puts '************************************************************'
    elsif @draw == true
      puts '************************************************************'
      puts '*                this is a nice Draw                       *'
      puts '************************************************************'
    elsif @win2 == true
      puts '************************************************************'
      puts "                #{@player2.name} is the winner                    "
      puts '************************************************************'
    end  
  end
end

# party = Game.new
# party.start
# party.show_board 
# while party.win1 == false && party.draw ==false && party.win2 == false
#   party.player_turn
#   party.action
#   party.show_board
#   party.check
#   party.look
# end
