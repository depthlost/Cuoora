Class {
	#name : #Calification,
	#superclass : #Object,
	#instVars : [
		'like',
		'dateTime'
	],
	#category : #'Cuoora-Model'
}

{ #category : #initialization }
Calification class >> like: aLike [
	^ self new like: aLike
]

{ #category : #initialization }
Calification >> initialize [
	dateTime := DateAndTime now
]

{ #category : #initialization }
Calification >> like [
	^ like
]

{ #category : #initialization }
Calification >> like: aLike [
	like := aLike
]
