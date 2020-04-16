Class {
	#name : #NewQuestionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'title',
		'description',
		'topics'
	],
	#category : #'Cuoora-UI'
}

{ #category : #rendering }
NewQuestionComponent >> renderContentOn: html [
	html header: 'Nueva pregunta'.
	html break.
	self renderDataInputOn: html
]

{ #category : #rendering }
NewQuestionComponent >> renderDataInputOn: html [
	html
		form: [ html label: 'Título: '.
			html textInput callback: [ :input | title := input ].
			html label: 'Desarrollo: '.
			html textInput callback: [ :input | description := input ].
			html label: 'Tópicos: '.
			html textInput callback: [ :input | topics := input splitOn: ','].
			html button
				callback: [ self answer ];
				with: 'Cancelar'.
			html button
				callback: [ self save ];
				with: 'Guardar' ]
]

{ #category : #rendering }
NewQuestionComponent >> save [
	self session user
		addQuestion: title
		description: description
		topics: (Cuoora instance topics: (topics splitOn: ',')).
	self answer
]
