*** Settings ***
Library    Collections
Library     RequestsLibrary

*** Variables ***
${base_url}=    https://rahulshettyacademy.com
${book_id}

*** Test Cases ***
Play around with dictionary
	[Tags]      API
	&{data}=     Create Dictionary    name=Ali   course=robot    website=rahulshettyacademy.com
	log     ${data}
    Dictionary Should Contain Key       ${data}     name
    log     ${data}[name]
    ${URL}=     Get From Dictionary    ${data}  website

Add book into library
	[Tags]      API
	&{data2}=   Create Dictionary       name=RobotFramework     isbn=921371     aisle=120012        author=AliSharjeel
	${response}=    POST        ${base_url}/Library/Addbook.php     json=${data2}       expected_status=200
	Log         ${response.json()}
	Dictionary Should Contain Key    ${response.json()}     ID
	${book_id}=     Get From Dictionary    ${response.json()}     ID
	Set Global Variable    ${book_id}
	log     ${book_id}
	Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
	Status Should Be    200     ${response}

Get the book details added
    ${get_response}=    GET    ${base_url}/Library/Getbook.php  params=ID=${book_id}
    log     ${get_response.json()}

Delete the book from database
	&{delete_dict}=     Create Dictionary    ID=${book_id}
    ${del_response}=    POST        ${base_url}/Library/Deletebook.php    json=&{delete_dict}       expected_status=200
    log     ${del_response.json()}
