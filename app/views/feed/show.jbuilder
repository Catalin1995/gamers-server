json.code 200
json.body do |json|
  json.partial! 'feed', feed: @feed
end
