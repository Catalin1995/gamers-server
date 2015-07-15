json.code 200
# json.body 'asd'
# do |json|
  # json.partial! 'user', user: @user
# end
json.body do |json|
  json.partial! 'user', user: @user
end
