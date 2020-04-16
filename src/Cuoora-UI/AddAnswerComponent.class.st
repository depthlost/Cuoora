Class {
	#name : #AddAnswerComponent,
	#superclass : #WAComponent,
	#instVars : [
		'question'
	],
	#category : #'Cuoora-UI'
}

{ #category : #services }
AddAnswerComponent class >> question: aQuestion [
	^ self new question: aQuestion
]

{ #category : #callbacks }
AddAnswerComponent >> addAnswer [
	(self call: NewAnswerComponent new)
		ifNotNil:
			[ :answerDescription | self session user addAnswer: answerDescription answerTo: question ]
]

{ #category : #accessing }
AddAnswerComponent >> question: aQuestion [
	question := aQuestion
]

{ #category : #rendering }
AddAnswerComponent >> renderContentOn: html [
	html
		text: 'No hay mas respuestas';
		break.
	html anchor
		callback: [ self addAnswer ];
		with: 'Agregar Respuesta'
]
