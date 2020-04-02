Class {
	#name : #CuooraComponent,
	#superclass : #WAComponent,
	#category : #'Cuoora-UI'
}

{ #category : #'as yet unclassified' }
CuooraComponent >> createUser [

]

{ #category : #'private protocol' }
CuooraComponent >> login [
]

{ #category : #rendering }
CuooraComponent >> renderContentOn: aCanvas [
	aCanvas button
		callback: [ self createUser ];
		with: 'Crear nuevo usuario'.
		
	aCanvas paragraph.
	
	aCanvas button 
		callback: [ self login ];
		with: 'Iniciar sesion'
]
