*** Settings ***

Documentation    This file contains all objects & keywords of the landing page
Library          SeleniumLibrary
Library          Collections


*** Variables ***
${Login_Error_Message}      css:.alert-danger       #Global Variable



*** Keywords ***
Fill the login form
	[Arguments]       ${username}     ${password}
	Input Text        id:username    ${username}
	Input Password    id:password    ${password}       #If input pwd is used, the pwd does not appear in
	Click Button      signInBtn

Validate the error message
	Element Text Should Be        ${Login_Error_Message}    Incorrect username/password.

Fill the login details with user option
	[Arguments]       ${username}     ${password}
	Input Text        id:username    ${username}
	Input Password    id:password    ${password}
	Click Element     css:input[value='user']
	Wait Until Element Is Visible    okayBtn
	Click Element     okayBtn
	Click Element     okayBtn
	Wait Until Element Is Not Visible    okayBtn
	Select From List By Value    css:select.form-control        teach
	Select Checkbox    terms
	Checkbox Should Be Selected    terms

Wait until Element is located on the page
	Wait Until Element Is Visible       ${Login_Error_Message}
