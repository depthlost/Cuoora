Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#category : #'Cuoora-UI'
}

{ #category : #adding }
HomeComponent >> addAnswer [
]

{ #category : #adding }
HomeComponent >> addQuestion [
	self call: NewQuestionComponent new
]

{ #category : #rendering }
HomeComponent >> qualifyPost: post isLike: bool [
	
]

{ #category : #rendering }
HomeComponent >> renderContentOn: html [
	html button
		callback: [ self addQuestion ];
		with: 'Hacer una nueva pregunta'.
	html header: 'Ultimas preguntas'.
	html paragraph: [ self renderQuestionsOn: html ]
]

{ #category : #rendering }
HomeComponent >> renderNewQuestionOn: html [
	
]

{ #category : #rendering }
HomeComponent >> renderQuestionsOn: html [
	(self session user getRelevantQuestions takeFirst: 5)
		do: [ :each | 
			html
				header: each title;
				text: 'Realizada por ';
				text: each author username;
				text: each answers size;
				text: ' respuestas';
				text: each getLikes;
				text: 'likes';
				text: each getDislikes;
				text: 'dislikes';
				space ]
]
