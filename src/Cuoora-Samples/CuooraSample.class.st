"
Esta clase sirve para generar una instanciacion de prueba del sistema Cuoora.
Para realizar la instanciacion, se debe ejecutar la siguiente sentencia:

CuooraSample make.

"
Class {
	#name : #CuooraSample,
	#superclass : #Object,
	#instVars : [
		'userPedro',
		'userDiego',
		'userJuan',
		'questionPedro',
		'questionDiego'
	],
	#category : #'Cuoora-Samples'
}

{ #category : #searching }
CuooraSample class >> make [
	self new
]

{ #category : #initialization }
CuooraSample >> addAnswers [
	userDiego
		addAnswer:
			'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de cada test.'
		answerTo: questionPedro.
	userPedro
		addAnswer:
			'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.'
		answerTo: questionDiego
]

{ #category : #initialization }
CuooraSample >> addFollowups [
	userJuan follow: userDiego.
	userPedro follow: userJuan
]

{ #category : #initialization }
CuooraSample >> addQuestions [
	questionPedro := userPedro
		addQuestion: '¿Para qué sirve el método SetUp?'
		description: ''
		topics: (Cuoora instance topics: #('OO1' 'Test de unidad')).
	questionDiego := userDiego
		addQuestion: '¿Qué significa #messageNotUnderstood?'
		description: ''
		topics: (Cuoora instance topics: #('OO1' 'Smalltalk'))
]

{ #category : #initialization }
CuooraSample >> addTopics [
	Cuoora instance
		addTopic: (Topic name: 'OO1' description: '');
		addTopic: (Topic name: 'Test de unidad' description: '');
		addTopic: (Topic name: 'Smalltalk' description: '')
]

{ #category : #initialization }
CuooraSample >> addUsers [
	userPedro := User
		username: 'pedro@cuoora.com'
		password: 'pedro@cuoora.com'.
	userDiego := User
		username: 'diego@cuoora.com'
		password: 'diego@cuoora.com'.
	userJuan := User
		username: 'juan@cuoora.com'
		password: 'juan@cuoora.com'.
	Cuoora instance
		addUser: userPedro;
		addUser: userDiego;
		addUser: userJuan
]

{ #category : #initialization }
CuooraSample >> initialize [
	Cuoora clearInstance.
	self
		addUsers;
		addFollowups;
		addTopics;
		addQuestions;
		addAnswers
]
