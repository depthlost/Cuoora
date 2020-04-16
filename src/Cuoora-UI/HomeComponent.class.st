Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#category : #'Cuoora-UI'
}

{ #category : #adding }
HomeComponent >> addQuestion [
	self call: NewQuestionComponent new
]

{ #category : #rendering }
HomeComponent >> renderContentOn: html [
	self renderNewQuestionOn: html.
	html heading
		level2;
		with: 'Ultimas preguntas'.
	html paragraph: [ self renderQuestionsOn: html ]
]

{ #category : #rendering }
HomeComponent >> renderNewQuestionOn: html [
	html anchor
		callback: [ self addQuestion ];
		with: 'Hacer una nueva pregunta'
]

{ #category : #rendering }
HomeComponent >> renderQuestionsOn: html [
	(self session user getRelevantQuestions takeFirst: 5)
		do: [ :question | 
			html
				render: (QuestionComponent with: question andChangeComponent: self) ]
		separatedBy: [ html horizontalRule ]
]
