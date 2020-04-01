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

{ #category : #running }
UserTest >> linkQuestionsAndAnswers [
	user2 addQuestion: user2Question.
	user3 addQuestion: user3Question.
	user
		addQuestion: userQuestion;
		addAnswer: userAnswerToMe;
		addAnswer: userAnswerToOther
]

{ #category : #running }
UserTest >> setUp [
	user := User username: 'pedro' password: 'pedro123'.
	user2 := User username: 'luis' password: 'luis123'.
	user3 := User username: 'maria' password: 'maria123'.
	topics := OrderedCollection new
		add: (Topic name: 'Math' description: 'This topic...');
		add: (Topic name: 'Framework' description: 'This topic...');
		yourself.
	userQuestion := Question
		author: user
		title: 'A title'
		description: 'A description'
		topics: (topics select: [ :topic | topic name = 'Framework' ]).
	user2Question := Question
		author: user2
		title: 'A title'
		description: 'A description'
		topics: (topics select: [ :topic | topic name = 'Math' ]).
	user3Question := Question
		author: user3
		title: 'A title'
		description: 'A description'
		topics: (topics select: [ :topic | topic name = 'Framework' ]).
	userAnswerToMe := Answer
		author: user
		question: userQuestion
		description: 'A description'.
	userAnswerToOther := Answer
		author: user
		question: user2Question
		description: 'A description'
]

{ #category : #running }
UserTest >> testAddAnswer [
	self
		assert: user answers isEmpty;
		assert: (user addAnswer: userAnswerToOther)
			equals: userAnswerToOther;
		assert: user answers size equals: 1;
		assert: (user answers includes: userAnswerToOther)
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
UserTest >> testAddQuestion [
	self
		assert: user questions isEmpty;
		assert: (user addQuestion: userQuestion) equals: userQuestion;
		assert: user questions size equals: 1;
		assert: (user questions includes: userQuestion)
]

{ #category : #running }
UserTest >> testAddTopicOfInterest [
	self
		assert: user topicsOfInterest isEmpty;
		assert: (user addTopicOfInterest: topics first) equals: topics first;
		assert: user topicsOfInterest size equals: 1;
		assert: (user topicsOfInterest includes: topics first)
]

{ #category : #running }
UserTest >> testCalculateScore [
	self
		linkQuestionsAndAnswers;
		assert: user calculateScore equals: 70.
	userQuestion
		setQualification: (Qualification author: user2 like: false).
	userQuestion
		setQualification: (Qualification author: user3 like: false).
	self assert: user calculateScore equals: 68.
	userAnswerToOther
		setQualification: (Qualification author: user2 like: true).
	self assert: user calculateScore equals: 69.
	userQuestion remove.
	self assert: user calculateScore equals: 51.
	userAnswerToOther remove.
	self assert: user calculateScore equals: 0
]

{ #category : #running }
UserTest >> testFollowTo [
	self
		assert: user following isEmpty;
		assert: user2 followers isEmpty;
		assert: (user followTo: user2) equals: user2;
		assert: user following size equals: 1;
		assert: (user following includes: user2);
		assert: user2 followers size equals: 1;
		assert: (user2 followers includes: user)
]

{ #category : #running }
UserTest >> testGetAnswersToOtherUsers [
	| answersToOtherUsers |
	self linkQuestionsAndAnswers.
	answersToOtherUsers := user getAnswersToOtherUsers.
	self
		assert: answersToOtherUsers size equals: 1;
		assert: (answersToOtherUsers includes: userAnswerToOther)
]

{ #category : #running }
UserTest >> testGetRelevantQuestions [
	| questionsOfInterest |
	self linkQuestionsAndAnswers.
	user followTo: user3.
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
		linkQuestionsAndAnswers;
		assert: user answers size equals: 2;
		assert: (user removeAnswer: userAnswerToOther)
			equals: userAnswerToOther;
		assert: user answers size equals: 1;
		assert: (user removeAnswer: userAnswerToMe) equals: userAnswerToMe;
		assert: user answers isEmpty
]

{ #category : #running }
UserTest >> testRemoveQuestion [

	self linkQuestionsAndAnswers;
		assert: user questions size equals: 1;
		assert: (user removeQuestion: userQuestion) equals: userQuestion;
		assert: user questions isEmpty.
]
