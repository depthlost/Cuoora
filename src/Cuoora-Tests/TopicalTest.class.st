Class {
	#name : #TopicalTest,
	#superclass : #TestCase,
	#instVars : [
		'topical',
		'question1',
		'question2'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #running }
TopicalTest >> setUp [
	topical := Topical name: 'math' descrption: 'description...'.
	question1 := Question
		author: (User username: 'luis' password: 'luis123')
		title: '¿2 + 2?'
		description: 'How much is 2 + 2?'
		topics:
			(OrderedCollection new
				add: topical;
				yourself).
	question2 := Question
		author: (User username: 'maria' password: 'maria123')
		title: '¿4 + 8?'
		description: 'How much is 4 + 8?'
		topics:
			(OrderedCollection new
				add: topical;
				yourself).
]

{ #category : #tests }
TopicalTest >> testAddQuestion [
	self
		assert: topical getQuestions size equals: 2;
		assert: topical getQuestions includes: question1;
		assert: topical getQuestions includes: question2.
	topical removeQuestion: question1.
	self
		assert: topical getQuestions size equals: 1;
		assert: (topical addQuestion: question1) equals: question1;
		assert: topical getQuestions size equals: 2
]

{ #category : #tests }
TopicalTest >> testRemoveQuestion [
	self
		assert: topical getQuestions size equals: 2;
		assert: (topical removeQuestion: question1) equals: question1;
		assert: topical getQuestions size equals: 1;
		assert: (topical removeQuestion: question2) equals: question2;
		assert: topical getQuestions isEmpty
]
