*** Settings ***

Documentation     To validate the Login form
Library           SeleniumLibrary    
Library           Collections
Test Setup        open the browser with the login url
Test Teardown     Close Browser Session
Resource          resources.robot



*** Test Cases ***
#Validate UnSuccesful Login
 #   Fill the login Form    ${username_w}    ${password}
  #  wait until it locator is visible    ${Error Message}
   # verify error message is correct

Validate checkout page
        [Tags]    REGRESSION
    Fill the login Form    ${username}    ${password}
    wait until it locator is visible    ${check out}
    verify card title in the cart page
    Select the item with the name of    Nokia Edge

Validate the poppage
    Fill the login form with    ${username}    ${password}
    Select the user option
    Now click on ok popup


*** Keywords ***

Fill the login Form 
    [Arguments]    ${username}    ${password}
    Input Text        id:username      ${username}
    Input Password    id:password      ${password}
    Click Button      signInBtn

wait until it locator is visible
    [Arguments]    @{element}
    Wait Until Element Is Visible    @{element}


verify error message is correct
    Element Text Should Be    ${Error Message}    Incorrect username/password.
    
verify card title in the cart page
    @{expected_title} =    Create List    iphone X    Samsung Note 8        Nokia Edge    Blackberry
    ${cardtitleelements} =    Get WebElements    ${cardtitles}
    @{Actual_elemtns} =    Create List
       
    FOR  ${elements}    IN    @{cardtitleelements}

        Log      ${elements.text}
        Append To List   ${Actual_elemtns}    ${elements.text}
        
    END
    Lists Should Be Equal       ${expected_title}    ${Actual_elemtns}

Select the item with the name of 
    
     [Arguments]    ${itemname}
     ${cardtitleelements} =    Get WebElements    ${cardtitles}
     ${index_val} =    Set Variable    1
         FOR  ${elements}    IN    @{cardtitleelements}
              Exit For Loop If    '${itemname}' == '${elements.text}'
              ${index_val}=    Evaluate       ${index_val} + 1
         END
         Click Button    xpath:(//button[@class="btn btn-info"])[${index_val}]

Fill the login form with
     [Arguments]    ${username}    ${password}
     Input Text        id:username      ${username}
     Input Password    id:password      ${password}


Select the user option
     Click Button    css:input[value="user"]
     Wait Until Element Is Visible    okayBtn
     Sleep    5
     
Now click on ok popup
     Click Element    okayBtn
     Select From List By Value    css:select[class="form-control"]    consult
     Select Checkbox    id:terms
     Checkbox Should Be Selected    id:terms






    
    
