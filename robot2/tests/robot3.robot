*** Settings ***
Resource          ../resources/keywords.robot
Test Teardown     Close All Browsers


*** Test Cases ***
Add cart and checkout
    [Tags]    Smoke    Positive    Critical
    Open Chrome Incognito
    Login With Valid User
    Add Two Items To Cart
    Click Element    ${SEL_SHOPPING_CART_LINK}
    Click Button     ${SEL_CHECKOUT_BUTTON}
    Fill Checkout Information
    Click Button     ${SEL_FINISH_BUTTON}
    Wait Until Element Is Visible    ${SEL_COMPLETE_CONTAINER}    timeout=10s
    Element Text Should Be    ${SEL_COMPLETE_HEADER}    Thank you for your order!
    Click Button     ${SEL_BACK_TO_PRODUCTS_BUTTON}
    Wait Until Element Is Visible    ${SEL_INVENTORY_CONTAINER}    timeout=10s
