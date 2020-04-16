Class {
	#name : #QuestionDetailComponent,
	#superclass : #WAComponent,
	#instVars : [
		'question',
		'addAnswerComponent'
	],
	#category : #'Cuoora-UI'
}

{ #category : #services }
QuestionDetailComponent class >> question: aQuestion [
	^ self new question: aQuestion
]

{ #category : #rendering }
QuestionDetailComponent >> children [
	^ Array with: addAnswerComponent
]

{ #category : #accessing }
QuestionDetailComponent >> question: aQuestion [
	question := aQuestion.
	addAnswerComponent := AddAnswerComponent question: question
]

{ #category : #rendering }
QuestionDetailComponent >> renderAnswersOn: html [
	question answers
		do:
			[ :answer | html render: (AnswerComponent with: answer andChangeComponent: self) ]
		separatedBy: [ html horizontalRule ]
]

{ #category : #rendering }
QuestionDetailComponent >> renderContentOn: html [
	html
		render: (QuestionComponent with: question andChangeComponent: self).
	html horizontalRule.
	self renderAnswersOn: html.
	html horizontalRule.
	html render: addAnswerComponent
]
