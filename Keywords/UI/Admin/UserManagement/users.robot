*** Settings ***

Library                  String
Resource                 ../../base.robot
Resource                 ../../adminmenu.robot

*** Variables ***

${BTN_ADD_USER}          css=.fixed-action-btn
${DD_EMPLOYEE}           id=selectedEmployee_value
${EMPLOYEE_USERNAME}     id=user_name
${DD_ESS_ROLE}           id=essrole_inputfileddiv
${DD_SUPERVISOR_ROLE}    id=supervisorrole_inputfileddiv
${DD_ADMIN_ROLE}         id=adminrole_inputfileddiv
${DD_STATUS}             id=status_inputfileddiv
${EMPLOYEE_PASSWORD}     id=password
${CONFIRM_PASS}          id=confirmpassword
${MY_EMPLOYEE}           John Smith
${MY_PASSWORD}           12345678
${MY_ESS_ROLE}           Default ESS
${MY_SUPERVISOR_ROLE}    Default Supervisor
${MY_ADMIN_ROLE}         Global Admin
${MY_STATUS}             Enabled
${MSG_ADD_USER}          css=.top.fade.tooltip.in
${BTN_SAVE}              id=systemUserSaveBtn
${BTN_CANCEL}            css=a[ng-click="modal.cancel()"]
${LNK_FILTER}            css=.tooltipped.circle > i
${MSG_FILTER}            css=.top.fade.tooltip.in
${USERNAME_FILTER}       id=systemuser_uname_filter
${BTN_SEARCH}            css=a[ng-click="modal.search()"]
${LBL_ADD_USER}          css=#modal1 > h4
${TC_SUCCESS_SAVED}      id=toast-container
${MSG_SUCCESS_SAVED}     Successfully Saved
${EDIT_ICON}             xpath=//tbody//tr[1]//td[8]  #class=edit_item

*** Keywords ***

Login and navigate to Users
    Login:
    Navigate to Users

Filter by username:
    [Arguments]           ${USERNAME_}
    click element         ${LNK_FILTER}
    input text            ${USERNAME_FILTER}    ${USERNAME_}
    click element         ${BTN_SEARCH}

Choose ESS role:
    [Arguments]            ${role_}
    click element          ${DD_ESS_ROLE}
    click element          //*[@id='essrole_inputfileddiv']//span[text()='${role_}']

Choose Supervisor role:
    [Arguments]            ${role_}
    click element          ${DD_SUPERVISOR_ROLE}
    click element          //*[@id='supervisorrole_inputfileddiv']//span[text()='${role_}']

Choose Admin role:
    [Arguments]            ${role_}
    click element          ${DD_ADMIN_ROLE}
    click element          //*[@id='adminrole_inputfileddiv']//span[text()='${role_}']

Choose Status:
    [Arguments]            ${role_}
    click element          ${DD_STATUS}
    click element          //*[@id='status_inputfileddiv']//span[text()='${role_}']

Add user - only mandatory fields:
    [Documentation]          Adds new user with mandatory fields
    [Arguments]              ${EMPLOYEE_}   ${USERNAME_}    ${PASSWORD_}
    wait until element is visible  ${BTN_ADD_USER}
    click element            ${BTN_ADD_USER}
    input text               ${DD_EMPLOYEE}               ${EMPLOYEE_}
    input text               ${EMPLOYEE_USERNAME}         ${USERNAME_}
    input text               ${EMPLOYEE_PASSWORD}         ${PASSWORD_}
    input text               ${CONFIRM_PASS}              ${PASSWORD_}
    click element            ${BTN_SAVE}

Add user - all fields:
    [Documentation]          Adds new user with all fields
    [Arguments]              ${EMPLOYEE_}    ${USERNAME_}    ${MY_ESS_ROLE_}     ${PASSWORD_}    ${MY_ESS_ROLE_}     ${MY_SUPERVISOR_ROLE_}     ${MY_ADMIN_ROLE_}    ${MY_STATUS_}
    wait until element is visible  ${BTN_ADD_USER}
    click element            ${BTN_ADD_USER}
    input text               ${DD_EMPLOYEE}               ${EMPLOYEE_}
    input text               ${EMPLOYEE_USERNAME}         ${USERNAME_}
    Choose ESS role:         ${MY_ESS_ROLE_}
    Choose Supervisor role:  ${MY_SUPERVISOR_ROLE_}
    Choose Admin role:       ${MY_ADMIN_ROLE_}
    Choose Status:           ${MY_STATUS_}
    input text               ${EMPLOYEE_PASSWORD}         ${PASSWORD_}
    input text               ${CONFIRM_PASS}              ${PASSWORD_}
    click element            ${BTN_SAVE}

Edit user
    click element            ${EDIT_ICON}

Input new username:
    [Documentation]          Edits user's username
    [Arguments]              ${NEW_USERNAME_}
    ${TITLE} =               get modal title
    should be equal          ${TITLE}      Edit User
    input text               ${EMPLOYEE_USERNAME}   ${NEW_USERNAME_}
    click element            ${BTN_SAVE}






