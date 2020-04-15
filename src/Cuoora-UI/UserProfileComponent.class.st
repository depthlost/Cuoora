Class {
	#name : #UserProfileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user'
	],
	#category : #'Cuoora-UI'
}

{ #category : #'instance creation' }
UserProfileComponent class >> with: anUser [
	^ self new with: anUser
]

{ #category : #rendering }
UserProfileComponent >> renderContentOn: html [
	html header: 'Preguntas de ', user username.
	self renderQuestionsOn: html
]

{ #category : #rendering }
UserProfileComponent >> renderQuestionsOn: html [
	user questions
		do:
			[ :each | self call: (QuestionComponent post: each changeComponent: self) ]
]

{ #category : #'instance creation' }
UserProfileComponent >> with: anUser [
	user := anUser
]
