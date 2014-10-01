# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

data = YAML.load_file("#{Rails.root}/db/seed_data.yml")

Zone.create(data["zones"])
Exercise.create(data["exercises"])
WorkoutBuilder.new.build_set(data["workouts"])