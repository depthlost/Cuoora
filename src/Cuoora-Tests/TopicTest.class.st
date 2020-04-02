Class {
	#name : #TopicTest,
	#superclass : #TestCase,
	#instVars : [
		'topic',
		'question1',
		'question2'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #running }
TopicTest >> setUp [
	topic := Topic name: 'math' description: 'description...'.
	question1 := Question
		author: (User username: 'luis' password: 'luis123')
		title: '¿2 + 2?'
		description: 'How much is 2 + 2?'
		topics:
			(OrderedCollection new
				add: topic;
				yourself).
	question2 := Question
		author: (User username: 'maria' password: 'maria123')
		title: '¿4 + 8?'
		description: 'How much is 4 + 8?'
		topics:
			(OrderedCollection new
				add: topic;
				yourself).
]

{ #category : #tests }
TopicTest >> testAddQuestion [
	self
		assert: topic questions size equals: 2;
		assert: (topic questions includes: question1);
		assert: (topic questions includes: question2).
	topic removeQuestion: question1.
	self
		assert: topic questions size equals: 1;
		assert: (topic addQuestion: question1) equals: question1;
		assert: topic questions size equals: 2
]

{ #category : #tests }
TopicTest >> testRemoveQuestion [
	self
		assert: topic questions size equals: 2;
		assert: (topic removeQuestion: question1) equals: question1;
		assert: topic questions size equals: 1;
		assert: (topic removeQuestion: question2) equals: question2;
		assert: topic questions isEmpty
]
