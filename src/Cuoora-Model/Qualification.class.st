Class {
	#name : #Qualification,
	#superclass : #Object,
	#instVars : [
		'like',
		'dateTime',
		'author'
	],
	#category : #'Cuoora-Model'
}

{ #category : #initialization }
Qualification class >> author: anAuthor like: aLike [
	^ self new author: anAuthor like: aLike
]

{ #category : #initialization }
Qualification >> author [
	^ author
]

{ #category : #initialization }
Qualification >> author: anAuthor like: aLike [
	author := anAuthor.
	like := aLike
]

{ #category : #initialization }
Qualification >> initialize [
	dateTime := DateAndTime now
]

{ #category : #initialization }
Qualification >> like [
	^ like
]
