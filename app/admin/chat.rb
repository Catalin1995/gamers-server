ActiveAdmin.register Chat do
permit_params :id, :user, :content, :game_id

filter :id
filter :username
filter :content
filter :game_id
filter :created_at
end
