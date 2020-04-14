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
	html textInput on: 'username' of: self.
	html textInput on: 'password' of: self.
	html button 
		callback: [ self login ];
		with: 'Iniciar Sesion'
]
