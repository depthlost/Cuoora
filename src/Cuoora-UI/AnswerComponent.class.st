Class {
	#name : #AnswerComponent,
	#superclass : #PostComponent,
	#category : #'Cuoora-UI'
}

{ #category : #rendering }
AnswerComponent >> renderAuthorOn: html [
	html strong
		with: [ html text: 'Respuesta de '.
			html anchor
				callback: [ self goToUserProfile ];
				with: post author username ].
	html break
]

{ #category : #rendering }
AnswerComponent >> renderContentOn: html [
	self renderAuthorOn: html.
	super renderContentOn: html
]
