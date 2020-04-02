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
	^ question
]

{ #category : #accessing }
Answer >> question: aQuestion [
	question := aQuestion.
	question addAnswer: self
]

{ #category : #accessing }
Answer >> remove [
	author removeAnswer: self.
	question removeAnswer: self
]

{ #category : #accessing }
Answer >> respondsTo: aUser [
	^ question author == aUser
]
