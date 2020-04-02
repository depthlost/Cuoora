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
Cuoora class >> instanceHHH [
	^ instance ifNil: [ instance := super new ]
]

{ #category : #accessing }
Cuoora class >> newHHH [
	^ self instance
]

{ #category : #adding }
Cuoora >> addTopic: aTopic [
"Metodo que añade un topico al sistema"
	^ topics add: aTopic
]

{ #category : #adding }
Cuoora >> addUser: aUser [
"Metodo que añade un usuario al sistema"
	^ users add: aUser
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
Cuoora >> users [
	^ users
]
