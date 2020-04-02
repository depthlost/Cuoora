Class {
	#name : #Question,
	#superclass : #Post,
	#instVars : [
		'topics',
		'title',
		'answers'
	],
	#category : #'Cuoora-Model'
}

{ #category : #'as yet unclassified' }
Question class >> author: anAuthor title: aTitle description: aDescription topics: someTopics [
	^ (self author: anAuthor description: aDescription)
		title: aTitle
		topics: someTopics
]

{ #category : #accessing }
Question >> addAnswer: anAnswer [
"Añade una respuesta pasada como parametro a la coleccion de respuestas. Luego devuelve la respuesta añadida"
	^ answers add: anAnswer
]

{ #category : #accessing }
Question >> answers [
"Devuelve la coleccion de respuestas"
	^ answers
]

{ #category : #initialization }
Question >> initialize [
	super initialize.
	answers := OrderedCollection new.
]

{ #category : #accessing }
Question >> remove [
"author??????"
	answers do: [ :answer | answer remove ].
	topics do: [ :topic | topic removeQuestion: self ].
	author removeQuestion: self
]

{ #category : #accessing }
Question >> removeAnswer: anAnswer [
"Borra una respuesta de la coleccion de respuestas"
	^ answers remove: anAnswer
]

{ #category : #initialization }
Question >> title: aTitle topics: someTopics [
"Settea el titulo y topicos de la pregunta con valores pasados como parametro, y luego se añade al listado de preguntas de los topicos"
	title := aTitle.
	topics := someTopics.
	someTopics do: [ :topic | topic addQuestion: self ]
]

{ #category : #accessing }
Question >> topics [
"Devuelve los topicos (es redundante creo)"
	^ topics
]
