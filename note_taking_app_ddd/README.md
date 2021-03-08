# An app to see Domain-Driven Design + Firebase Flutter in action

Note: You need to provide your own Firebase configuration files in order to run this.

This is a note taking app where you add todo's to your notes and you can give them colors to distinct them from other notes in your stream.

The app consists of four layers:
Presentation layers, this is actually the Flutter layer of widgets and states

Application layer, This layer orchetstrates all the other layers. It desides what to do with the data that flows through the app. It does not consist any complex business logic

Domain layer, This is the center of the app. This layer is fully self contained and does not depend on any other layers. All the other layers depend on this layer because here all the businesslogic will resides.

Infrastructure layer, This layer deals with the raw data from any kind of data source like Firebase, Api's local databases and device sensors

