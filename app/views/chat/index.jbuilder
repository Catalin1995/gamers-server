json.code 200
json.body do |json|
  json.partial! 'chat', collection: @chats, as: :chat
end
