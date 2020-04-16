Class {
	#name : #NewAnswerComponent,
	#superclass : #WAComponent,
	#instVars : [
		'question'
	],
	#category : #'Cuoora-UI'
}

{ #category : #rendering }
NewAnswerComponent >> renderContentOn: html [
	| answer |
	answer := Answer new.
	self renderQuestionOn: html.
	html space.
	html
		form: [ html
				paragraph: [ html label: 'RESPONDER '.
					html textInput on: #description of: answer ] ]
]

{ #category : #rendering }
NewAnswerComponent >> renderQuestionOn: html [
	self call: (QuestionComponent post: question changeComponent: self)
]
