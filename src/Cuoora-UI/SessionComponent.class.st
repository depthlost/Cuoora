Class {
	#name : #SessionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'bodyComponent'
	],
	#category : #'Cuoora-UI'
}

{ #category : #accessing }
SessionComponent class >> bodyComponent: aBodyComponent [
	^ self new bodyComponent: aBodyComponent
]

{ #category : #accessing }
SessionComponent >> bodyComponent: aBodyComponent [
	bodyComponent := aBodyComponent
]

{ #category : #rendering }
SessionComponent >> logout [
	self answer
]

{ #category : #rendering }
SessionComponent >> renderContentOn: html [
	self renderHeadOn: html.
	html horizontalRule.
	html render: bodyComponent
]

{ #category : #rendering }
SessionComponent >> renderHeadOn: html [
	html
		heading: 'CuOOra';
		text: self session user username;
		space.
	html anchor
		callback: [ self logout ];
		with: 'Log out'
]
