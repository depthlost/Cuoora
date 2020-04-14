Class {
	#name : #MyExampleComponent,
	#superclass : #WAComponent,
	#category : #'Cuoora-UI'
}

{ #category : #rendering }
MyExampleComponent >> renderContentOn: html [
	html text: 'this is a example component!'
]
