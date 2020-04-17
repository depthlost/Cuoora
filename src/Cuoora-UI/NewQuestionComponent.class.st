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
		form: [ html
				label: 'Título:';
				space.
			html textInput
				autofocus;
				callback: [ :input | title := input ].
			html
				break;
				label: 'Desarrollo:';
				space.
			html textArea callback: [ :input | description := input ].
			html
				break;
				label: 'Tópicos:';
				space.
			html textInput callback: [ :input | topics := input ].
			html break.
			html button
				callback: [ self answer ];
				with: 'Cancelar'.
			html button
				callback: [ self save ];
				with: 'Guardar' ]
]

{ #category : #rendering }
NewQuestionComponent >> save [
	(title isEmpty or: topics isEmpty)
		ifTrue: [ ^ self ].
	Cuoora instance addTopicsByString: topics separatedBy: ','.
	self session user
		addQuestion: title
		description: description
		topics: (Cuoora instance topics: (topics splitOn: ',')).
	self answer
]
