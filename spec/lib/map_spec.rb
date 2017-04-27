require 'spec_helper'
require 'map'
require 'path'

RSpec.describe Map do
  shared_examples 'run moves' do |moves:, exp_x:, exp_y:|
    context "for #{moves}" do
      subject(:map) { described_class.new }

      it 'go to coords' do
        moves.map { |raw_move| Move.new(raw_move) }.each do |move|
          map.go(move)
        end
        expect(map.coordinate.x).to eq(exp_x)
        expect(map.coordinate.y).to eq(exp_y)
      end
    end
  end

  include_examples 'run moves', moves: ['R2', 'L3'], exp_x: 3, exp_y: 2
  include_examples 'run moves', moves: ['R2', 'R2', 'R2'], exp_x: -2, exp_y: 0
  include_examples 'run moves', moves: ['R5', 'L5', 'R5', 'R3'], exp_x: 2, exp_y: 10

  describe '#distance' do
    subject(:map) { described_class.new }

    it 'pass on the way' do
      map.run
      expect(map.distance).to eq(239)
    end
  end
end