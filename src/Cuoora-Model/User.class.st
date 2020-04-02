Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'following',
		'followers',
		'topicsOfInterest',
		'questions',
		'answers',
		'username',
		'password',
		'dateTime'
	],
	#category : #'Cuoora-Model'
}

{ #category : #'instance creation' }
User class >> username: anUsername password: aPassword [
	^ self new username: anUsername password: aPassword
]

{ #category : #adding }
User >> addAnswer: anAnswer [
	^ answers add: anAnswer
]

{ #category : #adding }
User >> addFollower: aFollower [
	^ followers add: aFollower
]

{ #category : #adding }
User >> addQuestion: aQuestion [
	^ questions add: aQuestion
]

{ #category : #adding }
User >> addTopicOfInterest: aTopic [
	^ topicsOfInterest add: aTopic
]

{ #category : #adding }
User >> answers [
	^ answers
]

{ #category : #adding }
User >> follow: aUser [
	^ following add: aUser
]

{ #category : #adding }
User >> getRelevantQuestions [
	^ topicsOfInterest do: [ :each | each questions ]
]

{ #category : #adding }
User >> initialize [
	followers := OrderedCollection new.
	following := OrderedCollection new.
	answers := OrderedCollection new.
	questions := OrderedCollection new.
	topicsOfInterest := OrderedCollection new.
	dateTime := DateAndTime now
]

{ #category : #adding }
User >> questions [
	^ questions
]

{ #category : #adding }
User >> removeAnswer: anAnswer [
	^ answers remove: anAnswer
]

{ #category : #adding }
User >> removeQuestion: aQuestion [
	^ questions remove: aQuestion
]

{ #category : #adding }
User >> username: anUsername password: aPassword [
	username := anUsername.
	password := aPassword
]
