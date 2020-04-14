Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#category : #'Cuoora-UI'
}

{ #category : #rendering }
HomeComponent >> qualifyPost: post isLike: bool [
	
]

{ #category : #rendering }
HomeComponent >> renderContentOn: html [ 
	html text: 'Ultimas preguntas'.
	html paragraph: [ self renderQuestions: html ]
]

{ #category : #rendering }
HomeComponent >> renderNewQuestion: question on: html [
	
]

{ #category : #rendering }
HomeComponent >> renderNewQuestionOn: html [
	
]

{ #category : #rendering }
HomeComponent >> renderQuestions: html [
	UserSession user getRelevantQuestions
		do: [ :each | self renderNewQuestion: each on: html ]
]
