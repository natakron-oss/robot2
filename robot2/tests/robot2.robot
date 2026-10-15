*** Settings ***
Resource          ../resources/keywords.robot
Test Teardown     Close All Browsers


*** Test Cases ***
Login and Logout
    [Tags]    Smoke    Positive    Critical
    Open Chrome Incognito
    Login With Valid User
    Logout From Application
