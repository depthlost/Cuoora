Class {
	#name : #PostTest,
	#superclass : #TestCase,
	#instVars : [
		'post',
		'defaultUser',
		'user1',
		'user2',
		'defaultQualification'
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
	defaultQualification := Qualification author: defaultUser like: true
]

{ #category : #tests }
PostTest >> testAddQualification [
	self
		assert: post getLikes equals: 0;
		assert: post getDislikes equals: 0;
		assert: (post addQualification: defaultQualification)
			equals: defaultQualification;
		assert: post getLikes equals: 1
]

{ #category : #tests }
PostTest >> testCalculateScore [
	self loadUsers.
	post setQualification: (Qualification author: defaultUser like: true).
	self assert: post calculateScore equals: 1.
	post setQualification: (Qualification author: user1 like: true).
	self assert: post calculateScore equals: 2.
	post setQualification: (Qualification author: user2 like: false).
	self assert: post calculateScore equals: 1.
	post
		setQualification: (Qualification author: defaultUser like: false).
	self assert: post calculateScore equals: -1
]

{ #category : #tests }
PostTest >> testIsLikeQualificationOf [
	self assert: (post isLikeQualificationOf: defaultUser) equals: nil.
	post setQualification: (Qualification author: defaultUser like: true).
	self assert: (post isLikeQualificationOf: defaultUser).
	post
		setQualification: (Qualification author: defaultUser like: false).
	self deny: (post isLikeQualificationOf: defaultUser)
]

{ #category : #tests }
PostTest >> testPostedBy [
	self loadUsers.
	self assert: (post postedBy: defaultUser).
	self
		assert: ((Post author: user1 description: 'A description...') postedBy: user1)
]

{ #category : #tests }
PostTest >> testRemoveQualification [
	self
		loadUsers;
		assert: (post removeQualification: defaultUser) equals: nil.
	post setQualification: defaultQualification.
	self
		assert: (post removeQualification: defaultUser)
			equals: defaultQualification;
		assert: (post isLikeQualificationOf: defaultUser) equals: nil
]

{ #category : #tests }
PostTest >> testSetQualification [
	| qualificationUser1 |
	self
		loadUsers;
		assert: (post isLikeQualificationOf: user1) equals: nil.
	qualificationUser1 := Qualification author: user1 like: true.
	self
		assert: (post setQualification: qualificationUser1)
			equals: qualificationUser1;
		assert: (post isLikeQualificationOf: user1) equals: true.
	qualificationUser1 := Qualification author: user1 like: false.
	self
		assert: (post setQualification: qualificationUser1)
			equals: qualificationUser1;
		assert: (post isLikeQualificationOf: user1) equals: false
]
