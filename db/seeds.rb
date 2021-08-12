administrador = Rol.create(nombre: "administrador")
cliente = Rol.create(nombre: "cliente")
visitante = Rol.create(nombre: "visitante")

Usuario.create(correo: "henry.gomez@ogr.cl", password: "123456", rol: administrador, rut: "18.527.306-7")


