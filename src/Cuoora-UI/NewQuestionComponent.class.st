Class {
	#name : #NewQuestionComponent,
	#superclass : #WAComponent,
	#category : #'Cuoora-UI'
}

{ #category : #rendering }
NewQuestionComponent >> renderContentOn: html [ 

html header: 'Nueva pregunta'.
html space.
self renderNewQuestion: html.
]

{ #category : #rendering }
NewQuestionComponent >> renderNewQuestion: html [
	| question |
	question := Question new.
	html
		form: [ html
				paragraph: [ html label: 'Título: '.
					html textInput on: #title of: question ] ].
	html
		form: [ html
				paragraph: [ html label: 'Desarrollo: '.
					html textInput on: #description of: question ] ].
	html
		form: [ html
				paragraph: [ html label: 'Tópicos: '.
					html textInput on: #topics of: question ] ].
	html button
		callback: [  ];
		with: 'Cancelar'.
	html button
		callback: [  ];
		with: 'Guardar'
]
