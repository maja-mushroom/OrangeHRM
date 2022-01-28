*** Settings ***

Library                     ExtendedSelenium2Library

Resource                    ../../base.robot
Resource                    ../../adminmenu.robot

*** Variables ***
${IN_NAME}                 id=name

*** Keywords ***
Login and navigate to Languages
    Login:
    Navigate to Languages

Add Languages:
    [Documentation]         Add new language.
    [Arguments]             ${NAME}
    Click on Add button
    input text              ${IN_NAME}         ${NAME}
    Modal Save
