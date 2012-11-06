class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	raise NoSuchStrategyError unless game[0].length == 2 and game[1].length == 2
	raise NoSuchStrategyError unless game[0][1] =~ /^[RPS]$/ and game[1][1] =~ /^[RPS]$/
	
	return game[0] unless (game[0][1] == "P" and game[1][1] == "S") or 
						  (game[0][1] == "S" and game[1][1] == "R") or
						  (game[0][1] == "R" and game[1][1] == "P")
    return game[1]
end

def rps_tournament_winner(tournament)
	return rps_game_winner(tournament) unless tournament[0][1] !~ /^[RPS]$/
	return rps_tournament_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
end
