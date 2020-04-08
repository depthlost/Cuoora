Class {
	#name : #Calification,
	#superclass : #Object,
	#instVars : [
		'like',
		'dateTime',
		'author'
	],
	#category : #'Cuoora-Model'
}

{ #category : #initialization }
Calification class >> author: anAuthor like: aLike [
	^ self new author: anAuthor like: aLike
]

{ #category : #initialization }
Calification >> author [
	^ author
]

{ #category : #initialization }
Calification >> author: anAuthor like: aLike [
	author := anAuthor.
	like := aLike
]

{ #category : #initialization }
Calification >> initialize [
	dateTime := DateAndTime now
]

{ #category : #initialization }
Calification >> like [
	^ like
]
