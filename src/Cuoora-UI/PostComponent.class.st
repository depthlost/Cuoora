Class {
	#name : #PostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'post',
		'changeComponent'
	],
	#category : #'Cuoora-UI'
}

{ #category : #initialization }
PostComponent class >> with: aPost andChangeComponent: aChangeComponent [
	^ self new with: aPost andChangeComponent: aChangeComponent
]

{ #category : #callbacks }
PostComponent >> goToUserProfile [
	changeComponent call: (UserProfileComponent with: post author)
]

{ #category : #callbacks }
PostComponent >> qualify: isLike [
	post addCalificationOf: self session user isLike: isLike
]

{ #category : #rendering }
PostComponent >> renderAuthorOn: html [
	html text: 'Realizada por '.
	html anchor
		callback: [ self goToUserProfile ];
		with: post author username.
	html break
]

{ #category : #rendering }
PostComponent >> renderCalificationsOn: html [
	html
		text: post getLikes asString, ' likes | ', post getDislikes asString, ' dislikes';
		break.
	html anchor
		callback: [ self qualify: true ];
		with: 'like'.
	html text: ' | '.
	html anchor
		callback: [ self qualify: false ];
		with: 'dislike'.
	html break
]

{ #category : #rendering }
PostComponent >> renderContentOn: html [
	post description ifNotEmpty: [ self renderDescriptionOn: html ].
	self renderCalificationsOn: html
]

{ #category : #rendering }
PostComponent >> renderDescriptionOn: html [
	html text: post description.
	html break.
]

{ #category : #initialization }
PostComponent >> with: aPost andChangeComponent: aChangeComponent [
	post := aPost.
	changeComponent := aChangeComponent
]
