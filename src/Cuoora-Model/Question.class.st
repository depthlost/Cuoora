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
		sort:
			[ :answerOne :answerTwo | answerOne calculateScore > answerTwo calculateScore ]
]

{ #category : #initialization }
Question >> initialize [
	super initialize.
	answers := OrderedCollection new.
]

{ #category : #accessing }
Question >> remove [
	answers do: [ :answer | answer removeFromAuthor ].
	topics do: [ :topic | topic removeQuestion: self ].
	author removeQuestion: self
]

{ #category : #accessing }
Question >> removeAnswer: anAnswer [
	^ answers remove: anAnswer.
]

{ #category : #accessing }
Question >> title [
	^ title
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
