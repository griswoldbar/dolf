require 'rails_helper'

describe TargetCalculator do
  let(:calculator) { described_class.new(new_session, old_session) }

  context "when no previous drill session is passed" do
    let(:drill)       { FactoryGirl.build(:drill, min_reps: 23)  }
    let(:new_session) { FactoryGirl.build(:drill_session, drill: drill)  }
    let(:old_session) { nil }

    it "returns the starting weight value" do
      expect(calculator.weight).to eql(Dolf.config["starting_weight"])
    end

    it "returns the minimum reps from the new drill session" do
      expect(calculator.reps).to eql(23)
    end
  end
end