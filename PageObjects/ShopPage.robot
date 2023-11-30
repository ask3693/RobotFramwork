*** Settings ***

Documentation    This file contains all objects & keywords of the shop page
Library          SeleniumLibrary
Library          Collections

*** Variables ***


*** Keywords ***


Verify card titles in the shop page
	@{expected_list}=   Create List         iphone X        Samsung Note 8      Nokia Edge      Blackberry
	${elements}=     Get Webelements     css:.card-title
	@{actual_list}=     Create List
	FOR    ${eachelement}  IN    @{elements}
		Log    ${eachelement.text}
		Append To List      ${actual_list}      ${eachelement.text}
	END
	Lists Should Be Equal    ${expected_list}       ${actual_list}

Select the card
	[Arguments]     ${cardname}
	${elements}=     Get Webelements     css:.card-title
	${index}=         Set Variable        1
	FOR    ${eachelement}  IN    @{elements}
          Exit For Loop If      '${cardname}'=='${eachelement.text}'
		  ${index}=    Evaluate  ${index} + 1
	END
	Click Button        xpath:(//*[@class='card-footer'])[${index}]/button
