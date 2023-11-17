*** Settings ***
Documentation    A file with reusable keywords and variables
Library          SeleniumLibrary
Library          OperatingSystem

*** Variables ***
${UserName}         rahulshettyacademy
${pwd_wrong}        12345678
${pwd_valid}        learning
${URL}              https://rahulshettyacademy.com/loginpagePractise/
${Login_Error_Message}      css:.alert-danger       #Global Variable
${shop_page_load_check}         css:.nav-link

*** Keywords ***
Open The Browser With This URL
    Create Webdriver    Chrome
    Go To               ${URL}

Wait until Element is located on the page
	Wait Until Element Is Visible       ${shop_page_load_check}
