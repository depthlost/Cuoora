Class {
	#name : #CuooraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'topical1',
		'topical2',
		'user1',
		'user2'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #running }
CuooraTest >> setUp [
	cuoora := Cuoora new.
	topical1 := Topical name: 'seaside' description: 'framework for...'.
	topical2 := Topical name: 'pharo' description: 'environment of...'.
	user1 := User username: 'maria' password: 'maria123'.
	user2 := User username: 'pedro' password: 'pedro123'
]

{ #category : #running }
CuooraTest >> testAddTopical [
	self
		assert: cuoora topics isEmpty;
		assert: (cuoora addTopical: topical1) equals: topical1;
		assert: (cuoora addTopical: topical2) equals: topical2;
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
	self assert: Cuoora instance equals: cuoora
]

{ #category : #running }
CuooraTest >> testNew [
	self assert: Cuoora new equals: cuoora
]

{ #category : #running }
CuooraTest >> testTopics [
	| nTopics |
	cuoora
		addTopical: topical1;
		addTopical: topical2.
	nTopics := cuoora topics: #('seaside').
	self
		assert: nTopics size equals: 1;
		assert: (nTopics includes: topical1)
]
