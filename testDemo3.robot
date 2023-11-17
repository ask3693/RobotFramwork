*** Settings ***

Documentation    To switch child window
Library          SeleniumLibrary
Library          Collections
Library          String
Test Setup       Open The Browser With This URL
#Test Teardown    Close Browser
Resource         Generic.robot

*** Variables ***
${email}


*** Test Cases ***
Validate child window functionality
	[Tags]    Regression
	Select the link of child window
	Verify the user has switched to child window
	Grab the email Id in the child window
	Switch back to parent window and enter email

*** Keywords ***
Select the link of child window
	Click Element       css:.blinkingText
	Sleep               5

Verify the user has switched to child window
	Switch Window       New
	Element Text Should Be    css:h1    DOCUMENTS REQUEST

Grab the email Id in the child window
	${text}=    Get Text    css:.red                #Getting the whole text
	@{words}=   Split String    ${text}     at      #Splitting the words in 2 indexes before 'at' and after 'at'
	#Please email us -> 0th element
	#mentor@rahulshetty... -> 1st element
	${text_split}=      Get From List       ${words}        1       #save the 1st index in another variable
	@{words2}=   Split String    ${text_split}                      #Split the 1st variable into 2 before and after email
	${email}=      Get From List       ${words2}        0           #save the 0th index (email) in another variable
	Set Global Variable        ${email}
	log     (${email})                              #log to verify the text



Switch back to parent window and enter email
	Switch Window       Main
	Title Should Be     LoginPage Practise | Rahul Shetty Academy
    Input Text          id:username         ${email}



