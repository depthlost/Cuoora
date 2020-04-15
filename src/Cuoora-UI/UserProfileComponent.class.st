Class {
	#name : #UserProfileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user'
	],
	#category : #'Cuoora-UI'
}

{ #category : #rendering }
UserProfileComponent >> renderContentOn: html [
	html header: 'Preguntas de ' + self session user.
	self renderQuestionsOn: html
]

{ #category : #rendering }
UserProfileComponent >> renderQuestionsOn: html [
	user questions
		do:
			[ :each | self call: (QuestionComponent post: each changeComponent: self) ]
]
