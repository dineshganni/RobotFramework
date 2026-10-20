*** Settings ***

Documentation    To validate the Login form
Library    SeleniumLibrary
Resource          Pageobject/Generic.robot


*** Keywords ***

Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text        id:username      ${username}
    Input Password    id:password      ${password}
    Click Button      signInBtn

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

wait until it locator is visible
    Wait Until Element Is Visible    ${Error Message}


