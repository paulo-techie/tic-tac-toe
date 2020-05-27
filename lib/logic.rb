require_relative './player.rb'
class Tictactoe
  attr_reader :player1, :player2, :board, :turn, :p1_move, :p2_move, :win1, :win2, :draw, :answer

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @turn = 1
    @move = ''
    @used = []
    @win1 = false
    @win2 = false
    @win = false
    @draw = false
    @condition = [[1, 2, 3], [1, 4, 7], [1, 5, 9], [2, 5, 8], [3, 5, 7], [3, 6, 9], [4, 5, 6], [7, 8, 9]]
    @answer = ''
  end

  def check
    if @condition.include?(@player1.move.sort!)
      @win1 = true
      @win = true
    elsif @condition.include?(@player2.move.sort!)
      @win2 = true
      @win = true
    end
    return unless @turn > 9

    @draw = true
  end
end
