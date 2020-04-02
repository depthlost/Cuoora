Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'description',
		'dateTime',
		'qualifications',
		'author'
	],
	#category : #'Cuoora-Model'
}

{ #category : #initialization }
Post class >> author: anAuthor description: aDescription [
	^ self new author: anAuthor description: aDescription
]

{ #category : #initialization }
Post >> author [
"Devuelve el autor de un post"
	^ author
]

{ #category : #initialization }
Post >> author: anAuthor description: aDescription [
"Settea el autor y la descripcion del post"
	author := anAuthor.
	description := aDescription
]

{ #category : #initialization }
Post >> initialize [
	dateTime := DateAndTime now.
	qualifications := OrderedCollection new
]

{ #category : #initialization }
Post >> remove [
	^ self subclassResponsibility
]
