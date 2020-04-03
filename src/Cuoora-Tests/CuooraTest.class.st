Class {
	#name : #CuooraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'topic1',
		'topic2',
		'user1',
		'user2'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #running }
CuooraTest >> setUp [
	cuoora := Cuoora new.
	topic1 := Topic name: 'seaside' description: 'framework for...'.
	topic2 := Topic name: 'pharo' description: 'environment of...'.
	user1 := User username: 'maria' password: 'maria123'.
	user2 := User username: 'pedro' password: 'pedro123'
]

{ #category : #running }
CuooraTest >> testAddTopic [
	self
		assert: cuoora topics isEmpty;
		assert: (cuoora addTopic: topic1) equals: topic1;
		assert: (cuoora addTopic: topic2) equals: topic2;
		assert: cuoora topics size equals: 2
]

{ #category : #running }
CuooraTest >> testAddUser [
	self
		assert: cuoora users isEmpty;
		assert: (cuoora addUser: user1) equals: user1;
		assert: (cuoora addUser: user2) equals: user2;
		assert: cuoora users size equals: 2
]

{ #category : #running }
CuooraTest >> testInstance [
	self assert: Cuoora instance equals: Cuoora instance
]

{ #category : #running }
CuooraTest >> testTopics [
	| nTopics |
	cuoora
		addTopic: topic1;
		addTopic: topic2.
	nTopics := cuoora topics: #('seaside').
	self
		assert: nTopics size equals: 1;
		assert: (nTopics includes: topic1)
]
