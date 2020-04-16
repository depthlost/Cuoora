Class {
	#name : #Topic,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'questions'
	],
	#category : #'Cuoora-Model'
}

{ #category : #'as yet unclassified' }
Topic class >> name: aName description: aDescription [

	^ self new name: aName description: aDescription
]

{ #category : #initialization }
Topic >> = otherTopic [
	^ name = otherTopic name
]

{ #category : #initialization }
Topic >> addQuestion: aQuestion [
	^ questions add: aQuestion
]

{ #category : #initialization }
Topic >> initialize [
	questions := OrderedCollection new
]

{ #category : #initialization }
Topic >> name [
	^ name
]

{ #category : #'as yet unclassified' }
Topic >> name: aName description: aDescription [
	name := aName.
	description := aDescription
]

{ #category : #initialization }
Topic >> questions [
	^ questions
]

{ #category : #initialization }
Topic >> removeQuestion: aQuestion [
	^ questions remove: aQuestion
]
