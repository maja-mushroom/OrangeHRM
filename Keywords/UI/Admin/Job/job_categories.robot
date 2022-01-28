*** Settings ***

Library                     ExtendedSelenium2Library

Resource                   ../../base.robot
Resource                   ../../adminmenu.robot

*** Variables ***

*** Keywords ***

Login and navigate to Job categories
    Login:
    Navigate to Job Categories

Add Job Category:
    [Documentation]        Add new job category
    [Arguments]            ${_JOB_CTG_}
    Click on Add button
    input text             ${IN_NAME}     ${_JOB_CTG_}
    Modal save

Edit Job Category:
    [Arguments]         ${NEW_NAME}
    clear element text  ${IN_NAME}
    input text          ${IN_NAME}      ${NEW_NAME}
    Modal Save

