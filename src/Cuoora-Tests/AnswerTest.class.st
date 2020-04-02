Class {
	#name : #AnswerTest,
	#superclass : #TestCase,
	#instVars : [
		'question',
		'answer'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #tests }
AnswerTest >> setUp [
	| answerAuthor |
	question := Question
		author: (User username: 'luis' password: 'luis123')
		title: 'A title'
		description: 'A description'
		topics:
			(OrderedCollection new
				add: (Topic name: 'Framework' description: 'A framework is...');
				yourself).
	answerAuthor := User username: 'maria' password: 'maria123'.
	answer := Answer
		author: answerAuthor
		question: question
		description: 'It is...'.
	answerAuthor addAnswer: answer
]

{ #category : #tests }
AnswerTest >> testRemove [
	self
		assert: (answer question answers includes: answer);
		assert: (answer author answers includes: answer).
	answer remove.
	self
		deny: (answer question answers includes: answer);
		deny: (answer author answers includes: answer)
]

{ #category : #tests }
AnswerTest >> testRespondsTo [
	self
		assert: (answer respondsTo: question author);
		deny:
			(answer respondsTo: (User username: 'newPedro' password: 'newPedro90'))
]
