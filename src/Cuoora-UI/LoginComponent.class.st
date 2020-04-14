"
|application|
application := WAAdmin register: LoginComponent asApplicationAt: '/cuoora'.
application sessionClass: UserSession.

|userPedro userDiego userJuan questionPedro questionDiego|

userPedro := User username: 'pedro@cuoora.com' password: 'pedro@cuoora.com'.
userDiego := User username: 'diego@cuoora.com' password: 'diego@cuoora.com'.
userJuan := User username: 'juan@cuoora.com' password: 'juan@cuoora.com'.

userJuan follow: userDiego.
userPedro follow: userJuan.

questionPedro := userPedro addQuestion: '¿Para qué sirve el método SetUp?' description: '' topics: (Cuoora instance topics: #('OO1' 'Test de unidad')).

userDiego addAnswer: 'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de cada test.' answerTo: questionPedro.

questionDiego := userDiego addQuestion: '¿Qué significa #messageNotUnderstood?' description: '' topics: (Cuoora instance topics: #('OO1' 'Smalltalk')).

userPedro addAnswer: 'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.' answerTo: questionDiego.

Cuoora clearInstance.
Cuoora instance addUser: userPedro;
	addUser: userDiego;
	addUser: userJuan.
"
Class {
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'username',
		'password'
	],
	#category : #'Cuoora-UI'
}

{ #category : #'private protocol' }
LoginComponent >> login [
	| userSession |
	userSession := Cuoora instance
		userWithUsername: self username
		andPassword: self password.
	self password: nil.
	userSession ifNil: [ ^ self ].
	self session user: userSession.
	self call: (SessionComponent bodyComponent: HomeComponent new).
]

{ #category : #accessing }
LoginComponent >> password [
	^ password
]

{ #category : #accessing }
LoginComponent >> password: aPassword [
	password := aPassword
]

{ #category : #rendering }
LoginComponent >> renderContentOn: html [
	html
		form: [ html
				paragraph: [ html label: 'Usuario: '.
					html textInput
						required;
						on: #username of: self ].
			html
				paragraph: [ html label: 'Contraseña: '.
					html passwordInput
						required;
						on: #password of: self ].
			html button
				callback: [ self login ];
				with: 'Iniciar Sesion' ]
]

{ #category : #accessing }
LoginComponent >> username [
	^ username
]

{ #category : #accessing }
LoginComponent >> username: anUsername [
	username := anUsername
]
