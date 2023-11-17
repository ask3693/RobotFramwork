*** Settings ***

Documentation    To demonstrate csv handling within robot framework
Library    SeleniumLibrary
Library     DataDriver          file=resources/data.csv     encoding=utf_8      dialect=unix
Test Teardown    Close Browser
Test Template    Unsuccessful login                 #This line needs to be defined when using parameterized testing

*** Variables ***
${Login_Error_Message}      css:.alert-danger       #Global Variable


*** Test Cases ***
Login with user ${username} and password ${password}        syedalisk       learning
	[Tags]    Regression
#Default username and password

*** Keywords ***

Unsuccessful login                                          #This testcase has to be moved to keywords
	[Arguments]         ${username}     ${password}         #And the name of testcases added as Test Template within Settings
    Open The Browser With This URL
    Fill the login form     ${username}     ${password}
    Wait Until It Checks Error Message
    Validate the error message

Open The Browser With This URL
    Create Webdriver    Chrome
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
	[Arguments]         ${username}     ${password}
	Input Text        id:username    ${username}
	Input Password    id:password    ${password}       #If input pwd is used, the pwd does not appear in
	Click Button      signInBtn

Wait until it checks error message
	Wait Until Element Is Visible       ${Login_Error_Message}

Validate the error message
	Element Text Should Be        ${Login_Error_Message}    Incorrect username/password.
