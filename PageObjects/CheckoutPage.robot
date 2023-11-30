*** Settings ***
Documentation    This file contains all objects & keywords of the shop page
Library          SeleniumLibrary
Library          Collections

*** Keywords ***
Verify Items in the cart and proceed
    [Arguments]    ${listofProducts}
    ${actual_cart_list} =    Get Webelements    //div[@class='media-body']//h4/a
    ${actual_product_names} =    Create List
    FOR    ${element}    IN    @{actual_cart_list}
        ${text} =    Get Text    ${element}
        Append To List    ${actual_product_names}    ${text}
    END
    FOR    ${name}    IN    @{listofProducts}
        Run Keyword If    '${name}' not in @{actual_product_names}    Fail    Product name '${name}' not found in actual names.
    END