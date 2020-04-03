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
Post >> addQualification: aQualification [
	^ qualifications add: aQualification
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
	^ qualifications count: [ :qualification | qualification like not ]
]

{ #category : #initialization }
Post >> getLikes [
	^ qualifications count: [ :qualification | qualification like ]
]

{ #category : #initialization }
Post >> initialize [
	dateTime := DateAndTime now.
	qualifications := OrderedCollection new
]

{ #category : #initialization }
Post >> isLikeQualificationOf: anAuthor [
	^ qualifications
		detect: [ :qualification | qualification author == anAuthor ]
		ifFound: [ :qualification | qualification like ]
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
Post >> removeQualification: anAuthor [
	^ qualifications
		detect: [ :qualification | qualification author == anAuthor ]
		ifFound: [ :qualification | qualifications remove: qualification ]
		ifNone: [ nil ]
]

{ #category : #initialization }
Post >> setQualification: aQualification [
	self removeQualification: aQualification author.
	^ self addQualification: aQualification
]
