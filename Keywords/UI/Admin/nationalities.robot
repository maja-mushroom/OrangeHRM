*** Settings ***
Library             ExtendedSelenium2Library
Resource            ../base.robot
Resource            ../adminmenu.robot


*** Variables ***
${IN_NAME}=         id=name

*** Keywords ***

Add Nationality:
    [Documentation]         Add new nationality.
    [Arguments]             ${NAME}
    Click on Add button
    input text              ${IN_NAME}             ${NAME}
    Modal Save

Edit Nationality:
    [Documentation]     Add employment status.
    [Arguments]         ${NATIONALITY_INP}
    clear element text  ${IN_NAME}
    input text          ${IN_NAME}     ${NATIONALITY_INP}
    Modal Save
