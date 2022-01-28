*** Settings ***

Library                     ExtendedSelenium2Library

Resource                    ../../base.robot
Resource                    ../../adminmenu.robot

*** Variables ***
${IN_NAME}                 id=name

*** Keywords ***
Login and navigate to Membership
    Login:
    Navigate to Memberships

Add Membership:
    [Documentation]         Add new membership.
    [Arguments]             ${NAME}
    Click on Add button
    input text              ${IN_NAME}         ${NAME}
    Modal Save