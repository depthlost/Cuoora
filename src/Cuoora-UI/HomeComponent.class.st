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
	html paragraph: [ self renderQuestionsOn: html ]
]

{ #category : #rendering }
HomeComponent >> renderNewQuestionOn: html [
	
]

{ #category : #rendering }
HomeComponent >> renderQuestionsOn: html [
 | questions |
	questions := (self session user getRelevantQuestions ).
	 (questions size < 5) ifFalse: [questions := questions first: 5].
		questions do: [ :each | 
			html header: each title.
			html text: 'Realizada por '.
			html text: each author.
			html number: each answers size.
			html text: ' respuestas'.
			html number: each getLikes.
			html text: 'likes'.
			html number: each getDislikes.
			html text: 'dislikes' ]
]
