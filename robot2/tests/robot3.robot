*** Settings ***
Library    RequestsLibrary
Resource   ../resources/keywords.robot
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    Chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
${FIRST_NAME}    Suwanchai
${LAST_NAME}    Chaisuwansri
${POSTAL_CODE}    84280

#Selectors
${SEL_USERNAME}    id=user-name
${SEL_PASSWORD}    id=password
${SEL_LOGIN_BUTTON}    id=login-button
${SEL_INVENTORY_CONTAINER}    id=inventory_container    
${SEL_TITLE}    css=.title
${SEL_BURGER_MENU}    id=react-burger-menu-btn
${SEL_LOGOUT_BUTTON}    id=logout_sidebar_link
${SEL_ERROR_MESSAGE}    css=.error-message-container
${SEL_ADD_CART_BACKPACK}    id=add-to-cart-sauce-labs-backpack
${SEL_ADD_CART_BIKE_LIGHT}    id=add-to-cart-sauce-labs-bike-light
${SEL_SHOPPING_CART_LINK}    css=[data-test="shopping-cart-link"]
${SEL_CHECKOUT_BUTTON}    id=checkout
${SEL_FIRST_NAME}    id=first-name
${SEL_LAST_NAME}    id=last-name
${SEL_POSTAL_CODE}    id=postal-code
${SEL_CONTINUE_BUTTON}    id=continue
${SEL_FINISH_BUTTON}    id=finish
${SEL_COMPLETE_CONTAINER}    id=checkout_complete_container
${SEL_BACK_TO_PRODUCTS_BUTTON}    id=back-to-products

*** Test Cases ***
Add cart and checkout
    [Tags]    Smoke    Positive    Critical
    Open Chrome Incognito
    Input Text    ${SEL_USERNAME}    ${USERNAME}
    Input Text    ${SEL_PASSWORD}    ${PASSWORD}
    Click Button    ${SEL_LOGIN_BUTTON}
    Wait Until Element Is Visible    ${SEL_INVENTORY_CONTAINER}
    Click Element    ${SEL_ADD_CART_BACKPACK}
    Click Element    ${SEL_ADD_CART_BIKE_LIGHT}
    Click Element    ${SEL_SHOPPING_CART_LINK}
    Click Button    ${SEL_CHECKOUT_BUTTON}
    Input Text    ${SEL_FIRST_NAME}    ${FIRST_NAME}
    Input Text    ${SEL_LAST_NAME}    ${LAST_NAME}
    Input Text    ${SEL_POSTAL_CODE}    ${POSTAL_CODE}
    Click Element    ${SEL_CONTINUE_BUTTON}
    Click Button    ${SEL_FINISH_BUTTON}
    Wait Until Element Is Visible    ${SEL_COMPLETE_CONTAINER}
    Element Should Be Visible    ${SEL_COMPLETE_CONTAINER}
    Click Button    ${SEL_BACK_TO_PRODUCTS_BUTTON}
    Close Browser