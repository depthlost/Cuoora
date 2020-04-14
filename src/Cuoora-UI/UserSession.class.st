Class {
	#name : #UserSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'Cuoora-UI'
}

{ #category : #accessing }
UserSession >> user [
	^ user
]

{ #category : #accessing }
UserSession >> user: anUser [
	user := anUser
]
