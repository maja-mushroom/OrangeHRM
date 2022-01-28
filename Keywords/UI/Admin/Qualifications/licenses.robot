*** Settings ***

Library                     ExtendedSelenium2Library

Resource                    ../../base.robot
Resource                    ../../adminmenu.robot

*** Variables ***
${TXT_NAME}                 id=name

*** Keywords ***
Login and navigate to Licenses
    Login:
    Navigate to Licenses

Add Licenses:
    [Documentation]         Add new licenses.
    [Arguments]             ${NAME}
    Click on Add button
    input text              ${IN_NAME}         ${NAME}
    Modal Save


