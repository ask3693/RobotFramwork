*** Settings ***

Documentation    To validate the shopping page
Library          SeleniumLibrary
Library          Collections
Library          ../cutomLibraries/Shop.py
Test Setup       Open The Browser With This URL
#Test Teardown    Close Browser
Resource         Generic.robot
Resource         ../PageObjects/LandingPage.robot
Resource         ../PageObjects/ShopPage.robot
Resource         ../PageObjects/CheckoutPage.robot


*** Variables ***
${Login_Error_Message}         css:.alert-danger       #Global
#${shop_page_load_check}         css:.nav-link           #Global     #Moved to page file
@{listofProducts}               Blackberry      Nokia Edge

*** Test Cases ***
Unsuccessful login validation
	[Tags]    Regression    Smoke
    LandingPage.Fill the login form         ${UserName}     ${pwd_wrong}
    LandingPage.Wait until Element is located on the page
    LandingPage.Validate the error message

Validate cards displayed in the shopping page
	[Tags]    Feature1
	LandingPage.Fill The Login Form         ${UserName}     ${pwd_valid}
	Generic.Wait until Element is located on the page
    ShopPage.Verify card titles in the shop page
   # Select the card     Blackberry
    Hello World
    Add Items To Cart And Checkout      ${listofProducts}
    Verify Items in the cart and proceed    ${listofProducts}

Select the form and navigate to child window
	[Tags]    Regression
	LandingPage.Fill the login details with user option     rahulshettyacademy      learning



