*** Settings ***

Library                        ExtendedSelenium2Library
Library                        String
Resource                       ../../base.robot

*** Variables ***
${IN_PARENT} =                  id = employeeCompetency_parent_compName
${IN_NAME_COMPETENCY}=          id = employeeCompetency_name
${IN_DESCRIPTION_COMPETENCY}=   id = employeeCompetency_description
${DD_PARENT}=                   id = employeeCompetency_parent_compName
${CHECKBOX} =                   id = employeeCompetency_markAsGroup
${SAVE_BTN} =                   id = btnSave

*** Keywords ***

Add Competency List:
    [Documentation]       Go to Competency list and add new  Competency List
    [Arguments]           ${MY_NAME}     ${MY_DESCRIPTION}     ${CB}      ${PARENT}=
    select frame          id = noncoreIframe
    Click on Add button
    input text            ${IN_NAME_COMPETENCY}                ${MY_NAME}
    input text            ${IN_DESCRIPTION_COMPETENCY}         ${MY_DESCRIPTION}
    run keyword if       '${CB}'=='True'     select checkbox   ${CHECKBOX}
    ...    ELSE IF       '${CB}'=='False'     input text       ${DD_PARENT}     ${PARENT}
    click element         ${SAVE_BTN}
