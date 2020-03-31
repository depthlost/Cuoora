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

{ #category : #tests }
QuestionTest >> linkData [
	author addQuestion: question.
	question
		addAnswer: answer1;
		addAnswer: answer2;
		addAnswer: answer3
]

{ #category : #running }
QuestionTest >> loadAnswers [
	answer1 := Answer
		author: user1
		question: question
		description: 'answer 1'.
	answer2 := Answer
		author: user1
		question: question
		description: 'answer 2'.
	answer3 := Answer
		author: user2
		question: question
		description: 'answer 3'
]

{ #category : #running }
QuestionTest >> loadQuestion [
	question := Question
		author: author
		title: 'A title'
		description: 'A description'
		topics: topics
]

{ #category : #running }
QuestionTest >> loadTopics [
	topics := OrderedCollection new
		add: (Topical name: 'frameworks' description: 'A framework is...');
		add: (Topical name: 'pharo' description: 'pharo is...');
		add: (Topical name: 'seaside' description: 'seaside is...');
		yourself
]

{ #category : #running }
QuestionTest >> loadUsers [
	author := User username: 'lisa' password: 'lisa123'.
	user1 := User username: 'juan' password: 'juan123'.
	user2 := User username: 'lino' password: 'lino123'
]

{ #category : #running }
QuestionTest >> setUp [
	self
		loadUsers;
		loadTopics;
		loadQuestion;
		loadAnswers
]

{ #category : #tests }
QuestionTest >> testAddAnswer [
	self
		assert: question answers isEmpty;
		assert: (question addAnswer: answer1) equals: answer1;
		assert: question answers size equals: 1;
		assert: (question addAnswer: answer2) equals: answer2;
		assert: question answers size equals: 2
]

{ #category : #tests }
QuestionTest >> testRemove [

	|authorsOfResponses topicsOfQuestion authorOfQuestion|
	self linkData.
	authorOfQuestion := question author.
	topicsOfQuestion := question topics.
	authorsOfResponses := (question answers collect: [ :answer | answer author]) asSet.
	question remove.
	self deny: (authorOfQuestion questions includes: question);
		assert: (topicsOfQuestion noneSatisfy: [ :topical | topical questions includes: question ]);
		assert: (authorsOfResponses noneSatisfy: [ :authorOfResponse | authorOfResponse answers question == question ])
]
