*** Settings ***

Resource            ../../../../Keywords/UI/Admin/UserManagement/users.robot
Force Tags          Users

Suite Setup                      Open Browser to login page
Suite Teardown                   Close browser

*** Test Cases ***

Add new user - mandatory fields
    [Tags]                       AddNewUser
    [Documentation]              Adds new user with mandatory fields
    [Setup]                      Login and navigate to Users
    ${USERNAME}                  generate random string
    Add user - only mandatory fields:     ${MY_EMPLOYEE}  ${USERNAME}   ${MY_PASSWORD}
    ${MSG}                       Get toast message
    should be equal              ${MSG}     Successfully Saved
    [Teardown]                   Logout

Add new user - all fields
    [Tags]                        AddNewUser
    [Documentation]               Adds new user with all fields
    [Setup]                       Login and navigate to Users
    ${USERNAME}                   generate random string
    Add user - all fields:        ${MY_EMPLOYEE}  ${USERNAME}  ${MY_ESS_ROLE}  ${MY_PASSWORD}  ${MY_ESS_ROLE}  ${MY_SUPERVISOR_ROLE}  ${MY_ADMIN_ROLE}  ${MY_STATUS}
    ${MSG}                        Get toast message
    should be equal               ${MSG}     Successfully Saved
    [Teardown]                    Logout

Edit user's username
    [Tags]                        EditNewUser
    [Documentation]               Adds new user and edits his/hers username
    [Setup]                       Login and navigate to Users
    ${USERNAME}                   generate random string
    Add user - all fields:        ${MY_EMPLOYEE}  ${USERNAME}  ${MY_ESS_ROLE}  ${MY_PASSWORD}  ${MY_ESS_ROLE}  ${MY_SUPERVISOR_ROLE}  ${MY_ADMIN_ROLE}  ${MY_STATUS}
    ${MSG}                        Get toast message
    should be equal               ${MSG}     Successfully Saved
    Edit user
    ${USERNAME}                   generate random string
    Input new username:           ${USERNAME}
    Verify message in the field:  ${TC_SUCCESS_SAVED}    Successfully Updated
    [Teardown]                    Logout

Search by username
    [Tags]                        FilterS
    [Documentation]               Searching username by filter
    [Setup]                       Login and navigate to Users
    Filter by username:           ${USERNAME_FILTER}
    [Teardown]                    Logout

Verification of flouting message Filter
    [Tags]                        Filtermsg
    [Documentation]               Verifies Filter Popup
    [Setup]                       Login and navigate to Users
    mouse over                    ${LNK_FILTER}
    element should be visible     ${MSG_FILTER}
    [Teardown]                    Logout

Verification of flouting message Add User
    [Tags]                       AddUser
    [Documentation]              Verifies Add User Popup
    [Setup]                      Login and navigate to Users
    mouse over                   ${BTN_ADD_USER}
    element should be visible    ${MSG_ADD_USER}
    [Teardown]                   Logout


Verify reqired fields for User
    [Tags]                        Verifyreqmesg
    [Documentation]               Verifies required messages for Adding new user
    [Setup]                       Login and navigate to Users
    click element                 ${BTN_ADD_USER}
    click element                 ${BTN_SAVE}
    ${HELP-TEXT}    Get help block text:    Employee Name
    should be equal  ${HELP-TEXT}   Required
    ${HELP-TEXT}    Get help block text:    Username
    should be equal  ${HELP-TEXT}   Required
    ${HELP-TEXT}    Get help block text:    Password
    should be equal  ${HELP-TEXT}   Required
    ${HELP-TEXT}    Get help block text:    Confirm Password
    should be equal  ${HELP-TEXT}   Required
    click element                 ${BTN_CANCEL}
    [Teardown]                    Logout

Verify Add User label
    [Tags]                        Verifylbl
    [Documentation]               Verifies label Add User
    [Setup]                       Login and navigate to Users
    click element                 ${BTN_ADD_USER}
    ${TITLE}                      Get modal title
    should be equal               ${TITLE}         Add User
    click element                 ${BTN_CANCEL}
    [Teardown]                    Logout