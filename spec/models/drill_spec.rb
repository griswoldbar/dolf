require 'rails_helper'

describe Drill do
  describe ":position" do
    let(:workout) { create(:workout) }
    let(:drill1) { create(:drill, workout: workout) }
    let(:drill2) { create(:drill, workout: workout) }

    it "is scoped sequentially by workout" do
      expect(drill1.position).to eq(1)
      expect(drill2.position).to eq(2)
    end
  end
end