*** Settings ***

Documentation    To validate the Login form
Library    SeleniumLibrary



*** Variables ***
${Error Message}   css:.alert-danger
${password}        Learning@830$3mK2
${check out}       css:.nav-link
${cardtitles}       css:.card-title
${New Message}      css:.inner-box



*** Keywords ***

wait until it locator is visible
    Wait Until Element Is Visible   ${check out}


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




