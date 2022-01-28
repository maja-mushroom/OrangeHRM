*** Settings ***

Library                     ExtendedSelenium2Library

Resource                    ../../base.robot
Resource                    ../../adminmenu.robot

*** Variables ***

*** Keywords ***
Login and navigate to Skills
    Login:
    Navigate to Skills

Add Skills:
    [Documentation]         Add new skill.
    [Arguments]             ${NAME}                ${DESCRIPTION}=
    Click on Add button
    input text              ${IN_NAME}             ${NAME}
    input text              ${IN_DESCRIPTION}      ${DESCRIPTION}
    Modal Save

Edit Skill:
    [Arguments]            ${NEW_NAME}    ${NEW_DESCRIPTION}
    clear element text     ${IN_NAME}
    input text             ${IN_NAME}     ${NEW_NAME}
    input text             ${IN_DESCRIPTION}       ${NEW_DESCRIPTION}
    Modal Save



