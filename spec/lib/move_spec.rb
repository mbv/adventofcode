require 'spec_helper'
require 'move'

RSpec.describe Move do
  shared_examples 'parse move' do |raw_move:, turn:, distance:|
    context "for #{raw_move}" do
      subject(:move) { described_class.new(raw_move) }

      it 'set turn' do
        expect(move.turn).to eq(turn)
      end

      it 'set distance' do
        expect(move.distance).to eq(distance)
      end
    end
  end

  include_examples 'parse move', raw_move: 'R111', turn: :right, distance: 111
  include_examples 'parse move', raw_move: 'L1', turn: :left, distance: 1
end