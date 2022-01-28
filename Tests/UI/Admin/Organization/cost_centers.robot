
*** Settings ***
Library                     ExtendedSelenium2Library
Resource                    ../../../../Keywords/UI/Admin/Organization/cost_centers.robot
Resource                    ../../../../Keywords/UI/adminmenu.robot
Resource                    ../../../../Keywords/UI/Helpers/table.robot

Force Tags                  CostCenter
Suite Setup                 Open Browser to login page
Suite Teardown              Close browser




*** Variables ***




*** Test Cases ***

Add Cost Center - all fields
    [Tags]                  AddCostCenter
    [Documentation]         Login, goes to Cost Centers page and adds new cost center.
    [Setup]  run keywords   Login:
    ...           AND       Navigate to Cost Centers
    ${MY_ID}                generate random string   4    [NUMBERS]
    ${MY_NAME}              generate random string
    ${MY_DESCRIPTION}       generate random string
    Add Cost Center:        ${MY_ID}    ${MY_NAME}   ${MY_DESCRIPTION}
    ${MSG}                  Get toast message
    should be equal         ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    Is item in the table:   ${MY_NAME}
    [Teardown]              Logout
