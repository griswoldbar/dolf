Zone.destroy_all
DrillSession.destroy_all
Exercise.destroy_all
Workout.destroy_all

data = YAML.load_file("#{Rails.root}/db/seed_data.yml")
Zone.create(data["zones"])
Exercise.create(data["exercises"])
Workout.create(data["workouts"])