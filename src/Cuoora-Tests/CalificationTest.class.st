Class {
	#name : #CalificationTest,
	#superclass : #TestCase,
	#category : #'Cuoora-Tests'
}

{ #category : #tests }
CalificationTest >> testLike [
	self
		assert:
			(Calification
				author: (User username: 'luis' password: 'luis123')
				like: true) like;
		deny:
			(Calification
				author: (User username: 'maria' password: 'maria123')
				like: false) like.
]
