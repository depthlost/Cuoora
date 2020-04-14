"
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
		form: [ html paragraph: [ html textInput on: #username of: self ].
			html paragraph: [ html textInput on: #password of: self ].
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
