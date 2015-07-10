json.code 200
json.body do |json|
  json.partial! 'game', collection: @all, as: :game
end
