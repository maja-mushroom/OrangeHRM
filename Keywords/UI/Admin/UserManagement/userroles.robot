*** Settings ***

Resource                    ../../base.robot
Resource                    ../../adminmenu.robot

*** Variables ***
${BTN_ADD_USER}             css=.fixed-action-btn
${MSG_ADD_USER_ROLES}       css=.top.fade.tooltip.in
${BTN_SAVE}                 xpath=//a[text()='Save']
${BTN_CANCEL}               xpath=//*[@id="user_role_form"]/div[7]/a[1]
${MSG_REQUIRED_URN}         xpath=//*[@id="user_role_name_div"]/span[1]


*** Keywords ***
Login and navigate to User Roles
    Login:
    Navigate to User Roles

Verify required msg for field:
    [Documentation]         Verifies required message in field
    [Arguments]             ${feild}
    ${REQ}    get text      ${feild}
    should be equal         ${REQ}          Required
    log                     ${REQ}

