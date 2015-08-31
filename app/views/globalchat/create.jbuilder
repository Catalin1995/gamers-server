json.code 200
json.body do |json|
  json.partial! 'globalchat', globalchat: @chat
end
