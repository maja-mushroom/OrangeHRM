*** Settings ***

Library                     ExtendedSelenium2Library

Resource                    ../../base.robot
Resource                    ../../adminmenu.robot

*** Variables ***
${IN_LEVEL_EDUCATION}      id=name

*** Keywords ***
Login and navigate to Education
    Login:
    Navigate to Education

Add Education:
    [Documentation]         Add new education.
    [Arguments]             ${EDUCATION}
    Click on Add button
    input text              ${IN_LEVEL_EDUCATION}          ${EDUCATION}
    Modal Save
