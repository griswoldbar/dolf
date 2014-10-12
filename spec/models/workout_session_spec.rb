require 'rails_helper'

describe WorkoutSession do
  let(:torture) { create(:drill) }
  let(:pain) { create(:drill) }
  let(:agony) { create(:drill) }

  let(:workout_session_1) do
    create(:workout_session).tap do |ws|
      ws.drill_sessions << build(:drill_session, drill: torture, weight: 5, reps: 6)
      ws.drill_sessions << build(:drill_session, drill: pain, weight: 7.5, reps: 4)
      ws.drill_sessions << build(:drill_session, drill: agony, weight: 10, reps: 12)
    end
  end

  let(:workout_session_2) do
    create(:workout_session).tap do |ws|
      ws.drill_sessions << build(:drill_session, drill: torture, weight: 5, reps: 9)
      ws.drill_sessions << build(:drill_session, drill: pain, weight: 5, reps: 5)
      ws.drill_sessions << build(:drill_session, drill: agony, weight: 15, reps: 7)
    end
  end

  describe "#absolute_score" do
    it "is a function of the weight and reps of all of the drill sessions" do
      expect(workout_session_1.absolute_score).to eq(180)
    end
  end

  describe "#relative_score" do
    it "is 0 if there is no other workout" do
      expect(workout_session_1.relative_score).to eq(0)
    end

    it "is a function of the weight and reps of all of the drill sessions compared with the previous workout session" do
      workout_session_2.workout = workout_session_1.workout
      expect(workout_session_2.relative_score).to eq(-5)
    end
  end
end