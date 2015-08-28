json.code 200
json.body do |json|
  json.partial! 'globalchat', collection: @chats, as: :globalchat
end
