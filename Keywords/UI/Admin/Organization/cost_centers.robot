*** Settings ***

Library                     ExtendedSelenium2Library
Library                     String
Resource                    ../../base.robot

*** Variables ***

${IN_ID} =    id= cost_code
${IN_NAME}=     id = name
${IN_DESCRIPTION}=   id= description


*** Keywords ***

Add Cost Center:
    [Documentation]    Add cost center
    [Arguments]     ${MY_ID}    ${MY_NAME}   ${MY_DESCRIPTION}
    Click on Add button
    input text     ${IN_ID}  ${MY_ID}
    input text     ${IN_NAME}  ${MY_NAME}
    input text     ${IN_DESCRIPTION}   ${MY_DESCRIPTION}
    Modal Save

