# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#r= Residence.create(name: 'Barilochense', image: 'http://aff.bstatic.com/images/hotel/max500/388/38823640.jpg',description: 'bypass', province: 'Neuquen',country: 'Argentina',location: 'cerro catedral 123', cost: 1512, people_amount: 3, reserved: true)
#r1= Residence.create(name: 'La Anonima',  image: 'https://www.codigopoker.com/wp-content/uploads/2012/10/Casino-Club-Santa-Rosa-Interior.jpg',description: 'tiene el ombu', province: 'La Pampa, America del sur, La tierra, Via lactea',location:'pio 12 1526',country: 'Argentina', cost: 1512, people_amount: 3)
#r2= Residence.create(name: 'Bosquecito', image: 'https://i.pinimg.com/originals/17/68/1c/17681c6b45ac340bd2d9cb4fac363254.jpg',description: 'ntc gato', province: 'BSAS',country: 'Argentina',location: '60 y 118', cost: 1512, people_amount: 3, reserved: true)
#r3= Residence.create(name: 'Gonné', image: 'https://upload.wikimedia.org/wikipedia/commons/f/fc/Estaci%C3%B3n_Peter_Pan_de_la_Rep%C3%BAblica_de_los_Ni%C3%B1os.jpg',description: 'tincho ', province: 'Neuquen',country: 'Argentina',location: '480 1520', cost: 1512, people_amount: 3)

#r= Residence.create(name: 'Barilochense', image: 'http://aff.bstatic.com/images/hotel/max500/388/38823640.jpg', description: 'Cabañas en la montaña', province: 'Neuquen',country: 'Argentina',location: 'cerro catedral 123', cost: 1512, people_amount: 3)
#r1= Residence.create(name: 'La Anonima',image: 'https://www.codigopoker.com/wp-content/uploads/2012/10/Casino-Club-Santa-Rosa-Interior.jpg', description: 'Casa muy linda, con canchas de futbol', province: 'La Pampa, America del sur, La tierra, Via lactea',location:'pio 12 1526',country: 'Argentina', cost: 1512, people_amount: 3)
#r2= Residence.create(name: 'Bosquecito',image: 'https://i.pinimg.com/originals/17/68/1c/17681c6b45ac340bd2d9cb4fac363254.jpg', description: 'Hostel en el bosque de la ciudad de la plata', province: 'BSAS',country: 'Argentina',location: '60 y 118', cost: 1512, people_amount: 3)
#r3= Residence.create(name: 'Gonnet', image: 'https://upload.wikimedia.org/wikipedia/commons/f/fc/Estaci%C3%B3n_Peter_Pan_de_la_Rep%C3%BAblica_de_los_Ni%C3%B1os.jpg', description: 'Casa con pileta, y gran patio', province: 'Neuquen',country: 'Argentina',location: '480 1520', cost: 1512, people_amount: 3)
#r4=Residence.create(name: 'AT&T Center', image:'https://www.omnihotels.com/-/media/images/hotels/satwat/activities/satwat-mokara-hotel-and-spa-att-center.jpg?h=660&la=en&w=1170', description: 'Hotel con vista al gran estadio de San Antonio', province:'San Antonio', country:'Estados Unidos', location:'TX 78219', cost:2000, people_amount: 5)

ut = UserType.create(userType: "Administrador")
ut = UserType.create(userType: "Estándar")
ut = UserType.create(userType: "Premium")
ut = UserType.create(userType: "SuperAdministrador")

u=User.create(name: 'Luis', last_name: 'Ventura', email: 'luisi@gmail.com', password: '123456', genre: 'masculino', age: 52, user_type: 4, card_number: "4598423654912035", card_SC: "456")
u1=User.create(name: 'Dardo', last_name: 'Fuseneco', email: 'dardo@gmail.com', password: '123456', genre: 'masculino', age: 49, user_type: 2,card_number: "78651205023545812", card_SC: "456")
#u=User.create(name: 'Mari', last_name: 'Fuseneco', email: 'mariaelenaf@gmail.com', password: 'rusia145', genre: 'femenino', age: 45, user_type: 3, card_number: "4565987845650235")
#u=User.create(name: 'Cristina', last_name: 'Perez', email: 'crisperez@gmail.com', password: 'RodolfoTelefe', genre: 'femenino', age: 51, user_type: 3, card_number: "4565236578981545")
#u=User.create(name: 'Guillermo', last_name: 'Francella', email: 'francellaactuacion@gmail.com', password: 'actuacionCineTeatro', genre: 'masculino', age: 52, user_type: 3, card_number: "7802654230219875")

