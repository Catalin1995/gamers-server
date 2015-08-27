json.code 200
json.body do |json|
  json.partial! 'feed', collection: @feeds, as: :feed
end
