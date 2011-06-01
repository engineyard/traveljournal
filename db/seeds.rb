# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

cities = City.create([
  { :name => "Chattanooga" },
  { :name => "Chicago" },
  { :name => "Cincinnati" },
  { :name => "San Francisco" },
  { :name => "New York City" },
  { :name => "Dallas" },
  { :name => "Oklahoma City" },
  { :name => "Portland" }
])
