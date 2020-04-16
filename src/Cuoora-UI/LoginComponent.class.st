"
|application|
application := WAAdmin register: LoginComponent asApplicationAt: '/cuoora'.
application sessionClass: UserSession.
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
