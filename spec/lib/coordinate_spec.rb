require 'spec_helper'
require 'coordinate'

RSpec.describe Coordinate do
  describe '#distance' do
    shared_examples 'calculation distance' do |from:, to:, exp_distance:|
      context "distance from (#{from.x}, #{from.y}) to (#{to.x}, #{to.y})" do
        subject(:coordinate) { from }

        it "returns #{exp_distance}" do
          expect(coordinate.distance(to)).to eq(exp_distance)
        end
      end
    end

    include_examples 'calculation distance', from: Coordinate.new,
                     to: Coordinate.new(50, 50), exp_distance: 100
    include_examples 'calculation distance', from: Coordinate.new(-100, -100),
                     to: Coordinate.new(0, 10), exp_distance: 210
    include_examples 'calculation distance', from: Coordinate.new(-15, -15),
                     to: Coordinate.new(5, 5), exp_distance: 40
  end

  describe '#move' do
    shared_examples 'moving one axis' do |axis:, distance:, exp_x:, exp_y:|
      context "moving on #{axis.to_s.upcase} axis" do
        subject(:coordinate) { described_class.new(0, 0) }

        axis_direction = distance.positive? ? 'positive' : 'negative'
        it "moves #{distance.abs} on #{axis.to_s.upcase} axis " \
          "in #{axis_direction} direction" do
          c = coordinate.change(axis, distance)
          expect(c.x).to eq(exp_x)
          expect(c.y).to eq(exp_y)
        end
      end
    end

    shared_examples 'moving both axis' do |axis1:, distance1:, axis2:,
        distance2:, exp_x:, exp_y:|
      context 'moving on both axis' do
        subject(:coordinate) { described_class.new(0, 0) }

        it "moves #{distance1} on #{axis1.to_s.upcase} and " \
          "#{distance2} on #{axis2.to_s.upcase}" do
          c = coordinate.change(axis1, distance1).change(axis2, distance2)
          expect(c.x).to eq(exp_x)
          expect(c.y).to eq(exp_y)
        end
      end
    end

    include_examples 'moving one axis', axis: :x, distance: 5, exp_x: 5, exp_y: 0
    include_examples 'moving one axis', axis: :x, distance: -10, exp_x: -10, exp_y: 0
    include_examples 'moving one axis', axis: :y, distance: 5, exp_x: 0, exp_y: 5
    include_examples 'moving one axis', axis: :y, distance: -10, exp_x: 0, exp_y: -10

    include_examples 'moving both axis', axis1: :x, distance1: 100, axis2: :y,
                     distance2: 100, exp_x: 100, exp_y: 100
    include_examples 'moving both axis', axis1: :y, distance1: -10, axis2: :x,
                     distance2: 5, exp_x: 5, exp_y: -10
  end
end