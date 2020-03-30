Class {
	#name : #QualificationTest,
	#superclass : #TestCase,
	#category : #'Cuoora-Tests'
}

{ #category : #tests }
QualificationTest >> testIsLike [
	self
		assert:
			(Qualification
				author: (User username: 'luis' password: 'luis123')
				like: true) isLike;
		deny:
			(Qualification
				author: (User username: 'maria' password: 'maria123')
				like: false) isLike.
]
