json.id feed.id.to_s
json.(feed, :game_id)
json.(feed, :user_id)
json.(feed, :hours)
json.(feed, :minutes)
json.(feed, :activity)
json.created_at feed.created_at
json.updated_at feed.updated_at
