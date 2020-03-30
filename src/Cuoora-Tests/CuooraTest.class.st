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
		assert: cuoora getTopical isEmpty;
		assert: (cuoora addTopical: topical1) equals: topical1;
		assert: (cuoora addTopical: topical2) equals: topical2;
		assert: cuoora getTopicals size equals: 2
]

{ #category : #running }
CuooraTest >> testAddUser [
	self
		assert: cuoora getUsers isEmpty;
		assert: (cuoora addUser: user1) equals: user1;
		assert: (cuoora addUser: user2) equals: user2;
		assert: cuoora getUsers size equals: 2
]

{ #category : #running }
CuooraTest >> testGetInstance [
	self assert: Cuoora getInstance equals: cuoora
]

{ #category : #running }
CuooraTest >> testGetTopicals [
	| topical1 topical2 topical3 nTopics |
	topical1 := Topical name: 'matematica' description: 'desc1'.
	topical2 := Topical name: 'lengua' description: 'desc2'.
	topical3 := Topical name: 'fisica' description: 'desc3'.
	cuoora
		addTopical: topical1;
		addTopical: topical2;
		addTopical: topical3.
	nTopics := cuoora getTopicals: #('matematica' 'fisica').
	self
		assert: nTopics size equals: 2;
		assert: (nTopics includes: topical1);
		assert: (nTopics includes: topical3)
]

{ #category : #running }
CuooraTest >> testNew [
	self assert: Cuoora new equals: cuoora
]
