require_relative '../switch/argument.rb'
require 'rspec'
require 'rspec/expectations'
describe Argument do
    context 'Given Source and Destination' do
        it 'Should return Help to be true' do
            argument = Argument.new 
            result = argument.commandDictionary('--help', '')
            expect(result[:help]).to be true
        end
        it 'Should return File Path' do
            argument = Argument.new 
            result = argument.commandDictionary('--file', './inputs/routes.csv')
            expect(result[:path]).to eq './inputs/routes.csv'
        end
        it 'Should return Source Argument' do
            argument = Argument.new 
            result = argument.commandDictionary('--source', 'A')
            expect(result[:source]).to eq 'A'
        end
        it 'Should return Destination Argument' do
            argument = Argument.new 
            result = argument.commandDictionary('--destination', 'B')
            expect(result[:destination]).to eq 'B'
        end

        it 'Should return Destination Argument' do
            argument = Argument.new 
            result = argument.commandDictionary('--start', '')
            expect(result).to be nil
        end
    end
end