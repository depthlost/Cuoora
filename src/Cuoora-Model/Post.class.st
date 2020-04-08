Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'description',
		'dateTime',
		'califications',
		'author'
	],
	#category : #'Cuoora-Model'
}

{ #category : #initialization }
Post class >> author: anAuthor description: aDescription [
	^ self new author: anAuthor description: aDescription
]

{ #category : #initialization }
Post >> addCalification: aCalification [
	^ califications add: aCalification
]

{ #category : #initialization }
Post >> author [
	^ author
]

{ #category : #initialization }
Post >> author: anAuthor description: aDescription [
	author := anAuthor.
	description := aDescription
]

{ #category : #initialization }
Post >> calculateScore [
	^ self getLikes - self getDislikes
]

{ #category : #initialization }
Post >> getDislikes [
	^ califications count: [ :calification | calification like not ]
]

{ #category : #initialization }
Post >> getLikes [
	^ califications count: [ :calification | calification like ]
]

{ #category : #initialization }
Post >> initialize [
	dateTime := DateAndTime now.
	califications := OrderedCollection new
]

{ #category : #initialization }
Post >> isLikeCalificationOf: anAuthor [
	^ califications
		detect: [ :calification | calification author == anAuthor ]
		ifFound: [ :calification | calification like ]
		ifNone: [ nil ]
]

{ #category : #initialization }
Post >> postedBy: anUser [
	^ author == anUser
]

{ #category : #initialization }
Post >> remove [
	^ self subclassResponsibility
]

{ #category : #initialization }
Post >> removeCalification: anAuthor [
	^ califications
		detect: [ :calification | calification author == anAuthor ]
		ifFound: [ :calification | califications remove: calification ]
		ifNone: [ nil ]
]

{ #category : #initialization }
Post >> setCalification: aCalification [
	self removeCalification: aCalification author.
	^ self addCalification: aCalification
]
