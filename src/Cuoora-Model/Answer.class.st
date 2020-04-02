Class {
	#name : #Answer,
	#superclass : #Post,
	#instVars : [
		'question'
	],
	#category : #'Cuoora-Model'
}

{ #category : #'as yet unclassified' }
Answer class >> author: anAuthor question: aQuestion description: aDescription [
	^ (self author: anAuthor description: aDescription)
		question: aQuestion
]

{ #category : #accessing }
Answer >> question [
"Este metodo deberia ser totalmente innecesario"
	^ question
]

{ #category : #accessing }
Answer >> question: aQuestion [
"Settea la pregunta a la que corresponde esta respuesta, y añade a la misma (respuesta) a la coleccion de la pregunta"
	question := aQuestion.
	question addAnswer: self
]

{ #category : #accessing }
Answer >> remove [
	"Delega la responsabilidad de borrar a la respuesta de las colecciones correspondientes"

	author removeAnswer: self.
	question removeAnswer: self
]

{ #category : #accessing }
Answer >> respondsTo: aUser [
	^ question author == aUser
]
