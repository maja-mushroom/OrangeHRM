*** Settings ***

Library                     ExtendedSelenium2Library

Resource                    ../../base.robot
Resource                    ../../adminmenu.robot

*** Variables ***

${IN_EMPLOYMENT_STATUS}             id=name

*** Keywords ***
Login and navigate to Employment Status
    Login:
    Navigate to Employment Status

Add Pay Grade:
    [Documentation]         Add employment status.
    [Arguments]             ${EMPLOYMENT_STATUS}
    Click on Add button
    input text               ${IN_EMPLOYMENT_STATUS}     ${EMPLOYMENT_STATUS}
    Modal Save