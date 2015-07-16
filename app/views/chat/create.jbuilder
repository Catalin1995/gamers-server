json.code 200
json.body do |json|
  json.partial! 'chat', collection: @chat_game, as: :chat
end
