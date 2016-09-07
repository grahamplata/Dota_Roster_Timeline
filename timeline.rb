#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'
require 'erb'

# Read JSON from a file
file = File.read('rosters.json')
data_hash = JSON.parse(file)

#generating proper english based on event given
def player_action(input)
  if input == "Released from team"
    return input.insert(0, 'was ').downcase
  elsif input == "Automatically dropped (Sub)"
    return input = "was automatically dropped"
  elsif input == "Left the team"
    return input.insert(0, 'has ').downcase
  elsif input == "Joined the team"
    return input.downcase
  else
    return input
  end
end

#iterate through hash
data_hash.each do |key|
  player = key['player_name']
  team = key['team_name']
  teamID = key['team_id']
  date = key['date']
  time = key['time']
  action = key['action']

  #debugging lines
  puts player + " " + player_action(action) + ": #{team}" + " on " + date + " on " + time
#  puts '-' * 20
end
