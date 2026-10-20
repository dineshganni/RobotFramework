*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections

*** Variables ***
@{productlist}    iphone X    Samsung Note 8    Nokia Edge
${cardproduct}    css:.media



*** Keywords ***
Verify the product in the list and checkout
    @{expected_product}=    Create List    @{productlist}
    ${cardproductelements}=    Get WebElements    ${cardproduct}
    @{Actual_product}=    Create List

    FOR    ${elements}    IN    @{cardproductelements}
           #${title}=    Get Text    ${elements} >> xpath:.//h4[@class="media-heading"]
           ${title}=    Get Text    ${elements.find_element("xpath", ".//h4[@class='media-heading']")}
        Append To List    ${Actual_product}    ${title}
    END
    Lists Should Be Equal    ${expected_product}    ${Actual_product}
    Click Element    css:.btn.btn-success
