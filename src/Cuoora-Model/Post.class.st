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
Post >> addCalificationOf: anAuthor isLike: aLike [
	califications at: anAuthor put: (Calification like: aLike)
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
Post >> dateAndTime [
	^ dateTime
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
	califications := Dictionary new
]

{ #category : #initialization }
Post >> isLikeCalificationOf: anAuthor [
	^ (califications at: anAuthor ifAbsent: [ nil ])
		ifNotNil: [ :calification | calification like ]
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
Post >> removeCalificationOf: anAuthor [
	califications removeKey: anAuthor
]
