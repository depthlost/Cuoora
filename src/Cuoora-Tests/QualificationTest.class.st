Class {
	#name : #QualificationTest,
	#superclass : #TestCase,
	#category : #'Cuoora-Tests'
}

{ #category : #tests }
QualificationTest >> testLike [
	self
		assert:
			(Qualification
				author: (User username: 'luis' password: 'luis123')
				like: true) like;
		deny:
			(Qualification
				author: (User username: 'maria' password: 'maria123')
				like: false) like.
]
