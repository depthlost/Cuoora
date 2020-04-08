Class {
	#name : #PostTest,
	#superclass : #TestCase,
	#instVars : [
		'post',
		'defaultUser',
		'user1',
		'user2',
		'defaultCalification'
	],
	#category : #'Cuoora-Tests'
}

{ #category : #tests }
PostTest >> loadUsers [
	user1 := User username: 'luis' password: 'luis123'.
	user2 := User username: 'maria' password: 'maria123'
]

{ #category : #running }
PostTest >> setUp [
	defaultUser := User username: 'pedro' password: 'pedro123'.
	post := Post author: defaultUser description: 'A description...'.
	defaultCalification := Calification author: defaultUser like: true
]

{ #category : #tests }
PostTest >> testAddCalification [
	self
		assert: post getLikes equals: 0;
		assert: post getDislikes equals: 0;
		assert: (post addCalification: defaultCalification)
			equals: defaultCalification;
		assert: post getLikes equals: 1
]

{ #category : #tests }
PostTest >> testCalculateScore [
	self loadUsers.
	post setCalification: (Calification author: defaultUser like: true).
	self assert: post calculateScore equals: 1.
	post setCalification: (Calification author: user1 like: true).
	self assert: post calculateScore equals: 2.
	post setCalification: (Calification author: user2 like: false).
	self assert: post calculateScore equals: 1.
	post
		setCalification: (Calification author: defaultUser like: false).
	self assert: post calculateScore equals: -1
]

{ #category : #tests }
PostTest >> testIsLikeCalificationOf [
	self assert: (post isLikeCalificationOf: defaultUser) equals: nil.
	post setCalification: (Calification author: defaultUser like: true).
	self assert: (post isLikeCalificationOf: defaultUser).
	post
		setCalification: (Calification author: defaultUser like: false).
	self deny: (post isLikeCalificationOf: defaultUser)
]

{ #category : #tests }
PostTest >> testPostedBy [
	self loadUsers.
	self assert: (post postedBy: defaultUser).
	self
		assert: ((Post author: user1 description: 'A description...') postedBy: user1)
]

{ #category : #tests }
PostTest >> testRemoveCalification [
	self
		loadUsers;
		assert: (post removeCalification: defaultUser) equals: nil.
	post setCalification: defaultCalification.
	self
		assert: (post removeCalification: defaultUser)
			equals: defaultCalification;
		assert: (post isLikeCalificationOf: defaultUser) equals: nil
]

{ #category : #tests }
PostTest >> testSetCalification [
	| calificationUser1 |
	self
		loadUsers;
		assert: (post isLikeCalificationOf: user1) equals: nil.
	calificationUser1 := Calification author: user1 like: true.
	self
		assert: (post setCalification: calificationUser1)
			equals: calificationUser1;
		assert: (post isLikeCalificationOf: user1) equals: true.
	calificationUser1 := Calification author: user1 like: false.
	self
		assert: (post setCalification: calificationUser1)
			equals: calificationUser1;
		assert: (post isLikeCalificationOf: user1) equals: false
]
