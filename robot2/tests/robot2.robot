*** Settings ***
Library    RequestsLibrary
Resource   ../resources/keywords.robot
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    Chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

#Selectors
${SEL_USERNAME}    id=user-name
${SEL_PASSWORD}    id=password
${SEL_LOGIN_BUTTON}    id=login-button
${SEL_INVENTORY_CONTAINER}    id=inventory_container    
${SEL_TITLE}    css=.title
${SEL_BURGER_MENU}    id=react-burger-menu-btn
${SEL_LOGOUT_BUTTON}    id=logout_sidebar_link
${SEL_ERROR_MESSAGE}    css=.error-message-container 

*** Test Cases ***
Login and Logout
    [Tags]    Smoke    Positive    Critical
    Open Chrome Incognito
    Input Text    ${SEL_USERNAME}    ${USERNAME}
    Input Text    ${SEL_PASSWORD}    ${PASSWORD}
    Click Button    ${SEL_LOGIN_BUTTON}
    Wait Until Element Is Visible    ${SEL_INVENTORY_CONTAINER}
    Click Element    ${SEL_BURGER_MENU}
    Sleep    2s
    Click Element    ${SEL_LOGOUT_BUTTON}
    Sleep    5s
    Close Browser