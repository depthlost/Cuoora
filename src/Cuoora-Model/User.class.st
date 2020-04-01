Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'following',
		'followers',
		'topicsOfInterest',
		'questions',
		'answers',
		'userName',
		'password',
		'dateTime'
	],
	#category : #'Cuoora-Model'
}

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
User >> follow: aUser [
	^ following add: aUser
]

{ #category : #adding }
User >> getRelevantQuestions [
	^ topicsOfInterest do: [ :each | each questions ]
]

{ #category : #adding }
User >> questions [
	^ questions
]
