json.code 200
json.body do |json|
  json.partial! 'user', collection: @users, as: :user
end
