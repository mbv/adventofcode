require 'spec_helper'
require 'direction'


context 'direction coefficients' do
  shared_examples 'direction coefficients' do |dir:, axis:, value:|
    context "for #{dir}" do
      subject(:direction) { dir }

      axis_direction = value.positive? ? 'positive' : 'negative'
      it "moves #{value.abs} step(s) on #{axis.to_s.upcase} axis in " \
          "#{axis_direction} direction" do
        expect(direction.coefficient.axis).to eq(axis)
        expect(direction.coefficient.value).to eq(value)
      end
    end
  end

  include_examples 'direction coefficients', dir: North, axis: :x, value: 1
  include_examples 'direction coefficients', dir: East, axis: :y, value: 1
  include_examples 'direction coefficients', dir: South, axis: :x, value: -1
  include_examples 'direction coefficients', dir: West, axis: :y, value: -1
end

RSpec.describe Direction do
  context 'direction turns' do
    shared_examples 'direction turns' do |from:, to:, turn:|
      context "for #{from}" do
        subject(:direction) { from }

        it "turns #{turn} from #{from} to #{to}" do
          expect(direction.send(turn)).to eq(to)
        end
      end
    end

    include_examples 'direction turns', from: East, turn: :go_left, to: North
    include_examples 'direction turns', from: East, turn: :go_right, to: South

    include_examples 'direction turns', from: North, turn: :go_left, to: West
    include_examples 'direction turns', from: North, turn: :go_right, to: East

    include_examples 'direction turns', from: South, turn: :go_left, to: East
    include_examples 'direction turns', from: South, turn: :go_right, to: West

    include_examples 'direction turns', from: West, turn: :go_left, to: South
    include_examples 'direction turns', from: West, turn: :go_right, to: North
  end
end