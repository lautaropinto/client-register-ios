# Client Register

Esta aplicación permite registrar de a un cliente y visualizar la lista de los mismos. La misma fue desarrollada con Swift 5.4. 

## Correr el proyecto

Primero instalar las dependencias utilizando Cocoapods:

```
pod install
```

Luego abrir el archivo *client-register-ios.xcworkspace*

```
open client-register-ios.xcworkspace
```

O bien

```
pod install && open client-register-ios.xcworkspace
```
___

##### Features

- Inicio de sesión con Facebook
- Creación de cuenta e inicio de sesión (utilizando Firebase)
- Persistencia de clientes (utilizando Firebase Realtime Database)
- Registro de clientes
- Listado de clientes

##### Arquitectura

Se decidió utilizar MVC, intentando lograr escalabilidad y mantenibilidad con P.O.P *(Programación orientada a protocolos)*. La idea fue diseñar protocolos con implementación por defecto, de tal forma que el *Controller* (encargado de ejecutar nuestra logica de negocios segun MVC) tenga la menor carga posibile, dejando solo la responsabilidad de coordinar las interacciones del usuario con los respectivos casos de uso.

Como punto negativo de la solucion diseñada algunas implementaciones quedaron escondidas, sin poder chequear explicitamente en unit tests. Por falta de tiempo no se pudo arreglar este inconveniente.

##### Estructura de carpetas
- **CommonViews**: se colocaron las vistas utilizadas a lo largo de la aplicación.
- **Extensions**: se colocaron *extensions* utilizadas a lo largo de la aplicación.
- **UseCases**: se colocaron *protocols* referidos a casos de uso con con sus respectivas implementaciones.
- **Protocols**: se colocaron *protocols* no relacionados a un caso de uso en particular.
- **Scenes**: dentro de esta carpeta se encuentran las distintas escenas del a aplicación.
     - *Login*: inicio de sesion
     - *SignUp*: creacion de usuario
     - *Form*: ingreso de nuevo cliente
     - *ClientList*: listado de clientes

##### Unit tests

Debido a lo mencionado anteriormente, no se pudo lograr un coverage considerable. Para mejorar los tests siguiendo con P.O.P primeror hay que mejorar el diseño de los protocolos.

##### UX / UI
Se hizo el manejo de errores solo de algunos inputs. Queda para implementar en un futuro el manejo de errores de firebase login y signup. 

Tambien falta agregar validacion en el formulario para que no se puedan crear clientes vacíos.

La fecha de nacimiento del cliente actualmente se ingresa como texto plano, esto deberia ser un datepicker nativo.
