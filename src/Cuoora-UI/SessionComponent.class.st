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

{ #category : #seaside }
SessionComponent >> children [
	^ {bodyComponent}
]

{ #category : #rendering }
SessionComponent >> goToUserProfile [
	bodyComponent call: (UserProfileComponent with: self session user)
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
	html heading: 'CuOOra'.
	html anchor
		callback: [ self goToUserProfile ];
		with: self session user username.
	html space.
	html anchor
		callback: [ self logout ];
		with: 'Log out'
]
