*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                          https://www.saucedemo.com/
${HEADLESS}                     ${FALSE}
${USERNAME}                     standard_user
${PASSWORD}                     secret_sauce
${FIRST_NAME}                   Suwanchai
${LAST_NAME}                    Chaisuwansri
${POSTAL_CODE}                  84280

# Selectors
${SEL_USERNAME}                 id=user-name
${SEL_PASSWORD}                 id=password
${SEL_LOGIN_BUTTON}             id=login-button
${SEL_INVENTORY_CONTAINER}      id=inventory_container
${SEL_TITLE}                    css=.title
${SEL_BURGER_MENU}              id=react-burger-menu-btn
${SEL_LOGOUT_BUTTON}            id=logout_sidebar_link
${SEL_ERROR_MESSAGE}            css=.error-message-container
${SEL_ADD_CART_BACKPACK}        id=add-to-cart-sauce-labs-backpack
${SEL_ADD_CART_BIKE_LIGHT}      id=add-to-cart-sauce-labs-bike-light
${SEL_SHOPPING_CART_LINK}       css=[data-test="shopping-cart-link"]
${SEL_CHECKOUT_BUTTON}          id=checkout
${SEL_FIRST_NAME}               id=first-name
${SEL_LAST_NAME}                id=last-name
${SEL_POSTAL_CODE}              id=postal-code
${SEL_CONTINUE_BUTTON}          id=continue
${SEL_FINISH_BUTTON}            id=finish
${SEL_COMPLETE_CONTAINER}       id=checkout_complete_container
${SEL_COMPLETE_HEADER}          css=.complete-header
${SEL_BACK_TO_PRODUCTS_BUTTON}  id=back-to-products


*** Keywords ***
Open Chrome Incognito
    ${options} =    Evaluate    selenium.webdriver.ChromeOptions()    modules=selenium.webdriver
    Call Method    ${options}    add_argument    --incognito
    Call Method    ${options}    add_argument    --start-maximized
    IF    ${HEADLESS}
        Call Method    ${options}    add_argument    --headless=new
        Call Method    ${options}    add_argument    --window-size\=1920,1080
    END
    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}

Login With Valid User
    Input Text      ${SEL_USERNAME}    ${USERNAME}
    Input Password  ${SEL_PASSWORD}    ${PASSWORD}
    Click Button    ${SEL_LOGIN_BUTTON}
    Wait Until Element Is Visible    ${SEL_INVENTORY_CONTAINER}    timeout=10s
    Element Text Should Be    ${SEL_TITLE}    Products

Logout From Application
    Click Element    ${SEL_BURGER_MENU}
    Wait Until Element Is Visible    ${SEL_LOGOUT_BUTTON}    timeout=10s
    Click Element    ${SEL_LOGOUT_BUTTON}
    Wait Until Element Is Visible    ${SEL_LOGIN_BUTTON}    timeout=10s
    Location Should Be    ${URL}

Add Two Items To Cart
    Click Element    ${SEL_ADD_CART_BACKPACK}
    Click Element    ${SEL_ADD_CART_BIKE_LIGHT}
    Element Text Should Be    css=.shopping_cart_badge    2

Fill Checkout Information
    Input Text    ${SEL_FIRST_NAME}     ${FIRST_NAME}
    Input Text    ${SEL_LAST_NAME}      ${LAST_NAME}
    Input Text    ${SEL_POSTAL_CODE}    ${POSTAL_CODE}
    Click Element    ${SEL_CONTINUE_BUTTON}
