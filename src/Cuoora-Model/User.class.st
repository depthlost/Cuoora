Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'following',
		'followers',
		'interestTopics',
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
User >> addAnswer: aDescription answerTo: question [
	^ answers
		add: (Answer author: self question: question description: aDescription)
]

{ #category : #adding }
User >> addFollower: aFollower [
	^ followers add: aFollower
]

{ #category : #adding }
User >> addInterestTopic: aTopic [
	^ interestTopics add: aTopic
]

{ #category : #adding }
User >> addQuestion: aTitle description: aDescription topics: someTopics [
	^ questions
		add:
			(Question
				author: self
				title: aTitle
				description: aDescription
				topics: someTopics)
]

{ #category : #adding }
User >> answers [
	^ answers
]

{ #category : #adding }
User >> calculateScore [
	^ questions size * 20
		+ (questions sumNumbers: [ :question | question calculateScore ])
		+ (self getAnswersToOtherUsers size * 50)
		+ (answers sumNumbers: [ :answer | answer calculateScore ])
]

{ #category : #adding }
User >> follow: aUser [
	aUser addFollower: self.
	^ following add: aUser
]

{ #category : #adding }
User >> followers [
	^ followers
]

{ #category : #adding }
User >> following [
	^ following
]

{ #category : #adding }
User >> getAnswersToOtherUsers [
	^ answers reject: [ :answer | answer respondsTo: self ]
]

{ #category : #adding }
User >> getRelevantQuestions [
	^ (following collect: [ :user | user questions ])
		, (interestTopics collect: [ :topic | topic questions ])
		flatCollectAsSet: [ :question | question ]
]

{ #category : #adding }
User >> initialize [
	followers := OrderedCollection new.
	following := OrderedCollection new.
	answers := OrderedCollection new.
	questions := OrderedCollection new.
	interestTopics := OrderedCollection new.
	dateTime := DateAndTime now
]

{ #category : #adding }
User >> interestTopics [
	^ interestTopics
]

{ #category : #accessing }
User >> password [
	^ password
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

{ #category : #accessing }
User >> username [
	^ username
]

{ #category : #adding }
User >> username: anUsername password: aPassword [
	username := anUsername.
	password := aPassword
]
