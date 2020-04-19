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
QuestionTest >> testAddCalificationOfIsLike [
	self assert: (question isLikeCalificationOf: user1) equals: nil.
	question addCalificationOf: user1 isLike: true.
	self assert: (question isLikeCalificationOf: user1) equals: true.
	question addCalificationOf: user1 isLike: false.
	self deny: (question isLikeCalificationOf: user1)
]

{ #category : #tests }
QuestionTest >> testAnswers [
	self initializeAnswers.
	answer2 addCalificationOf: user2 isLike: false.
	self assert: question answers last equals: answer2.
	answer1 addCalificationOf: user1 isLike: false.
	answer1 addCalificationOf: user2 isLike: false.
	self assert: question answers last equals: answer1.
	answer2 addCalificationOf: user2 isLike: true.
	self assert: question answers first equals: answer2
]

{ #category : #tests }
QuestionTest >> testCalculateScore [
	question addCalificationOf: author isLike: true.
	self assert: question calculateScore equals: 1.
	question addCalificationOf: user1 isLike: true.
	self assert: question calculateScore equals: 2.
	question addCalificationOf: user2 isLike: false.
	self assert: question calculateScore equals: 1.
	question addCalificationOf: author isLike: false.
	self assert: question calculateScore equals: -1
]

{ #category : #tests }
QuestionTest >> testGetDislikes [
	self assert: question getDislikes equals: 0.
	question addCalificationOf: author isLike: false.
	question addCalificationOf: user1 isLike: false.
	self assert: question getDislikes equals: 2.
	question addCalificationOf: user1 isLike: true.
	self assert: question getDislikes equals: 1.
	question addCalificationOf: author isLike: true.
	self assert: question getDislikes equals: 0
]

{ #category : #tests }
QuestionTest >> testGetLikes [
	self assert: question getLikes equals: 0.
	question addCalificationOf: author isLike: true.
	question addCalificationOf: user1 isLike: true.
	self assert: question getLikes equals: 2.
	question addCalificationOf: user1 isLike: false.
	self assert: question getLikes equals: 1.
	question addCalificationOf: author isLike: false.
	self assert: question getLikes equals: 0
]

{ #category : #tests }
QuestionTest >> testIsLikeCalificationOf [
	self assert: (question isLikeCalificationOf: user1) equals: nil.
	question addCalificationOf: user1 isLike: true.
	self assert: (question isLikeCalificationOf: user1).
	question addCalificationOf: user1 isLike: false.
	self deny: (question isLikeCalificationOf: user1)
]

{ #category : #tests }
QuestionTest >> testPostedBy [
	self assert: (question postedBy: author).
	self
		assert:
			((user1
				addQuestion: '¿This is...'
				description: 'When...'
				topics: topics) postedBy: user1)
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

{ #category : #tests }
QuestionTest >> testRemoveCalificationOf [
	question addCalificationOf: user1 isLike: true.
	self assert: (question isLikeCalificationOf: user1).
	question removeCalificationOf: user1.
	self assert: (question isLikeCalificationOf: user1) equals: nil
]
