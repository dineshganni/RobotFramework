*** Settings ***

Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser
Test Template    Validate UnSuccesful Login

#Resources
#Selenium

*** Variables ***
${Error Message}    css:.alert-danger

*** Test Cases ***    username      InputPassword
Invalidusername         asdfghj     ertyui4567
      [Tags]    REGRESSION
Invaliduserpassword     asdfghj     Testing@123
      [Tags]    NEWFEATURE
Spclchar                h#$%^&%     ertyui4sdg
          



*** Keywords ***
Validate UnSuccesful Login
    [Arguments]    ${username}    ${InputPassword}
    open the browser with the login url
    Fill the login Form    ${username}    ${InputPassword}
    wait until it checks and display error message
    verify error message is correct
    
open the browser with the login url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    [Arguments]       ${username}      ${InputPassword}
    Input Text        id:username       ${username}
    Input Password    id:password      ${InputPassword}
    Click Button      signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error Message}

verify error message is correct

    Element Text Should Be    ${Error Message}    Incorrect username/password.

