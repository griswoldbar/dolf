require 'rails_helper'

describe TargetCalculator do
  let(:calculator) { described_class.new(new_session, old_session) }
  let(:min_reps) { 6 }
  let(:max_reps) { 12 }
  let(:drill)       { build(:drill, min_reps: min_reps, max_reps: max_reps)  }
  let(:new_session) { build(:drill_session, drill: drill)  }
  let(:starting_weight) { Dolf.config["starting_weight"] }
  let(:increment) { Dolf.config["weight_increment"] }
  context "when no previous drill session is passed" do
    # let(:exercise)    { build(:exercise) }
    let(:old_session) { nil }

    it "returns the starting weight value" do
      expect(calculator.weight).to eql(starting_weight)
    end

    it "returns the minimum reps from the new drill session" do
      expect(calculator.reps).to eql(min_reps)
    end
  end

  context "when a previous drill session is passed" do
    let(:weight) { 10 }
    let(:old_session) { build(:drill_session, drill: drill, reps: reps, weight: weight) }

    context "and it meets the min reps" do
      let(:reps) { min_reps }
      it "returns the old weight" do
        expect(calculator.weight).to eql(weight)
      end

      it "increases the reps by 1" do
        expect(calculator.reps).to eql(reps + 1)
      end
    end

    context "and it is between the min and max" do
      let(:reps) { min_reps + 1 }
      it "returns the old weight" do
        expect(calculator.weight).to eql(weight)
      end

      it "increases the reps by 1" do
        expect(calculator.reps).to eql(reps + 1)
      end
    end

    context "and it meets the max" do
      let(:reps) { max_reps }
      it "raises the weight" do
        expect(calculator.weight).to eql(weight + increment)
      end

      it "returns the min reps" do
        expect(calculator.reps).to eql(min_reps)
      end
    end

    context "and it exceeds the max" do
      let(:reps) { max_reps + 1 }
      it "raises the weight" do
        expect(calculator.weight).to eql(weight + increment)
      end

      it "returns the min reps" do
        expect(calculator.reps).to eql(min_reps)
      end
    end

    context "and it is less than the min" do
      let(:reps) { min_reps - 1 }
      it "drops the weight" do
        expect(calculator.weight).to eql(weight - increment)
      end

      it "returns the min reps" do
        expect(calculator.reps).to eql(min_reps)
      end
    end
  end
end