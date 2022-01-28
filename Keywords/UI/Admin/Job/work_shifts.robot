*** Settings ***

Library                     ExtendedSelenium2Library

Resource                    ../../base.robot

*** Variables ***
${IN_WORK_SHIFT}           id=name
${IN_FROM}                 id=start_time
${IN_TO}                   id=end_time

*** Keywords ***

Add Work Shift:
    [Documentation]         Add new work shift.
    [Arguments]             ${WORK_SHIFT}             ${FROM}              ${TO}
    Click on Add button
    input text              ${IN_WORK_SHIFT}          ${WORK_SHIFT}
    input text              ${IN_FROM}                ${FROM}
    input text              ${IN_TO}                  ${TO}
    Modal Save