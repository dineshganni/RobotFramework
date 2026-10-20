*** Settings ***
Library           Collections
Library           RequestsLibrary
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${base_url}=    http://216.10.245.166
${PREFS}    {'credentials_enable_service': False, 'profile.password_manager_enabled': False, 'profile.password_manager_leak_detection': False}
${book_name}    RobotFramework  
${book_deleted}    book is successfully deleted

*** Test Cases ***
Perfome API Request with RestAPI
    &{data}=    Create Dictionary    name=Dinesh    course=robot    website=rahulshettyacadamy.com
    log    ${data}
    Dictionary Should Contain Key    ${data}    name 
    log   ${data}[course]
    ${url}=    Get From Dictionary    ${data}    website
    Log    ${url}
    
Add Book into Library Database
     [Tags]       API
     &{req_body}=    Create Dictionary    name=${book_name}    isbn=987765    aisle=324566    author=Dinesh
     ${response}=    POST    ${base_url}/Library/Addbook.php    json=${req_body}    expected_status=200
     Log    ${response.json()}
     Dictionary Should Contain Key    ${response.json()}    ID
     ${book_id}=    Get From Dictionary    ${response.json()}    ID
     Set Global Variable     ${book_id}
     log      ${book_id}
     Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
     Status Should Be    200    ${response}
  

Get Book Details Which Got Added
    [Tags]       API
    ${get_response}=    GET    ${base_url}/Library/GetBook.php    params=ID=${book_id}    expected_status=200
    Log    ${get_response.json()}
    Should Be Equal As Strings    ${book_name}    ${get_response.json()}[0][book_name]
    

Delete Book From Database
    [Tags]       API
    &{delete_requests}=    Create Dictionary    ID=${book_id}
    ${delete_response}=    POST    ${base_url}/Library/DeleteBook.php    json=${delete_requests}    expected_status=200
    Log    ${delete_response.json()}
    Should Be Equal As Strings    ${book_deleted}    ${delete_response.json()}[msg]

    

    




    
     
     
     
     
     
     
     
     
     
     
     
     
     
             


