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
	^ answers add: anAnswer
]

{ #category : #accessing }
Question >> answers [
	^ answers
]

{ #category : #initialization }
Question >> initialize [
	super initialize.
	answers := OrderedCollection new.
]

{ #category : #accessing }
Question >> remove [
	answers do: [ :answer | answer remove ].
	topics do: [ :topic | topic removeQuestion: self ].
	author removeQuestion: self
]

{ #category : #accessing }
Question >> removeAnswer: anAnswer [
	^ answers remove: anAnswer
]

{ #category : #initialization }
Question >> title: aTitle topics: someTopics [
	title := aTitle.
	topics := someTopics.
	someTopics do: [ :topic | topic addQuestion: self ]
]

{ #category : #accessing }
Question >> topics [
	^ topics
]