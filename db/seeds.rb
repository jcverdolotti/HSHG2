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

ut = UserType.create(userType: "Administrador")
ut = UserType.create(userType: "Estándar")
ut = UserType.create(userType: "Premium")

u=User.create(name: 'Pepe', last_name: 'Argento', email: 'peperacing@gmail.com', password: 'chevy123', genre: 'masculino', age: 52, user_type: 2, card_number: "4598423654912035")
u1=User.create(name: 'Dardo', last_name: 'Fuseneco', email: 'mariteamo@gmail.com', password: 'mGustaLaNoche', genre: 'masculino', age: 49, user_type: 2,card_number: "78651205023545812")
u=User.create(name: 'Mari', last_name: 'Fuseneco', email: 'mariaelenaf@gmail.com', password: 'rusia145', genre: 'femenino', age: 45, user_type: 3, card_number: "4565987845650235")
u=User.create(name: 'Cristina', last_name: 'Perez', email: 'crisperez@gmail.com', password: 'RodolfoTelefe', genre: 'femenino', age: 51, user_type: 3, card_number: "4565236578981545")
u=User.create(name: 'Guillermo', last_name: 'Francella', email: 'francellaactuacion@gmail.com', password: 'actuacionCineTeatro', genre: 'masculino', age: 52, user_type: 3, card_number: "7802654230219875")

