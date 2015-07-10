json.code 200
json.body do |json|
  json.partial! 'game', game: @game
end
