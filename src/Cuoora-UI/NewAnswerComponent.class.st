Class {
	#name : #NewAnswerComponent,
	#superclass : #WAComponent,
	#instVars : [
		'description'
	],
	#category : #'Cuoora-UI'
}

{ #category : #callbacks }
NewAnswerComponent >> accept [
	self answer: description
]

{ #category : #callbacks }
NewAnswerComponent >> cancel [
	self answer: nil
]

{ #category : #accessing }
NewAnswerComponent >> description [
	^ description
]

{ #category : #accessing }
NewAnswerComponent >> description: aDescription [
	description := aDescription
]

{ #category : #rendering }
NewAnswerComponent >> renderContentOn: html [
	html
		text: 'Responder';
		break.
	self renderDataInputOn: html
]

{ #category : #rendering }
NewAnswerComponent >> renderDataInputOn: html [
	html
		form: [ html textArea on: #description of: self.
			html break.
			html submitButton
				callback: [ self cancel ];
				with: 'Cancelar'.
			html space.
			html submitButton
				callback: [ self accept ];
				with: 'Aceptar' ]
]
