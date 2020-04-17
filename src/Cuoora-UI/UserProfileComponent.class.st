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
UserProfileComponent >> follow [
	self session user follow: user
]

{ #category : #rendering }
UserProfileComponent >> renderContentOn: html [
	html strong: 'Preguntas de ' , user username.
	self session user ~= user
		ifTrue: [ html space.
			self renderFollowUserOn: html ].
	html break.
	self renderQuestionsOn: html
]

{ #category : #rendering }
UserProfileComponent >> renderFollowUserOn: html [
	(self session user isFollowingTo: user)
		ifTrue: [ html text: 'Siguiendo' ]
		ifFalse: [ html anchor
				callback: [ self follow ];
				with: 'Seguir' ]
]

{ #category : #rendering }
UserProfileComponent >> renderQuestionsOn: html [
	user questions
		do:
			[ :each | html render: (QuestionComponent with: each andChangeComponent: self) ]
		separatedBy: [ html horizontalRule ]
]

{ #category : #'instance creation' }
UserProfileComponent >> with: anUser [
	user := anUser
]
