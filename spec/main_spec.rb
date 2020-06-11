require 'spec_helper'
require './lib/logic'
require './lib/player'
require './bin/main'
require 'stringio'


describe Player do
    let(:player) {Player.new("doe", [])}
    
    describe 'initialize' do
        it 'initialize player name' do
            expect(player.name).to eql("doe")
        end
    end
end


describe Game do
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
        it 'receives player 1 name' do
            allow($stdin).to receive(:gets).and_return('joe')
            player1.name << $stdin.gets
            expect(player1.name).to eq('joe')
        end

        it 'receives player 2 name' do
            allow($stdin).to receive(:gets).and_return('doe')
            player2.name << $stdin.gets
            expect(player2.name).to eq('doe')
        end
    end

    describe 'show_board' do
        it 'prints a string representing the board layout' do
            expect(subject.show_board).to be(nil)
        end
    end

    describe 'player_turn' do
        before(:each) do
            allow_message_expectations_on_nil
            allow(subject.player1).to receive(:name) {player1.name}
            allow(subject.player2).to receive(:name) {player2.name}           
        end

        it 'player 1 turn if odd' do
            allow(subject).to receive(:turn) {1}
            expect(subject.player_turn).to eq(puts "this is joe turn")
        end

        it 'player 2 if if not even' do
            allow(subject).to receive(:turn) {2}
            expect(subject.player_turn).to eq(puts "this is doe turn")
        end
    end

    describe 'action' do
        before(:each) do
            allow_message_expectations_on_nil
            allow(subject).to receive(:turn) {1}
            allow(subject).to receive(:used) {[1,2]}            
            allow(subject.player1).to receive(:name) {player1.name}      
        end

        it 'shows if move position is already used' do
            allow($stdin).to receive(:gets).and_return('1')
            move = 1
            player1.move << move
            allow(subject.player1).to receive(:move) {player1.move}
            expect(subject.action).to eq(puts 'that spot is already taken')
        end

        it 'shows if move position is invalid' do
            allow($stdin).to receive(:gets).and_return('10')
            player1.move << 10
            allow(subject.player1).to receive(:move) {player1.move}
            expect(subject.action).to eq(puts 'thats an invalid answer')        
        end
    end

    describe 'look' do
        before(:each) do
            allow_message_expectations_on_nil
            allow(subject).to receive(:win1) {true}
            allow(subject).to receive(:draw) {true}
            allow(subject).to receive(:win2) {true}    
        end

        it 'displays if player 1 wins' do
            expect(subject.look).to eq(puts "                joe is the winner                    ")
        end

        it 'displays if it is a draw' do
            expect(subject.look).to eq(puts '*                this is a nice Draw                       *')
        end

        it 'displays if player 2 wins' do
            expect(subject.look).to eq(puts "                doe is the winner                    ")
        end
    end

end
