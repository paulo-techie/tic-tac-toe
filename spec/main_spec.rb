require 'spec_helper.rb'
require './lib/logic.rb'
require './lib/player.rb'
require './bin/main.rb'

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

describe Player do
    let(:player) {Player.new("doe", [])}
    
    describe 'initialize' do
        it 'initialize player name' do
            expect(player.name).to eql("doe")
        end

        it 'initialize player move with array' do
            expect(player.move).to be_a(Array)
        end
    end
end

describe Game do
    let(:game) {Game.new}
    # let(:turn1) {4}
    # let(:turn2) {5}

    describe 'start' do
        it 'should receive player names' do
            expect(game.start).to be_a(Player)
        end
    end

    describe 'show_board' do
        it 'print a string representing the board layout' do
            expect(game.show_board).to be(nil)
        end
    end

    describe 'player_turn' do
        it 'return string showing the player whose turn it is' do
            expect(game.player_turn).to be_instance_of(NilClass)
        end
    end
    
end