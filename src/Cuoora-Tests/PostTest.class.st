Class {
	#name : #PostTest,
	#superclass : #TestCase,
	#instVars : [
		'post',
		'defaultUser',
		'user1',
		'user2'
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
	"defaultCalification := Calification like: true"
]

{ #category : #tests }
PostTest >> testAddCalificationOfIsLike [
	self assert: (post isLikeCalificationOf: defaultUser) equals: nil.
	post addCalificationOf: defaultUser isLike: true.
	self assert: (post isLikeCalificationOf: defaultUser) equals: true.
	post addCalificationOf: defaultUser isLike: false.
	self deny: (post isLikeCalificationOf: defaultUser)
]

{ #category : #tests }
PostTest >> testCalculateScore [
	self loadUsers.
	post addCalificationOf: defaultUser isLike: true.
	self assert: post calculateScore equals: 1.
	post addCalificationOf: user1 isLike: true.
	self assert: post calculateScore equals: 2.
	post addCalificationOf: user2 isLike: false.
	self assert: post calculateScore equals: 1.
	post addCalificationOf: defaultUser isLike: false.
	self assert: post calculateScore equals: -1
]

{ #category : #tests }
PostTest >> testIsLikeCalificationOf [
	self assert: (post isLikeCalificationOf: defaultUser) equals: nil.
	post addCalificationOf: defaultUser isLike: true.
	self assert: (post isLikeCalificationOf: defaultUser).
	post addCalificationOf: defaultUser isLike: false.
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
PostTest >> testRemoveCalificationOf [
	post addCalificationOf: defaultUser isLike: true.
	self assert: (post isLikeCalificationOf: defaultUser).
	post removeCalificationOf: defaultUser.
	self assert: (post isLikeCalificationOf: defaultUser) equals: nil
]
