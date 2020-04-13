Class {
	#name : #CalificationTest,
	#superclass : #TestCase,
	#category : #'Cuoora-Tests'
}

{ #category : #tests }
CalificationTest >> testLike [
	self
		assert: (Calification like: true) like;
		deny: (Calification like: false) like
]
