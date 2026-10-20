*** Settings ***

Documentation     To validate the Login form
Library           SeleniumLibrary
Library           Collections
Library           String
Test Setup        open the browser with the login url
Test Teardown     Close Browser Session
Resource          resources.robot

*** Test Cases ***
Validate the childwidown page
     [Tags]    SMOKE
    Now click on the child page
    validate the new page title info
    validate the email address
    open the browser with the login url
    Enter the email address from mailoutput





*** Keywords ***
Now click on the child page
    Click Element    xpath:(//a[@class="blinkingText"])[1]
    Sleep     5

validate the new page title info
    Switch Window            NEW 
    ${title}=    Get Text    css:.inner-box
    Element Text Should Be    ${New Message}    DOCUMENTS REQUEST

validate the email address
   ${email}=    Get Text  css:.red
   @{output}=    Split String    ${email}    at
   ${mail}=   Get From List    ${output}    1
   log     ${mail}
   ${finalmail}=    Split String    ${email}
   ${finalmail_new}=    Get From List    ${finalmail}    0
    Set Global Variable     ${finalmail_new}

   
    
Enter the email address from mailoutput
      Switch Window            MAIN
      Get Title
      Input Text        id:username      ${finalmail_new}
    





