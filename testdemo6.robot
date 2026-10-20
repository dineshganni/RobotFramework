*** Settings ***
Documentation     To validate the Login form
Library           SeleniumLibrary
Library           Collections
Library           CustomLibrary/Shop.py
Test Setup        Generic.open the browser with the login url
Test Teardown     Generic.Close Browser Session
Suite Setup
Suite Teardown
Resource          resources.robot
Resource          Pageobject/Cartpage.robot
Resource          Pageobject/Landingpage.robot
Resource          Pageobject/Generic.robot
Resource          Pageobject/checkoutpage.robot
Resource          Pageobject/Confirmationpages.robot



*** Test Cases ***
#Validate UnSuccesful Login
 #   Landingpage.Fill the login Form    ${username_w}    ${password}
  #  Landingpage.wait until it locator is visible
   # Cartpage.verify error message is correct

Validate checkout page
    Landingpage.Fill the login Form    ${username}    ${password}
    Cartpage.wait until it locator is visible
    Cartpage.verify card title in the cart page
    Helloworld
    #Select the item with the name of    Nokia Edge
    Add Items To Cart    ${productlist}
    checkoutpage.verify the product in the list and checkout
    Confirmationpages.Verify the product in the list and checkout

#Validate the poppage
 #   Landingpage.Fill the login form with    ${username}    ${password}
 #   Landingpage.Select the user option
  #  Landingpage.Now click on ok popup












