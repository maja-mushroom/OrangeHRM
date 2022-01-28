
*** Settings ***

Resource    ../../Keywords/UI/login.robot
Force Tags  login

Suite Setup     Open Browser to login page
Suite Teardown  Close browser
*** Variables ***

*** Test Cases ***

Login by default
    [Tags]              Defaout login
    [Documentation]     Verifies that can be login by default
    Login:
    Verify login
    Logout
    [Teardown]  close browser

Login as System Administrator
    [Tags]              System Admin
    [Documentation]     Verifies that System Admin can login successfully.
    Open Browser and login as System Administrator
    Verify login
    Logout
    [Teardown]  close browser

Login as Administrator
    [Tags]               Admin
    [Documentation]      Verifies that Admin can login successfully.
    Open Browser and login as Administrator
    Verify login
    Logout
    [Teardown]  close browser

Login as ESS User
    [Tags]               ESS User
    [Documentation]      Verifies that ESS User can login successufully.
    Open Browser and login as ESS User
    Verify login
    Logout
    [Teardown]  close browser

Login as 1st Level Supervisor
    [Tags]               1st Level Supervisor
    [Documentation]      Verifies that 1st Level Supervisor can login successufully.
    Open Browser and login as 1st level supervisor
    Verify login
    Logout
    [Teardown]  close browser

Login with wrong credentials and verify the message
    [Tags]               Wrong credentials
    [Documentation]      Login with wrong credentials and verify the message
    [Setup]  Open Browser to login page
    Login:  ${WRONG_USERNAME}     ${WRONG_PASSWORD}
    ${ERROR}=   Get toast message
    should be equal     ${ERROR}    Invalid Credentials
    [Teardown]  close browser

Login with wrong credentials multiple times and verify the message
     [Documentation]     Login with wrong credentials multiple times and verify the message
     [Setup]  Open Browser to login page
     Login:  ${WRONG_USERNAME}     ${WRONG_PASSWORD}
     ${ERROR}=   Get toast message
     should be equal     ${ERROR}    Please solve the problem to proceed.
