Class {
	#name : #UserTest,
	#superclass : #TestCase,
	#instVars : [
		'user',
		'user2',
		'user3',
		'topics',
		'userQuestion',
		'user2Question',
		'user3Question',
		'userAnswerToMe',
		'userAnswerToOther'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #initialization }
UserTest >> initializeAnswers [
	userAnswerToMe := user
		addAnswer: 'A description'
		answerTo: userQuestion.
	userAnswerToOther := user
		addAnswer: 'A description'
		answerTo: user2Question
]

{ #category : #initialization }
UserTest >> initializeQuestions [
	userQuestion := user
		addQuestion: 'A title'
		description: 'A description'
		topics: (topics select: [ :topic | topic name = 'Framework' ]).
	user2Question := user2
		addQuestion: 'A title'
		description: 'A description'
		topics: (topics select: [ :topic | topic name = 'Math' ]).
	user3Question := user3
		addQuestion: 'A title'
		description: 'A description'
		topics: (topics select: [ :topic | topic name = 'Framework' ])
]

{ #category : #initialization }
UserTest >> initializeTopics [
	topics := OrderedCollection new
		add: (Topic name: 'Math' description: 'This topic...');
		add: (Topic name: 'Framework' description: 'This topic...');
		yourself
]

{ #category : #initialization }
UserTest >> initializeUsers [
	user := User username: 'pedro' password: 'pedro123'.
	user2 := User username: 'luis' password: 'luis123'.
	user3 := User username: 'maria' password: 'maria123'
]

{ #category : #running }
UserTest >> setUp [
	self initializeUsers
]

{ #category : #running }
UserTest >> testAddAnswerAnswerTo [
	| answer |
	self
		initializeTopics;
		initializeQuestions;
		assert: user answers isEmpty.
	answer := user addAnswer: 'A description' answerTo: userQuestion.
	self
		assert: user answers size equals: 1;
		assert: (user answers includes: answer)
]

{ #category : #running }
UserTest >> testAddFollower [
	self
		assert: user followers isEmpty;
		assert: (user addFollower: user2) equals: user2;
		assert: user followers size equals: 1;
		assert: (user followers includes: user2)
]

{ #category : #running }
UserTest >> testAddQuestionDescriptionTopics [
	| question |
	self
		initializeTopics;
		assert: user questions isEmpty.
	question := user
		addQuestion: 'A title'
		description: 'A description'
		topics: (topics select: [ :topic | topic name = 'Framework' ]).
	self
		assert: user questions size equals: 1;
		assert: (user questions includes: question)
]

{ #category : #running }
UserTest >> testAddTopicOfInterest [
	self
		initializeTopics
		assert: user interestTopics isEmpty;
		assert: (user addTopicOfInterest: topics first) equals: topics first;
		assert: user interestTopics size equals: 1;
		assert: (user interestTopics includes: topics first)
]

{ #category : #running }
UserTest >> testCalculateScore [
	self
		initializeTopics;
		initializeQuestions;
		initializeAnswers; 
		assert: user calculateScore equals: 70.
	userQuestion
		setCalification: (Calification author: user2 like: false).
	userQuestion
		setCalification: (Calification author: user3 like: false).
	self assert: user calculateScore equals: 68.
	userAnswerToOther
		setCalification: (Calification author: user2 like: true).
	self assert: user calculateScore equals: 69.
	userQuestion
		setCalification: (Calification author: user2 like: true).
	self assert: user calculateScore equals: 71.
	userAnswerToMe
		setCalification: (Calification author: user3 like: true).
	self assert: user calculateScore equals: 72.
	userQuestion remove.
	self assert: user calculateScore equals: 51.
	userAnswerToOther remove.
	self assert: user calculateScore equals: 0
]

{ #category : #running }
UserTest >> testFollow [
	self
		assert: user following isEmpty;
		assert: user2 followers isEmpty;
		assert: (user follow: user2) equals: user2;
		assert: user following size equals: 1;
		assert: (user following includes: user2);
		assert: user2 followers size equals: 1;
		assert: (user2 followers includes: user)
]

{ #category : #running }
UserTest >> testGetAnswersToOtherUsers [
	| answersToOtherUsers |
	self
		initializeTopics;
		initializeQuestions;
		initializeAnswers.
	answersToOtherUsers := user getAnswersToOtherUsers.
	self
		assert: answersToOtherUsers size equals: 1;
		assert: (answersToOtherUsers includes: userAnswerToOther)
]

{ #category : #running }
UserTest >> testGetRelevantQuestions [
	| questionsOfInterest |
	self
		initializeTopics;
		initializeQuestions.
	user follow: user3.
	user
		addTopicOfInterest: (topics detect: [ :topic | topic name = 'Math' ]).
	questionsOfInterest := user getRelevantQuestions.
	self
		assert: questionsOfInterest size equals: 2;
		assert: (questionsOfInterest includes: user2Question);
		assert: (questionsOfInterest includes: user3Question)
]

{ #category : #running }
UserTest >> testRemoveAnswer [
	self
		initializeTopics;
		initializeQuestions;
		initializeAnswers;
		assert: user answers size equals: 2;
		assert: (user removeAnswer: userAnswerToOther)
			equals: userAnswerToOther;
		assert: user answers size equals: 1;
		assert: (user removeAnswer: userAnswerToMe) equals: userAnswerToMe;
		assert: user answers isEmpty
]

{ #category : #running }
UserTest >> testRemoveQuestion [
	self
		initializeTopics;
		initializeQuestions;
		assert: user questions size equals: 1;
		assert: (user removeQuestion: userQuestion) equals: userQuestion;
		assert: user questions isEmpty
]
