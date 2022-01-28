*** Settings ***


Resource                           ../../../../Keywords/UI/Admin/UserManagement/userroles.robot
Force Tags                         userrole

Suite Setup                        Open Browser to login page
Suite Teardown                     Close browser

*** Variables ***

*** Test Cases ***
Verification of flouting message Add User Role
    [Tags]                          AddUser
    [Documentation]                 Verifies Add User Role Popup
    [Setup]                         Login and navigate to User Roles
    mouse over                      ${BTN_ADD_USER}
    element should be visible       ${MSG_ADD_USER_ROLES}
    [Teardown]                      Logout

Verify reqired fields for User Role
    [Tags]                          Verifyreqmsg
    [Documentation]                 Verifies reyuired messages for Adding new user
    [Setup]                         Login and navigate to User Roles
    click element                   ${BTN_ADD_USER}
    click link                      ${BTN_SAVE}
    verify required msg for field:  ${MSG_REQUIRED_URN}
    click link                      ${BTN_CANCEL}
    Logout
