Class {
	#name : #QuestionComponent,
	#superclass : #PostComponent,
	#category : #'Cuoora-UI'
}

{ #category : #rendering }
QuestionComponent >> goToQuestionDetail [
	changeComponent call: (QuestionDetailComponent question: post)
]

{ #category : #rendering }
QuestionComponent >> renderContentOn: html [
	self renderTitleOn: html.
	post topics ifNotEmpty: [ self renderTopicsOn: html ].
	self renderAuthorOn: html.
	super renderContentOn: html
]

{ #category : #rendering }
QuestionComponent >> renderTitleOn: html [
	html anchor
		callback: [ self goToQuestionDetail ];
		with: [ html strong: post title ].
	html break.
]

{ #category : #rendering }
QuestionComponent >> renderTopicsOn: html [
	html text: 'Topicos: '.
	post topics
		do: [ :topic | html text: topic name ]
		separatedBy: [ html text: ', ' ].
	html break.
]
