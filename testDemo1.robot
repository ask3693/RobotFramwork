*** Settings ***

Documentation    To validate the login form
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${Login_Error_Message}      css:.alert-danger       #Global Variable


*** Test Cases ***
Unsuccessful login validation
	[Tags]    Regression
    Open The Browser With This URL
    Fill the login form
    Wait Until It Checks Error Message
    Validate the error message

*** Keywords ***
Open The Browser With This URL
    Create Webdriver    Chrome
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
	Input Text        id:username    rahulshettyacademy
	Input Password    id:password    12345678       #If input pwd is used, the pwd does not appear in
	Click Button      signInBtn


Wait until it checks error message
	Wait Until Element Is Visible       ${Login_Error_Message}

Validate the error message
	${result}=  Get Text          ${Login_Error_Message}     #Local Variable
	Should Be Equal As Strings    ${result}                 Incorrect username/password.
    Element Text Should Be        ${Login_Error_Message}    Incorrect username/password.  #Same action as above 2 lines


