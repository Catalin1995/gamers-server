json.code 200
json.body do
  json.available do |json|
    json.partial! 'feed', collection: @feeds[0], as: :feed
  end
  json.unavailable do |json|
    json.partial! 'feed', collection: @feeds[1], as: :feed
  end
end
