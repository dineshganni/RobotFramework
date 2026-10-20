*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections

*** Variables ***
@{productlist}    iphone X    Samsung Note 8    Nokia Edge
${cardproduct}    css:.media
${country}        India


*** Keywords ***
Verify the product in the list and checkout
       Input Text        id:country      ${country}
       Sleep             5
       Click Element     xpath://a[text()='${country}']
       Click Element     xpath://label[@for='checkbox2']
       Click Element    css:.btn.btn-success.btn-lg
       Page Should Contain    Success!



