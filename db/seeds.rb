# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: 'admin@example.com', username: 'admin', password: 'password', password_confirmation: 'password')
User.create!(email: 'ionut@example.com', username: 'ionut', password: 'password', password_confirmation: 'password')
User.create!(email: 'catalin@example.com', username: 'catalin', password: 'password', password_confirmation: 'password')

Game.create!(category: 'FPS', name: 'Battlefield')
Game.create!(category: 'FPS', name: 'Call of Duty')
Game.create!(category: 'FPS', name: 'Counter Strike')

Game.create!(category: 'MMORPG', name: 'Aion Online')
Game.create!(category: 'MMORPG', name: 'Cabal Online')
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
