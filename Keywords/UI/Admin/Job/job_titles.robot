*** Settings ***

Library                     ExtendedSelenium2Library
Library                     OperatingSystem

Resource                    ../../base.robot

*** Variables ***
${IN_JOB_TITLE}     id=jobTitleName
${IN_DESCRIPTION}   id=jobDescription
${IN_FILE}          id=jobSpecification
${IN_NOTE}          id=note

*** Keywords ***
Add Job Title:
    [Documentation]         Add new Job Title.
    [Arguments]             ${JOB_TITLE}    ${DESCRIPTION}    ${FILE}    ${NOTE}
    Click on Add button
    input text              ${IN_JOB_TITLE}     ${JOB_TITLE}
    input text              ${IN_DESCRIPTION}   ${DESCRIPTION}
    should exist            ${FILE}
    ${FILE}                 normalize path      ${FILE}
    choose file             ${IN_FILE}          ${FILE}
    input text              ${IN_NOTE}          ${NOTE}
    Modal Save
