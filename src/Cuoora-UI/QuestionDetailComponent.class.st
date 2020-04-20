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

{ #category : #accessing }
QuestionDetailComponent >> question: aQuestion [
	question := aQuestion.
	addAnswerComponent := AddAnswerComponent question: question
	"esta sentencia se encuentra aqui porque el framework seaside falla si no esta (no carga
	correctamente el componente embebido), y no puede ser agregada en el initialize,
	dado que la variable de instancia question se inicializa aca"
]

{ #category : #rendering }
QuestionDetailComponent >> renderAnswersOn: html [
	question answers
		do: [ :answer | 
			html render: (AnswerComponent with: answer andChangeComponent: self).
			html horizontalRule ]
]

{ #category : #rendering }
QuestionDetailComponent >> renderContentOn: html [
	html
		render: (QuestionComponent with: question andChangeComponent: self).
	html horizontalRule.
	self renderAnswersOn: html.
	html render: addAnswerComponent
]
