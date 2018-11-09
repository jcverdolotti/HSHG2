# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
r= Residence.create(name: 'bariloche', description: 'bypass', location: 'Neuquen', cost: 1512, people_amount: 3, reserved: true)
r1= Residence.create(name: 'starosa', description: 'tiene el ombu', location: 'La Pampa, Argentina, America del sur, La tierra, Via lactea', cost: 1512, people_amount: 3)
r2= Residence.create(name: 'lp', description: 'ntc gato', location: 'Neuquen', cost: 1512, people_amount: 3, reserved: true)
r3= Residence.create(name: 'gonnet', description: 'tincho ', location: 'Neuquen', cost: 1512, people_amount: 3)
