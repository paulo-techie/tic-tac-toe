#!/usr/bin/env ruby
# frozen_string_literal: true

class Tictactoe
    attr_reader :players, :board, :turn, :p1_move, :p2_move, :win1, :win2
  
    def initialize
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      @players = []
      @turn = 1 
      @p1_move = []
      @p2_move = []
      @move = ""
      @used = []
      @win1 = false
      @win2 = false
      $win = false
      $draw = false
      @condition = [[1, 2, 3], [1, 4, 7], [1, 5, 9], [2, 5, 8], [3, 5, 7], [3, 6, 9], [4, 5, 6], [7, 8, 9]]
    end

    def check
        if @condition.include?(@p1_move.sort)
            @win1 = true
            $win = true
        elsif @condition.include?(@p2_move.sort)
            @win  = true
            $win = true
        end
        if @turn > 9 
            $draw = true
        end
    end
end