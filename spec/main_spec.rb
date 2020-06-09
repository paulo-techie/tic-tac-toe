require 'spec_helper.rb'
require './lib/logic.rb'

describe Tictactoe do
    let(:tictactoe) {Tictactoe.new}
    let(:condition) {}
    
    describe 'initialize' do
        it 'initializes the board variables' do
            expect(tictactoe.board).to eql([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
        end

        it 'initializes the turn' do
            expect(tictactoe.turn).to eql(1)
        end

        it 'initializes the win for player 1' do
            expect(tictactoe.win1).to eql(false)
        end

        it 'initializes the win for player 2' do
            expect(tictactoe.win2).to eql(false)
        end

        it 'initializes the variable for draw check' do
            expect(tictactoe.draw).to eql(false)
        end

        it 'initializes the initial answer' do
            expect(tictactoe.answer).to eql('')
        end
    end

    describe 'check' do
        it 'checks if turn is greater than 9' do
            expect(tictactoe.turn>9).to eql(false)
        end
    end


end
