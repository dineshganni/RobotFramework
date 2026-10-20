*** Settings ***

Documentation    To validate the Login form
Library    SeleniumLibrary


*** Variables ***
${Error Message}   css:.alert-danger
${username_w}      rahulshettyacademyc
${username}        rahulshettyacademy
${password}        Learning@830$3mK2
${check out}       css:.nav-link
${cardtitles}       css:.card-title
${New Message}      css:.inner-box
${browser_name}     chrome

*** Variables ***
${URL}     https://rahulshettyacademy.com/loginpagePractise/
${PREFS}    {'credentials_enable_service': False, 'profile.password_manager_enabled': False, 'profile.password_manager_leak_detection': False}


*** Keywords ***
open the browser with the login url
    Open Browser    ${URL}    ${browser_name}
    ...    options=add_experimental_option("prefs", ${PREFS});add_argument("--disable-features=PasswordLeakDetection");add_argument("--incognito")
    Maximize Browser Window


Close Browser Session
    Close Browser