Class {
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#category : #'Cuoora-UI'
}

{ #category : #'private protocol' }
LoginComponent >> login [
]

{ #category : #rendering }
LoginComponent >> renderContentOn: html [
	html
		form: [ html paragraph: [ html textInput on: 'username' of: self ].
			html paragraph: [ html textInput on: 'password' of: self ].
			html button
				callback: [ self login ];
				with: 'Iniciar Sesion' ]
]
