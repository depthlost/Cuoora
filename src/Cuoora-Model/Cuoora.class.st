Class {
	#name : #Cuoora,
	#superclass : #Object,
	#instVars : [
		'users',
		'topics'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Cuoora-Model'
}

{ #category : #accessing }
Cuoora class >> clearInstance [
	instance := nil
]

{ #category : #accessing }
Cuoora class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #adding }
Cuoora >> addTopic: aTopic [
	^ topics add: aTopic
]

{ #category : #adding }
Cuoora >> addUser: anUser [
	^ users add: anUser
]

{ #category : #initialization }
Cuoora >> initialize [
	users := OrderedCollection new.
	topics := OrderedCollection new
]

{ #category : #adding }
Cuoora >> topics [
	^ topics
]

{ #category : #adding }
Cuoora >> topics: topicsNames [
	^ topics select: [ :topic | topicsNames includes: topic name ]
]

{ #category : #adding }
Cuoora >> userWithUsername: anUsername andPassword: aPassword [
	^ users
		detect: [ :user | user username = anUsername & (user password = aPassword) ]
		ifNone: [ nil ]
]

{ #category : #adding }
Cuoora >> users [
	^ users
]
