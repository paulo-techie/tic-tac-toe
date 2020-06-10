require 'spec_helper'
require './lib/logic'
require './lib/player'
require './bin/main'


describe Player do
    let(:player) {Player.new("doe", [])}
    
    describe 'initialize' do
        it 'initialize player name' do
            expect(player.name).to eql("doe")
        end
    end
end


describe Game do
    let(:condition) {}
    let (:player1) {Player.new('')}
    let (:player2) {Player.new('')}

    
    describe 'initialize' do
        it 'initializes the board variables' do
            expect(subject.board).to eql([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
        end

        it 'initializes the turn' do
            expect(subject.turn).to eql(1)
        end

        it 'initializes the win for player 1' do
            expect(subject.win1).to eql(false)
        end

        it 'initializes the win for player 2' do
            expect(subject.win2).to eql(false)
        end

        it 'initializes the variable for draw check' do
            expect(subject.draw).to eql(false)
        end

        it 'initializes the initial answer' do
            expect(subject.answer).to eql('')
        end
    end

    describe 'check' do
        it 'checks if turn is greater than 9' do
            expect(subject.turn>9).to eql(false)
        end
    end

    describe 'start' do
        it 'should receive player 1 name' do
            allow($stdin).to receive(:gets).and_return('joe')
            player1.name << $stdin.gets
            expect(player1.name).to eq('joe')
        end

        it 'should receive player 2 name' do
            allow($stdin).to receive(:gets).and_return('doe')
            player2.name << $stdin.gets
            expect(player2.name).to eq('doe')
        end

    end

    describe 'show_board' do
        it 'print a string representing the board layout' do
            expect(subject.show_board).to be(nil)
        end
    end

    describe 'player_turn' do
        it 'should show player 1 if turn is even' do
            expect(subject.player_turn).to output("gello")
        end
    end

end

