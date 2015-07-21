# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def for_tests

#create users
User.create!(email: 'admin@example.com', username: 'admin', password: 'password', password_confirmation: 'password', admin: true)
user1 = User.create!(email: 'ionut@example.com', username: 'ionut', password: 'password', password_confirmation: 'password')
user2 = User.create!(email: 'catalin@example.com', username: 'catalin', password: 'password', password_confirmation: 'password')
User.create!(email: 'diana@example.com', username: 'diana', password: 'password', password_confirmation: 'password')
User.create!(email: 'test@example.com', username: 'test', password: 'password', password_confirmation: 'password')

#create games
game1 = Game.create!(category: 'FPS', name: 'Battlefield')
Game.create!(category: 'FPS', name: 'Call of Duty')
Game.create!(category: 'FPS', name: 'Counter Strike')

game2 = Game.create!(category: 'MMORPG', name: 'Aion Online')
game3 = Game.create!(category: 'MMORPG', name: 'Cabal Online')
Game.create!(category: 'MMORPG', name: 'Conquer Online')
Game.create!(category: 'MMORPG', name: 'Lineage 2')
Game.create!(category: 'MMORPG', name: 'Metin 2')
Game.create!(category: 'MMORPG', name: 'Minecraft')
Game.create!(category: 'MMORPG', name: 'Mu Online')
Game.create!(category: 'MMORPG', name: 'Silkroad Online')
Game.create!(category: 'MMORPG', name: 'World of Warcraft')

Game.create!(category: 'STRATEGY', name: 'Command & Conquer')
Game.create!(category: 'STRATEGY', name: 'StarCraft')
Game.create!(category: 'STRATEGY', name: 'Dota')
Game.create!(category: 'STRATEGY', name: 'Warcraft')
Game.create!(category: 'STRATEGY', name: 'League of Legends')

#create chats
Chat.create!(game_id: game1.id, user: 'ionut', content: 'foo')
Chat.create!(game_id: game1.id, user: 'catalin', content: 'continut')
Chat.create!(game_id: game1.id, user: 'catalin', content: 'test')
Chat.create!(game_id: game1.id, user: 'ionut', content: 'merge')
Chat.create!(game_id: game2.id, user: 'ionut', content: 'test2')
Chat.create!(game_id: game2.id, user: 'ionut', content: 'game')
Chat.create!(game_id: game2.id, user: 'catalin', content: 'bla bla bla')
Chat.create!(game_id: game2.id, user: 'ionut', content: 'asd')
Chat.create!(game_id: game1.id, user: 'ionut', content: 'foo')

#create feeds
Feed.create!(game_id: game1.id, user_id: user1.id, hours: 10, minutes: 10)
Feed.create!(game_id: game2.id, user_id: user2.id, hours: 5, minutes: 12)
Feed.create!(game_id: game1.id, user_id: user2.id, hours: 2, minutes: 33)
Feed.create!(game_id: game2.id, user_id: user1.id, hours: 1, minutes: 22)
Feed.create!(game_id: game3.id, user_id: user2.id, hours: 5, minutes: 15)

end

for_tests
