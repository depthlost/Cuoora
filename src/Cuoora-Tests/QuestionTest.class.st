Class {
	#name : #QuestionTest,
	#superclass : #TestCase,
	#instVars : [
		'question',
		'author',
		'user1',
		'user2',
		'topics',
		'answer1',
		'answer2',
		'answer3'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #initialization }
QuestionTest >> initializeAnswers [
	answer1 := user1 addAnswer: 'answer 1' answerTo: question.
	answer2 := user1 addAnswer: 'answer 2' answerTo: question.
	answer3 := user2 addAnswer: 'answer 3' answerTo: question
]

{ #category : #initialization }
QuestionTest >> initializeQuestion [
	question := author
		addQuestion: 'A title'
		description: 'A description'
		topics: topics
]

{ #category : #initialization }
QuestionTest >> initializeTopics [
	topics := OrderedCollection new
		add: (Topic name: 'frameworks' description: 'A framework is...');
		add: (Topic name: 'pharo' description: 'pharo is...');
		add: (Topic name: 'seaside' description: 'seaside is...');
		yourself
]

{ #category : #initialization }
QuestionTest >> initializeUsers [
	author := User username: 'lisa' password: 'lisa123'.
	user1 := User username: 'juan' password: 'juan123'.
	user2 := User username: 'lino' password: 'lino123'
]

{ #category : #running }
QuestionTest >> setUp [
	self
		initializeUsers;
		initializeTopics;
		initializeQuestion.
]

{ #category : #tests }
QuestionTest >> testAddAnswer [
	| answer |
	self assert: question answers isEmpty.
	answer := user1 addAnswer: 'your question...' answerTo: question.
	self
		assert: question answers size equals: 1;
		assert: (question answers includes: answer)
]

{ #category : #tests }
QuestionTest >> testRemove [

	|authorsOfResponses topicsOfQuestion authorOfQuestion|
	self initializeAnswers.
	authorOfQuestion := question author.
	topicsOfQuestion := question topics.
	authorsOfResponses := (question answers collect: [ :answer | answer author]) asSet.
	question remove.
]

{ #category : #tests }
QuestionTest >> testRemoveAnswer [
	self
		assert: question answers isEmpty;
		initializeAnswers;
		assert: question answers size equals: 3.
	question removeAnswer: answer2.
	self assert: question answers size equals: 2.
	question
		removeAnswer: answer1;
		removeAnswer: answer3.
	self assert: question answers isEmpty
]
