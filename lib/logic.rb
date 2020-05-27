require_relative './player.rb'
win = false
draw = false
class Tictactoe
  attr_reader :players, :board, :turn, :p1_move, :p2_move, :win1, :win2, :answer

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @players = []
    @turn = 1
    @p1_move = []
    @p2_move = []
    @move = ''
    @used = []
    @win1 = false
    @win2 = false
    @condition = [[1, 2, 3], [1, 4, 7], [1, 5, 9], [2, 5, 8], [3, 5, 7], [3, 6, 9], [4, 5, 6], [7, 8, 9]]
    @answer = ''
    @repeat = true
  end

  def check
    if @condition.include?(@p1_move.sort)
      @win1 = true
      win = true
    elsif @condition.include?(@p2_move.sort)
      @win = true
      win = true
    end
    return unless @turn > 9

    draw = true
  end
end
