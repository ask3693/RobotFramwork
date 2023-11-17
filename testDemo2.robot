*** Settings ***

Documentation    To validate the shopping page
Library          SeleniumLibrary
Library          Collections
Test Setup       Open The Browser With This URL
#Test Teardown    Close Browser
Resource         Generic.robot

*** Variables ***
#${Login_Error_Message}         css:.alert-danger       #Global
${shop_page_load_check}         css:.nav-link           #Global


*** Test Cases ***
#Unsuccessful login validation
#    Fill the login form         ${UserName}     ${pwd_wrong}
#    Wait until Element is located on the page       ${Login_Error_Message}
#    Validate the error message

Validate cards displayed in the shopping page
	Fill The Login Form         ${UserName}     ${pwd_valid}
	Wait until Element is located on the page       ${shop_page_load_check}
    Verify card titles in the shop page
    Select the card     Blackberry

Select the form and navigate to child window
	Fill the login details with user option     rahulshettyacademy      learning













*** Keywords ***

Fill the login form
	[Arguments]       ${username}     ${password}
	Input Text        id:username    ${username}
	Input Password    id:password    ${password}       #If input pwd is used, the pwd does not appear in
	Click Button      signInBtn

Wait until Element is located on the page
	[Arguments]    ${element}
	Wait Until Element Is Visible       ${element}

Validate the error message
    Element Text Should Be        ${Login_Error_Message}    Incorrect username/password.  #Same action as above 2 lines

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

Fill the login details with user option
	[Arguments]       ${username}     ${password}
	Input Text        id:username    ${username}
	Input Password    id:password    ${password}
	Click Element     css:input[value='user']
	Wait Until Element Is Visible    okayBtn
	Click Element     okayBtn
	Wait Until Element Is Not Visible    okayBtn
	Select From List By Value    css:select.form-control        teach
	Select Checkbox    terms
	Checkbox Should Be Selected    terms

