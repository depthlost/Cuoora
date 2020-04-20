Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#category : #'Cuoora-UI'
}

{ #category : #callbacks }
HomeComponent >> addQuestion [
	self call: NewQuestionComponent new
]

{ #category : #private }
HomeComponent >> getQuestions [
	^ self session user getRelevantQuestions takeFirst: 5
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
	self getQuestions
		do: [ :question | 
			html
				render: (QuestionComponent with: question andChangeComponent: self) ]
		separatedBy: [ html horizontalRule ]
]
