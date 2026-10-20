*** Settings ***

Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser

#Resources
#Selenium

*** Variables ***
${Error Message}    css:.alert-danger      

*** Test Cases ***
Validate UnSuccesful Login
      [Tags]    SMOKE    REGRESSION
    open the browser with the login url
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct



*** Keywords ***
open the browser with the login url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text        id:username      rahulshettyacademyc
    Input Password    id:password      Learning@830$3mK2
    Click Button      signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error Message}
    
verify error message is correct

    Element Text Should Be    ${Error Message}    Incorrect username/password.
    
