!classDefinition: #ProjectTest category: #'Recu-2024-1c'!
TestCase subclass: #ProjectTest
	instanceVariableNames: 'danIngalls'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recu-2024-1c'!

!ProjectTest methodsFor: 'tests' stamp: 'HAW 7/7/2024 11:59:15'!
test01ConcreteTaskWithSameEffortAsDeveloperDedicationEndsOnStartingDate

	| ssaTask |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	
	self assert: (ssaTask endsOn: July/1/2024)! !

!ProjectTest methodsFor: 'tests' stamp: 'HAW 7/7/2024 11:59:15'!
test02ConcreteTaskWithSameEffortAsDeveloperDedicationDoesNotEndDifferentDateAsStartingDate

	| ssaTask |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	
	self deny: (ssaTask endsOn: July/2/2024)! !

!ProjectTest methodsFor: 'tests' stamp: 'HAW 7/7/2024 12:06:01'!
test03ConcreteTaskWithDifferentEffortAsDeveloperDedicationUsesWholeDaysToComplete

	| ssaTask |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 10*hour dependingOn: {}.
	
	self assert: (ssaTask endsOn: July/2/2024)! !

!ProjectTest methodsFor: 'tests' stamp: 'HAW 7/7/2024 12:09:51'!
test04TeamTimeToIsTheSlowestDeveloperTimeToComplete

	| ssbTask |
	
	ssbTask := ConcreteTask named: 'SS B' startingOn: July/1/2024 developedBy: self parcMobTeam taking: 16*hour dependingOn: {}.
	
	self assert: (ssbTask endsOn: (July/1/2024 next: (16*hour/(6*hour/day)) ceiling) previous)! !

!ProjectTest methodsFor: 'tests' stamp: 'HAW 7/7/2024 12:17:01'!
test05ConcreteTaskWithoutDependentsStartsOnDesiredStartingDate

	| ssaTask |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	
	self assert: (ssaTask startsOn: July/1/2024)! !

!ProjectTest methodsFor: 'tests' stamp: 'HAW 7/7/2024 12:17:47'!
test06ConcreteTaskWithoutDependentsDoesNotStartsOnDifferentDateAsDesiredStartingDate

	| ssaTask |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	
	self deny: (ssaTask startsOn: July/2/2024)! !

!ProjectTest methodsFor: 'tests' stamp: 'HAW 7/7/2024 12:25:44'!
test07ConcreteTaskWithDependentsEndingAfterDesiredStartingDateStartsOnNextLastDependentEndDate

	| ssaTask ssbTask sscTask |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	ssbTask := ConcreteTask named: 'SS B' startingOn: July/1/2024 developedBy: self parcMobTeam taking: 16*hour dependingOn: {}.
	sscTask := ConcreteTask named: 'SS C' startingOn: July/2/2024 developedBy: self alanKay taking: 16*hour dependingOn: {ssaTask. ssbTask }.
	
	self assert: (sscTask startsOn: ssbTask endDate next)! !

!ProjectTest methodsFor: 'tests' stamp: 'HAW 7/7/2024 12:25:36'!
test08ConcreteTaskWithDependentsEndingBeforeDesiredStartingDateStartsOnDesiredStartingDate

	| ssaTask sscTask |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	sscTask := ConcreteTask named: 'SS C' startingOn: July/3/2024 developedBy: self alanKay taking: 16*hour dependingOn: {ssaTask }.
	
	self assert: (sscTask startsOn: sscTask desiredStaringDate)! !

!ProjectTest methodsFor: 'tests' stamp: 'HAW 7/7/2024 12:34:59'!
test09ConcreteTaskEndDateUsesStartDateAndNotDesiredStartDate

	| ssaTask sscTask |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/2/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	sscTask := ConcreteTask named: 'SS C' startingOn: July/1/2024 developedBy: self danIngalls taking: 16*hour dependingOn: {ssaTask }.
	
	self assert: (sscTask endsOn: July/4/2024)! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/16/2025 11:48:21'!
test10ProjectStartsOnFirstStartDateOfSubtasks

	| ssaTask modelProject ssbTask |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/2/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	ssbTask := ConcreteTask named: 'SS B' startingOn: July/1/2024 developedBy: self parcMobTeam taking: 16*hour dependingOn: {}.
	modelProject := Project named: 'Modelo' composedBy: { ssaTask. ssbTask } .
	
	self assert: (modelProject startsOn: ssbTask startDate)! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/16/2025 11:48:33'!
test11ProjectDoesNotStartOnDifferentDateOfFirstStartDateOfSubtasks

	| ssaTask modelProject ssbTask |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/2/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	ssbTask := ConcreteTask named: 'SS B' startingOn: July/1/2024 developedBy: self parcMobTeam taking: 16*hour dependingOn: {}.
	modelProject := Project named: 'Modelo' composedBy: { ssaTask. ssbTask }.
	
	self deny: (modelProject startsOn: ssbTask startDate next)! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/16/2025 11:48:40'!
test12ProjectEndsOnLastEndDateOfSubtasks

	| ssaTask modelProject ssbTask |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	ssbTask := ConcreteTask named: 'SS B' startingOn: July/1/2024 developedBy: self parcMobTeam taking: 16*hour dependingOn: {}.
	modelProject := Project named: 'Modelo' composedBy: { ssaTask. ssbTask }.
	
	self assert: (modelProject endsOn: ssbTask endDate)! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/16/2025 11:48:47'!
test13ProjectDoesNotEndOnDifferentDateOfLastEndDateOfSubtasks

	| ssaTask modelProject ssbTask |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	ssbTask := ConcreteTask named: 'SS B' startingOn: July/1/2024 developedBy: self parcMobTeam taking: 16*hour dependingOn: {}.
	modelProject := Project named: 'Modelo' composedBy: { ssaTask. ssbTask } .
	
	self deny: (modelProject endsOn: ssbTask endDate next)! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/16/2025 11:48:52'!
test14WhenDeveloperDoNotHaveOverworkProjectDoNotHaveOverwork

	| ssaTask modelProject modelWoorksheet |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	modelProject := Project named: 'Modelo' composedBy: { ssaTask } .
	modelWoorksheet := modelProject worksheet.
	
	self deny: modelWoorksheet hasOverwork ! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/16/2025 11:49:00'!
test15WhenADeveloperHasOverworkProjectHasOverwork

	| ssaTask modelProject ssbTask modelWorksheet |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	ssbTask := ConcreteTask named: 'SS B' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	modelProject := Project named: 'Modelo' composedBy: { ssaTask. ssbTask } .
	modelWorksheet := modelProject worksheet.
	
	self assert: modelWorksheet hasOverwork! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/16/2025 11:49:06'!
test16DeveloperWithoutOneTasksOnSameDateHasNoOverwork

	| ssaTask modelProject ssbTask danIngallsOverworkingDates modelWorksheet |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	ssbTask := ConcreteTask named: 'SS B' startingOn: July/2/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	modelProject := Project named: 'Modelo' composedBy: { ssaTask. ssbTask }.
	modelWorksheet := modelProject worksheet.
	
	danIngallsOverworkingDates := modelWorksheet overworkingDatesOf: self danIngalls .
	
	self assert: danIngallsOverworkingDates isEmpty ! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/16/2025 11:49:15'!
test17DeveloperWithMoreThanOneTaskOnSameDateHasOverwork

	| ssaTask modelProject ssbTask danIngallsOverworkingDates modelWorksheet |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	ssbTask := ConcreteTask named: 'SS B' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	modelProject := Project named: 'Modelo' composedBy: { ssaTask. ssbTask }.
	modelWorksheet := modelProject worksheet.
	
	danIngallsOverworkingDates := modelWorksheet overworkingDatesOf: self danIngalls .
	
	self assert: danIngallsOverworkingDates size equals: 1.
	self assert: (danIngallsOverworkingDates includes: July/1/2024)! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/16/2025 11:49:36'!
test18DeveloperWithoutWorkHasNoOveworkingDates

	| ssaTask modelProject ssbTask alanKayOverworkingDates modelWorksheet |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	ssbTask := ConcreteTask named: 'SS B' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	modelProject := Project named: 'Modelo' composedBy: { ssaTask. ssbTask } .
	modelWorksheet := modelProject worksheet.
	
	alanKayOverworkingDates := modelWorksheet overworkingDatesOf: self alanKay .
	
	self assert: alanKayOverworkingDates isEmpty! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/16/2025 11:49:36'!
test19TeamCanHaveDevelopersWithOverWork

	| ssaTask modelProject ssbTask danIngallsOverworkingDates modelWorksheet |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	ssbTask := ConcreteTask named: 'SS B' startingOn: July/1/2024 developedBy: self parcMobTeam taking: 8*hour dependingOn: {}.
	modelProject := Project named: 'Modelo' composedBy: { ssaTask. ssbTask } .
	modelWorksheet := modelProject worksheet.
	
	danIngallsOverworkingDates := modelWorksheet overworkingDatesOf: self danIngalls .
	
	self assert: danIngallsOverworkingDates size equals: 1.
	self assert: (danIngallsOverworkingDates includes: July/1/2024)! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/16/2025 11:49:36'!
test20ProjectCostIsTheSumOfEachDeveloperCostPerWorkingDates

	| ssaTask modelProject ssbTask eprProject sscTask uiTask |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	ssbTask := ConcreteTask named: 'SS B' startingOn: July/1/2024 developedBy: self parcMobTeam taking: 16*hour dependingOn: {}.
	sscTask := ConcreteTask named: 'SS C' startingOn: July/2/2024 developedBy: self alanKay taking: 16*hour dependingOn: {ssaTask. ssbTask }.
	modelProject := Project named: 'Modelo' composedBy: { ssaTask. ssbTask. sscTask } .
	uiTask := ConcreteTask named: 'UI' startingOn: July/2/2024 developedBy: self adeleGoldberg taking: 6*hour dependingOn: { modelProject }.
	eprProject := Project named: 'EPR' composedBy: { modelProject. uiTask } .
	
	self assert: eprProject worksheet totalCost equals: 5450 * dollar! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/15/2025 10:51:45'!
test21DeveloperNameCannotBeEmpty

	self should: [ ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngallsEmptyName taking: 8*hour dependingOn: {}.]
	raise: Error
	withMessageText: Developer nameIsBlank.
	! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/15/2025 10:51:45'!
test22TaskNameCannotBeEmpty

	self should: [ ConcreteTask named: '' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.]
	raise: Error
	withMessageText: ConcreteTask nameIsBlank.
	! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/15/2025 10:51:45'!
test23TeamNameCannotBeEmpty

	self should: [ ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self parcMobTeamEmptyName taking: 8*hour dependingOn: {}.]
	raise: Error
	withMessageText: Team nameIsBlank.
	! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/16/2025 11:49:36'!
test24ProjectNameCannotBeEmpty

	| ssaTask |
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/2/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	self should: [ Project named: '' composedBy: { ssaTask. } .]
	raise: Error
	withMessageText: Project nameIsBlank.
	
	
! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/15/2025 10:30:12'!
test25EffortsAreStrictlyPositive
	self should:[
			ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: -8*hour dependingOn: {}.]
		raise: Error
		withMessageText: ConcreteTask needsToBeStrictlyPositive.
! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/15/2025 10:32:41'!
test26DedicationIsStrictlyPositive
	self should:[
			ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngallsWithNegativeDedication taking: 8*hour dependingOn: {}.]
		raise: Error
		withMessageText: Developer needsToBeStrictlyPositive.
! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/15/2025 10:33:19'!
test27CostIsStrictlyPositive
	self should:[
			ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngallsWithNegativeCost taking: 8*hour dependingOn: {}.]
		raise: Error
		withMessageText: Developer needsToBeStrictlyPositive.
! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/15/2025 10:36:03'!
test28TeamsShouldHaveAtLeast2Developers

	self should: [ ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self parcMobTeamOnly1Developer taking: 8*hour dependingOn: {}.]
	raise: Error
	withMessageText: Team shouldHaveAtLeast2Developers.
	! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/15/2025 11:41:51'!
test29TeamsCannotHaveDirectRepeatedDevelopers

	self should: [ ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self parcMobTeamRepeatedDeveloper taking: 8*hour dependingOn: {}.]
	raise: Error
	withMessageText: Team cannotHaveRepeatedDeveloper.
	! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/16/2025 11:56:09'!
test30TeamsCannotHaveIndirectRepeatedDevelopers

	self should: [Team named: 'Parc Mob Team' composedBy: { self danIngalls. Team named: 'ni idea' composedBy: {self danIngalls. self alanKay }withType: Slow. } withType: Slow. ]
	raise: Error
	withMessageText: Team cannotHaveRepeatedDeveloper.
	! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/15/2025 12:17:03'!
test31TasksCannotHaveIndirectRepeatedDependents

	| ssaTask ssbTask|
	ssbTask := ConcreteTask named: 'SS B' startingOn: July/2/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/2/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {ssbTask}.
	
	self should: [ ConcreteTask named: 'SS B' startingOn: July/1/2024 developedBy: self parcMobTeam taking: 8*hour dependingOn: {ssaTask. ssbTask}.]
	raise: Error
	withMessageText: ConcreteTask cannotHaveRepeatedDependents.
	! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/16/2025 11:49:36'!
test32ProjectMustHaveSubtasksOrSubprojects

	
	self should:[Project named: 'Modelo' composedBy: { } .]
	raise: Error
	withMessageText: Project projectIsEmpty.
	! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/16/2025 11:49:36'!
test33ProjectSubtasksCannotBeRepeated
	| ssaTask ssbTask sscTask |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	ssbTask := ConcreteTask named: 'SS B' startingOn: July/1/2024 developedBy: self parcMobTeam taking: 16*hour dependingOn: {}.
	sscTask := ConcreteTask named: 'SS C' startingOn: July/2/2024 developedBy: self alanKay taking: 16*hour dependingOn: {ssaTask. ssbTask }.
	
	self should:[Project named: 'Modelo' composedBy: { ssaTask. ssbTask. sscTask. ssaTask} .]
	raise: Error
	withMessageText: Project taskIsRepeated.
	! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/17/2025 16:07:44'!
test34VisualRepresentationOfTaskWithOneDeveloper
| ssaTask printedProject |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	
	printedProject := ProjectPrinter printFor: ssaTask.
	self assert: printedProject size equals: 1.
	 self assert: printedProject first equals: '2024/07/01 - 2024/07/01 - 1 * day - 1 dev  |-> SS A'! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/17/2025 16:00:39'!
test35VisualRepresentationOfTaskWithTwoDevelopers
| ssaTask printedProject |
	
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self parcMobTeam taking: 8*hour dependingOn: {}.
	
	printedProject := ProjectPrinter printFor: ssaTask.
	self assert: printedProject size equals: 1.
	 self assert: printedProject first equals: '2024/07/01 - 2024/07/02 - 2 * days - 2 devs |-> SS A'! !

!ProjectTest methodsFor: 'tests' stamp: 'mm 7/17/2025 18:36:59'!
test36VisualRepresentationOfProjectWithSubtasks
| printedProject project stream |

	
	project := self epr .
	
	printedProject := ProjectPrinter printFor: project.
	self assert: printedProject size equals: 6.
	stream := ReadStream on: printedProject .
	self assert: stream next equals: '2024/07/01 - 2024/07/07 - 7*days - 3 devs |-> ERP'.
	self assert: stream next equals: '2024/07/01 - 2024/07/06 - 6*days - 2 devs  |-> Modelo'.
	self assert: stream next equals: '2024/07/01 - 2024/07/01 - 1*day - 1 dev      |-> SS A'.
	self assert: stream next equals: '2024/07/01 - 2024/07/03 - 3*days - 2 devs   |-> SS B'.
	self assert: stream next equals: '2024/07/04 - 2024/07/06 - 3*days - 1 dev    |-> SS C'.
	self assert: stream next equals: '2024/07/07 - 2024/07/07 - 1*day - 1 dev    |-> UI'.! !


!ProjectTest methodsFor: 'developers' stamp: 'HAW 7/7/2024 13:26:06'!
adeleGoldberg
	
	^Developer named: 'Adele Goldberg' thatWorks: 10*hour/day earning: 65*dollar/hour! !

!ProjectTest methodsFor: 'developers' stamp: 'HAW 7/7/2024 12:10:56'!
alanKay
	
	^Developer named: 'Alan Kay' thatWorks: 6*hour/day earning: 80*dollar/hour! !

!ProjectTest methodsFor: 'developers' stamp: 'HAW 7/7/2024 13:00:38'!
danIngalls

	danIngalls ifNil: [ danIngalls := Developer named: 'Dan Ingalls' thatWorks: 8*hour/day earning: 60*dollar/hour ].
	^danIngalls! !

!ProjectTest methodsFor: 'developers' stamp: 'mm 7/15/2025 10:12:18'!
danIngallsEmptyName

	danIngalls ifNil: [ danIngalls := Developer named: '' thatWorks: 8*hour/day earning: 60*dollar/hour ].
	^danIngalls! !

!ProjectTest methodsFor: 'developers' stamp: 'mm 7/15/2025 10:33:34'!
danIngallsWithNegativeCost

	danIngalls ifNil: [ danIngalls := Developer named: 'Dan Ingalls' thatWorks: 8*hour/day earning: -60*dollar/hour ].
	^danIngalls! !

!ProjectTest methodsFor: 'developers' stamp: 'mm 7/15/2025 10:31:17'!
danIngallsWithNegativeDedication

	danIngalls ifNil: [ danIngalls := Developer named: 'Dan Ingalls' thatWorks: -8*hour/day earning: 60*dollar/hour ].
	^danIngalls! !


!ProjectTest methodsFor: 'teams' stamp: 'mm 7/17/2025 18:27:22'!
epr
	| eprProject modelProject ssaTask ssbTask sscTask uiTask |
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: self danIngalls taking: 8*hour dependingOn: {}.
	ssbTask := ConcreteTask named: 'SS B' startingOn: July/1/2024 developedBy: self parcMobTeam taking: 16*hour dependingOn: {}.
	sscTask := ConcreteTask named: 'SS C' startingOn: July/2/2024 developedBy: self alanKay taking: 16*hour dependingOn: {ssaTask. ssbTask }.
	modelProject := Project named: 'Modelo' composedBy: { ssaTask. ssbTask. sscTask } .
	uiTask := ConcreteTask named: 'UI' startingOn: July/2/2024 developedBy: self adeleGoldberg taking: 6*hour dependingOn: { modelProject }.
	eprProject := Project named: 'EPR' composedBy: { modelProject. uiTask } .
	^eprProject ! !

!ProjectTest methodsFor: 'teams' stamp: 'mm 7/16/2025 11:53:22'!
parcMobTeam
	
	^Team named: 'Parc Mob Team' composedBy: { self danIngalls. self alanKay } withType: Slow.! !

!ProjectTest methodsFor: 'teams' stamp: 'mm 7/16/2025 11:53:25'!
parcMobTeamEmptyName
	
	^Team named: '' composedBy: { self danIngalls. self alanKay } withType: Slow.! !

!ProjectTest methodsFor: 'teams' stamp: 'mm 7/16/2025 11:53:29'!
parcMobTeamOnly1Developer
	
	^Team named: 'Parc Mob Team' composedBy: { self danIngalls.} withType: Slow.! !

!ProjectTest methodsFor: 'teams' stamp: 'mm 7/16/2025 11:53:32'!
parcMobTeamRepeatedDeveloper
	
	^Team named: 'Parc Mob Team' composedBy: { self danIngalls. self danIngalls } withType: Slow.! !


!classDefinition: #TeamTest category: #'Recu-2024-1c'!
TestCase subclass: #TeamTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recu-2024-1c'!

!TeamTest methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 10:59:40'!
adeleGoldberg
	
	^Developer named: 'Adele Goldberg' thatWorks: 10*hour/day earning: 65*dollar/hour! !

!TeamTest methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 10:59:13'!
alanKay
	
	^Developer named: 'Alan Kay' thatWorks: 6*hour/day earning: 80*dollar/hour! !

!TeamTest methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 10:59:31'!
danIngalls
	^Developer named: 'Dan Ingalls' thatWorks: 8*hour/day earning: 60*dollar/hour ! !

!TeamTest methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 11:52:43'!
test01FastTeamUsesFastestDevelopersEffort
	| team ssaTask fastestDeveloperTime |
	team := Team named: 'Fast Team' composedBy: {self alanKay. self danIngalls. self adeleGoldberg }withType: Fast.
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: team taking: 500*hour dependingOn: {}.
	fastestDeveloperTime := self adeleGoldberg timeToComplete: 500*hour.
	
	self assert: ssaTask endDate equals: ((July/1/2024 next: fastestDeveloperTime) previous).! !

!TeamTest methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 11:52:48'!
test02ParallelTeamDividesEffortBetweenAllDevelopers
	| team ssaTask teamEffort |
	team := Team named: 'Parallel Team' composedBy: {self alanKay. self danIngalls}withType: Parallel.
	ssaTask := ConcreteTask named: 'SS A' startingOn: July/1/2024 developedBy: team taking: 18*hour dependingOn: {}.
	teamEffort :=  {self alanKay timeToComplete: 9*hour .self danIngalls timeToComplete: 9*hour } min.
	
	self assert: ssaTask endDate equals: (July/1/2024 next: teamEffort) previous.! !

!TeamTest methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 12:09:59'!
test03CannotComposeTeamsWithDifferentType
	self 
		should:[Team named: 'Composed Team' composedBy: {self alanKay. Team named: 'Parallel Team' composedBy: {self danIngalls. self adeleGoldberg } withType: Parallel.} withType: Slow.]
		raise: Error 
		withMessageText: Team teamsAreNotTheSameTypeErrorDescription.! !

!TeamTest methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 12:12:30'!
test04CanComposeTeamsWithSameType
	| team |
	team := Team named: 'Composed Team' composedBy: {self alanKay. 
				Team named: 'Parallel Team' composedBy: {self danIngalls. self adeleGoldberg } withType: Parallel.} 
			withType: Parallel.
	self assert: team type equals: Parallel.! !


!classDefinition: #ProjectPrinter category: #'Recu-2024-1c'!
Object subclass: #ProjectPrinter
	instanceVariableNames: 'task identation lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recu-2024-1c'!

!ProjectPrinter methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 17:52:20'!
initializeFor: aProject
	task := aProject! !

!ProjectPrinter methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 17:57:01'!
print
	lines := OrderedCollection new.
	identation := 0.
	
	task printWith: self.
	
	^lines! !

!ProjectPrinter methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 18:10:54'!
printConcreteTask: aConcreteTask
	self printTask: aConcreteTask ! !

!ProjectPrinter methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 15:40:56'!
printDate: aDate on: stream

	^ stream print:aDate year number;
			nextPut: $/;
			nextPutAll: ((aDate month number printString) padded: #left to: 2  with: $0); 
			nextPut: $/;
			nextPutAll: ((aDate dayNumber printString) padded: #left to: 2  with: $0)! !

!ProjectPrinter methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 18:00:24'!
printProject: aProject

	self printTask: aProject .
	identation := identation + 1.
	aProject printSubtasksWith: self.
	identation := identation - 1.! !

!ProjectPrinter methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 18:38:24'!
printTask: aTask
	| amountOfDevelopers line |
	
	line :=  String streamContents: [:stream|
		self printDate: aTask startDate on: stream.
		stream nextPutAll: ' - '.
		self printDate: aTask endDate on: stream.
		stream nextPutAll: ' - '.
		stream nextPutAll: ((aTask timeToComplete + (1*day))printString padded: #left to: 6 with: $ ).
		stream nextPutAll: ' - '.
		amountOfDevelopers := aTask amountOfDevelopers.
		stream print: amountOfDevelopers .
		stream nextPutAll: ((' dev' pluralize: amountOfDevelopers > 1) padded: #right to: 6 with: $ ).
		stream nextPutAll: ('|-> ' padded: #left to: identation with: $ ).
		stream nextPutAll: aTask name.
		].
	lines add: line! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ProjectPrinter class' category: #'Recu-2024-1c'!
ProjectPrinter class
	instanceVariableNames: ''!

!ProjectPrinter class methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 15:19:19'!
for: aTask
	^self new initializeFor: aTask! !

!ProjectPrinter class methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 15:18:23'!
printFor: aTask
	^(self for: aTask) print! !


!classDefinition: #Responsable category: #'Recu-2024-1c'!
Object subclass: #Responsable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recu-2024-1c'!

!Responsable methodsFor: 'worksheet' stamp: 'HAW 7/7/2024 13:30:37'!
addWorkingDates: aWorkingDates to: aWorksheet

	self subclassResponsibility! !


!Responsable methodsFor: 'effort' stamp: 'HAW 7/7/2024 12:35:56'!
timeToComplete: anEffort

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Responsable class' category: #'Recu-2024-1c'!
Responsable class
	instanceVariableNames: ''!

!Responsable class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 10:58:57'!
assertNameIsNotBlank: aName

	^ aName withBlanksTrimmed ifEmpty: [self error: self nameIsBlank ]! !

!Responsable class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 10:59:03'!
nameIsBlank
	^'Name cannot be blank'! !

!Responsable class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 10:31:35'!
needsToBeStrictlyPositive
	^'Measure needs to be strictly positive'! !


!classDefinition: #Developer category: #'Recu-2024-1c'!
Responsable subclass: #Developer
	instanceVariableNames: 'name dedication cost'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recu-2024-1c'!

!Developer methodsFor: 'initialization' stamp: 'HAW 7/7/2024 11:55:16'!
initializeNamed: aName thatWorks: aDedication earning: aCost 
	
	name := aName.
	dedication := aDedication.
	cost := aCost.! !


!Developer methodsFor: 'worksheet' stamp: 'HAW 7/7/2024 13:10:37'!
addWorkingDates: aWorkingDates to: aWorksheet 
	
	aWorksheet addWorkingDates: aWorkingDates toDeveloper: self! !

!Developer methodsFor: 'worksheet' stamp: 'HAW 7/7/2024 13:32:14'!
dailyCost
	
	^dedication * cost! !

!Developer methodsFor: 'worksheet' stamp: 'HAW 7/7/2024 13:32:04'!
totalCostWorking: aWorkingDates 
	
	^aWorkingDates size * day * self dailyCost ! !


!Developer methodsFor: 'effort' stamp: 'mm 7/15/2025 11:54:22'!
addAllDevelopersTo: allDevelopers
	allDevelopers add: self
! !

!Developer methodsFor: 'effort' stamp: 'HAW 7/7/2024 12:06:37'!
timeToComplete: anEffort 
	
	^(anEffort / dedication) ceiling ! !


!Developer methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 14:17:55'!
amountOfDevelopers
	^1! !

!Developer methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 12:07:06'!
areYouATeam
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Developer class' category: #'Recu-2024-1c'!
Developer class
	instanceVariableNames: ''!

!Developer class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 11:01:43'!
assertMeasureIsStrictlyPositive: aMeasure

	^ aMeasure strictlyPositive ifFalse: [self error: self needsToBeStrictlyPositive]! !

!Developer class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 11:03:44'!
assertMeasuresAreStrictlyPositiveFor: aCost and: aDedication

	self assertMeasureIsStrictlyPositive: aDedication.
	self assertMeasureIsStrictlyPositive: aCost! !

!Developer class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 11:03:44'!
named: aName thatWorks: aDedication earning: aCost 

	self assertNameIsNotBlank: aName.
	self assertMeasuresAreStrictlyPositiveFor: aCost and: aDedication.
	
	^self new initializeNamed: aName thatWorks: aDedication earning: aCost ! !


!classDefinition: #Team category: #'Recu-2024-1c'!
Responsable subclass: #Team
	instanceVariableNames: 'name responsables type'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recu-2024-1c'!

!Team methodsFor: 'initialization' stamp: 'HAW 7/7/2024 12:11:30'!
initializeNamed: aName composedBy: aResponsables 
	
	name := aName.
	responsables := aResponsables.! !


!Team methodsFor: 'worksheet' stamp: 'HAW 7/7/2024 13:14:59'!
addWorkingDates: aWorkingDates to: aWorksheet 
	
	responsables do: [ :aResponsable | aResponsable addWorkingDates: aWorkingDates to: aWorksheet ]! !


!Team methodsFor: 'effort' stamp: 'mm 7/15/2025 11:53:58'!
addAllDevelopersTo: allDevelopers
	responsables do: [:aResponsable | allDevelopers add: aResponsable ].! !

!Team methodsFor: 'effort' stamp: 'mm 7/16/2025 11:45:36'!
timeToComplete: anEffort 
	self subclassResponsibility ! !


!Team methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 14:24:49'!
amountOfDevelopers
	| allDevelopers |
	allDevelopers := OrderedCollection new.
	responsables do: [:aResponsable | aResponsable addAllDevelopersTo: allDevelopers ].
	^allDevelopers size
! !

!Team methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 12:07:25'!
areYouATeam
	^true! !

!Team methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 12:08:08'!
type
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Team class' category: #'Recu-2024-1c'!
Team class
	instanceVariableNames: ''!

!Team class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 10:39:13'!
cannotHaveRepeatedDeveloper
	^'cannot have repeated developer'! !

!Team class methodsFor: 'instance creation' stamp: 'mm 7/16/2025 12:03:41'!
named: aName composedBy: aResponsables withType: aTeamType  
	self assertTeams: aResponsables areAllSameType: aTeamType.
	self assertNameIsNotBlank: aName.
	self selfAssertTeamAssembledCorrectly: aResponsables.
	
	^aTeamType new initializeNamed: aName composedBy: aResponsables ! !

!Team class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 12:00:45'!
selfAssertTeamAssembledCorrectly: aResponsables
	
	| allDevelopers |
	aResponsables size <= 1 ifTrue: [self error: self shouldHaveAtLeast2Developers].
	allDevelopers := OrderedCollection new.
	aResponsables do: [:aResponsable| aResponsable addAllDevelopersTo: allDevelopers].
	allDevelopers size = allDevelopers asSet size ifFalse: [self error: self cannotHaveRepeatedDeveloper ]! !

!Team class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 10:37:14'!
shouldHaveAtLeast2Developers
	^'Team should have at least 2 developers'! !


!Team class methodsFor: 'errors' stamp: 'mm 7/16/2025 12:00:56'!
teamsAreNotTheSameTypeErrorDescription
	^'Teams should have the same type'! !


!Team class methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 12:06:48'!
assertTeams: aResponsables areAllSameType: aTeamType
	| teams |
	teams := aResponsables select: [:aResponsable | aResponsable areYouATeam].
	teams do: [:aTeam | aTeam type = aTeamType ifFalse:[self error: self teamsAreNotTheSameTypeErrorDescription ].].! !


!classDefinition: #Fast category: #'Recu-2024-1c'!
Team subclass: #Fast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recu-2024-1c'!

!Fast methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 11:52:32'!
timeToComplete: anEffort
	^responsables min: [ :aResponsable | aResponsable timeToComplete: anEffort ]! !

!Fast methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 12:07:49'!
type
	^self class! !


!classDefinition: #Parallel category: #'Recu-2024-1c'!
Team subclass: #Parallel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recu-2024-1c'!

!Parallel methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 11:44:53'!
timeToComplete: anEffort
	^responsables max: [:aResponsable | aResponsable timeToComplete: (anEffort/responsables size) ]! !

!Parallel methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 12:07:56'!
type
	^self class! !


!classDefinition: #Slow category: #'Recu-2024-1c'!
Team subclass: #Slow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recu-2024-1c'!

!Slow methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 11:45:18'!
timeToComplete: anEffort
	^responsables max: [ :aResponsable | aResponsable timeToComplete: anEffort ] ! !

!Slow methodsFor: 'as yet unclassified' stamp: 'mm 7/16/2025 12:08:00'!
type
	^self class! !


!classDefinition: #Task category: #'Recu-2024-1c'!
Object subclass: #Task
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recu-2024-1c'!

!Task methodsFor: 'start date' stamp: 'HAW 7/7/2024 12:46:14'!
startDate

	self subclassResponsibility! !

!Task methodsFor: 'start date' stamp: 'HAW 7/7/2024 12:46:34'!
startsOn: aPotentialStaringDate 
	
	^aPotentialStaringDate = self startDate ! !


!Task methodsFor: 'end date' stamp: 'HAW 7/7/2024 12:45:46'!
endDate

	self subclassResponsibility! !

!Task methodsFor: 'end date' stamp: 'HAW 7/7/2024 12:46:00'!
endsOn: aPotentialEndDate 
	
	^aPotentialEndDate = self endDate! !


!Task methodsFor: 'worksheet' stamp: 'HAW 7/7/2024 13:34:19'!
addWorkingDatesTo: aWorksheet

	self subclassResponsibility! !


!Task methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 15:45:06'!
name 
	^name! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Task class' category: #'Recu-2024-1c'!
Task class
	instanceVariableNames: ''!

!Task class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 11:01:11'!
assertMeasureIsStrictlyPositive: aMeasure

	^ aMeasure strictlyPositive ifFalse: [self error: self needsToBeStrictlyPositive]! !

!Task class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 10:56:50'!
assertNameIsNotBlank: aName

	^ aName withBlanksTrimmed ifEmpty: [self error: self nameIsBlank ]! !

!Task class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 10:57:01'!
nameIsBlank
	^'Name cannot be blank'! !

!Task class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 10:29:45'!
needsToBeStrictlyPositive
	^'Measure needs to be strictly positive'! !


!classDefinition: #ConcreteTask category: #'Recu-2024-1c'!
Task subclass: #ConcreteTask
	instanceVariableNames: 'desiredStartDate responsable dependents effort'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recu-2024-1c'!

!ConcreteTask methodsFor: 'initialization' stamp: 'HAW 7/7/2024 11:59:53'!
initializeNamed: aName startingOn: aDesiredStartDate developedBy: aResponsable taking: anEffort dependingOn: aDependents 
	
	name := aName.
	desiredStartDate := aDesiredStartDate.
	responsable := aResponsable.
	effort := anEffort.
	dependents := aDependents.! !


!ConcreteTask methodsFor: 'effort' stamp: 'HAW 7/7/2024 12:03:56'!
timeToComplete

	^ (responsable timeToComplete: effort) - (1*day)! !


!ConcreteTask methodsFor: 'end date' stamp: 'HAW 7/7/2024 12:32:23'!
endDate

	^ self startDate next: self timeToComplete! !

!ConcreteTask methodsFor: 'end date' stamp: 'HAW 7/7/2024 12:29:33'!
maxDependentsEndDate

	^ dependents max: [ :aDependent | aDependent endDate ]! !


!ConcreteTask methodsFor: 'start date' stamp: 'HAW 7/7/2024 12:25:59'!
desiredStaringDate
	
	^desiredStartDate ! !

!ConcreteTask methodsFor: 'start date' stamp: 'HAW 7/7/2024 13:54:20'!
startDate

	^ dependents 
		ifEmpty: [ desiredStartDate ]
		ifNotEmpty: [ self startDateWithDependents ]! !

!ConcreteTask methodsFor: 'start date' stamp: 'HAW 7/7/2024 13:54:20'!
startDateWithDependents

	^ self maxDependentsEndDate next max: desiredStartDate! !


!ConcreteTask methodsFor: 'worksheet' stamp: 'mm 7/15/2025 12:24:34'!
addAllDependents: allDependents
	dependents do: [:aDependent | allDependents add: aDependent ].
	allDependents add: self.! !

!ConcreteTask methodsFor: 'worksheet' stamp: 'mm 7/17/2025 19:05:26'!
addAllDevelopersTo: allDevelopers
	responsable addAllDevelopersTo: allDevelopers ! !

!ConcreteTask methodsFor: 'worksheet' stamp: 'HAW 7/7/2024 13:53:20'!
addWorkingDatesTo: aWorksheet 
	
	responsable addWorkingDates: self workingDates to: aWorksheet ! !

!ConcreteTask methodsFor: 'worksheet' stamp: 'mm 7/17/2025 14:17:41'!
amountOfDevelopers
	^responsable amountOfDevelopers! !

!ConcreteTask methodsFor: 'worksheet' stamp: 'mm 7/17/2025 17:54:56'!
printWith: aProjectPrinter
	aProjectPrinter printConcreteTask: self! !

!ConcreteTask methodsFor: 'worksheet' stamp: 'HAW 7/7/2024 13:53:15'!
workingDates

	^ self startDate to: self endDate! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ConcreteTask class' category: #'Recu-2024-1c'!
ConcreteTask class
	instanceVariableNames: ''!

!ConcreteTask class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 12:24:22'!
assertNoRepeatedDependents: aDependents
	| allDependents |
	allDependents := OrderedCollection new.
	aDependents do: [:aDependent | aDependent addAllDependents: allDependents].
	allDependents size = allDependents asSet size ifFalse: [self error: self cannotHaveRepeatedDependents]! !

!ConcreteTask class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 10:44:05'!
cannotHaveRepeatedDependents
	^'Cannot have repeated dependents'! !

!ConcreteTask class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 12:19:48'!
named: aName startingOn: aDesiredStartDate developedBy: aResponsable taking: anEffort dependingOn: aDependents 

	self assertNameIsNotBlank: aName.
	self assertMeasureIsStrictlyPositive: anEffort.
	self assertNoRepeatedDependents: aDependents.
	
	^self new initializeNamed: aName startingOn: aDesiredStartDate developedBy: aResponsable taking: anEffort dependingOn: aDependents ! !


!classDefinition: #Project category: #'Recu-2024-1c'!
Task subclass: #Project
	instanceVariableNames: 'subtasks'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recu-2024-1c'!

!Project methodsFor: 'initialization' stamp: 'HAW 7/7/2024 12:38:45'!
initializeNamed: aName composedBy: aSubtasks 
	
	name := aName.
	subtasks := aSubtasks.! !


!Project methodsFor: 'worksheet' stamp: 'HAW 7/7/2024 13:26:40'!
addWorkingDatesTo: aWorksheet 
	
	subtasks do: [ :aSubtask | aSubtask addWorkingDatesTo: aWorksheet ]! !

!Project methodsFor: 'worksheet' stamp: 'HAW 7/7/2024 13:36:18'!
subtasksDo: aBlock 
	
	subtasks do: aBlock ! !

!Project methodsFor: 'worksheet' stamp: 'HAW 7/7/2024 13:17:32'!
worksheet

	^ Worksheet of: self! !


!Project methodsFor: 'end date' stamp: 'HAW 7/7/2024 12:45:13'!
endDate
	
	^subtasks max: [ :aSubtask | aSubtask endDate ]! !


!Project methodsFor: 'start date' stamp: 'mm 7/15/2025 12:30:42'!
addAllDependents: allDependents
	! !

!Project methodsFor: 'start date' stamp: 'mm 7/17/2025 19:02:20'!
addAllDevelopersTo: allDevelopers
	subtasks do: [:aSubtask | aSubtask addAllDevelopersTo: allDevelopers ].
	! !

!Project methodsFor: 'start date' stamp: 'HAW 7/7/2024 12:41:10'!
startDate
	
	^subtasks min: [ :subtask | subtask startDate ]! !


!Project methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 20:13:24'!
allDevelopers
	| allDevelopers |
	allDevelopers := Set new.
	subtasks do: [:aSubtask | aSubtask addAllDevelopersTo: allDevelopers ].
	^allDevelopers! !

!Project methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 20:12:42'!
amountOfDevelopers
	
	^self allDevelopers size! !

!Project methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 18:09:38'!
printSubtasksWith: aProjectPrinter
	subtasks do: [:aSubtask | aSubtask printWith: aProjectPrinter ].! !

!Project methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 17:55:22'!
printWith: aProjectPrinter
	aProjectPrinter printProject: self! !

!Project methodsFor: 'as yet unclassified' stamp: 'mm 7/17/2025 16:19:57'!
timeToComplete
	^self startDate distanceTo: self endDate! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Project class' category: #'Recu-2024-1c'!
Project class
	instanceVariableNames: ''!

!Project class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 12:34:03'!
assertProjectIsNotEmpty: aSubtasks 
	aSubtasks ifEmpty: [self error: self projectIsEmpty].! !

!Project class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 12:38:09'!
assertTasksAreNotRepeated: aSubtasks
	aSubtasks size = aSubtasks asSet size ifFalse:[ self error: self taskIsRepeated]! !

!Project class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 12:37:01'!
named: aName composedBy: aSubtasks 

	self assertNameIsNotBlank: aName.
	self assertProjectIsNotEmpty: aSubtasks .
	self assertTasksAreNotRepeated: aSubtasks .
	^self new initializeNamed: aName composedBy: aSubtasks ! !

!Project class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 12:34:57'!
projectIsEmpty
	^'Project must be composed by either a subtask or a subproject'! !

!Project class methodsFor: 'instance creation' stamp: 'mm 7/15/2025 12:38:33'!
taskIsRepeated
	^'Cannot have repeated tasks'! !


!classDefinition: #Worksheet category: #'Recu-2024-1c'!
Object subclass: #Worksheet
	instanceVariableNames: 'developersWorkingDates'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recu-2024-1c'!

!Worksheet methodsFor: 'cost' stamp: 'HAW 7/7/2024 13:41:42'!
totalCost
	
	^developersWorkingDates keys sum: [ :aDeveloper | aDeveloper totalCostWorking: (self workingDatesOf: aDeveloper) ]! !


!Worksheet methodsFor: 'initialization' stamp: 'HAW 7/7/2024 15:30:44'!
initializeOf: aProject 
	
	developersWorkingDates := Dictionary new.
	aProject addWorkingDatesTo: self.
! !


!Worksheet methodsFor: 'overwork' stamp: 'HAW 7/7/2024 13:37:47'!
hasOverwork
	
	^developersWorkingDates keys anySatisfy: [ :aDeveloper | (self overworkingDatesOf: aDeveloper) notEmpty ]! !

!Worksheet methodsFor: 'overwork' stamp: 'HAW 7/7/2024 13:40:20'!
overworkingDatesOf: aDeveloper  
	
	| developerOverWorkingDates |
	
	developerOverWorkingDates := Set new.
	(self workingDatesOf: aDeveloper) withOccurrencesDo: [ :date :occurrences | 
		occurrences > 1 ifTrue: [ developerOverWorkingDates add: date ]].
	
	^developerOverWorkingDates
	! !


!Worksheet methodsFor: 'developers workingdates' stamp: 'HAW 7/7/2024 13:39:22'!
addWorkingDates: aWorkingDates toDeveloper: aDeveloper 
	
	| developerWorkingDates |
	
	developerWorkingDates := self workingDatesOf: aDeveloper.
	developerWorkingDates addAll: aWorkingDates ! !

!Worksheet methodsFor: 'developers workingdates' stamp: 'HAW 7/7/2024 13:39:22'!
workingDatesOf: aDeveloper

	^ developersWorkingDates at: aDeveloper ifAbsentPut: [ Bag new ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Worksheet class' category: #'Recu-2024-1c'!
Worksheet class
	instanceVariableNames: ''!

!Worksheet class methodsFor: 'instance creation' stamp: 'HAW 7/7/2024 13:08:35'!
of: aProject 
	
	^self new initializeOf: aProject ! !
