require './lib/player.rb'
require './lib/match.rb'
require './lib/tournament.rb'

namespace :examples do

  task :all => [:example_one]

  tournament = Tournament.new
  p1 = Player.new("Bill")
  p2 = Player.new("Bob")
  p3 = Player.new("Jim")
  p4 = Player.new("Jon")
  p5 = Player.new("Jack")
  p6 = Player.new("Ed")
  p7 = Player.new("Mark")
  p8 = Player.new("Joe")

  task :example_one do

    tournament.add_player(p1)
    tournament.add_player(p2)
    tournament.add_player(p3)
    tournament.add_player(p4)
    tournament.add_player(p5)
    tournament.add_player(p6)
    tournament.add_player(p7)
    tournament.add_player(p8)

    tournament.build_tournament

    p tournament.log_winner(0, p2)
    p tournament.log_winner(0, p4)
    p tournament.log_winner(0, p5)
    p tournament.log_winner(0, p7)

    p tournament.log_winner(1, p2)
    p tournament.log_winner(1, p7)

    p tournament.log_winner(2, p7)

    # p "Winner is #{tournament.rounds[-2]}"

    p "round one: #{tournament.rounds.first}"
    p "matches = #{tournament.rounds.first.size}"
    p "#################"
    p "semi-finals: #{tournament.rounds[1]}"
    p "maches = #{tournament.rounds[1].size}"
    p "#################"
    p "final: #{tournament.rounds.last}"
    p "matches = #{tournament.rounds.last.size}"
    p "#################"

    p "Champion is #{tournament.champion}"

  end

end
