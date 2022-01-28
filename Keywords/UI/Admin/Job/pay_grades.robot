*** Settings ***

Library                     ExtendedSelenium2Library

Resource                    ../../base.robot


*** Variables ***
${IN_PAY_GRADE}             id=name
${BTN_CURRENCY}             xpath=//button[text()='Assign currency']
${IN_CURRENCY}              id=currency_id_inputfileddiv
${MY_CURRENCY_VALUE}        ALL - Albanian lek
${IN_MIN_SALARY}            id=minSalary
${IN_MAX_SALARY}            id=maxSalary



*** Keywords ***

Add Pay Grade:
    [Documentation]         Add new pay grade.
    [Arguments]             ${PAY_GRADE}
    Click on Add button
    input text              ${IN_PAY_GRADE}          ${PAY_GRADE}
    Modal Save

Edit Pay Grade:
    [Arguments]         ${NEW_PAY_GRADE}    ${CURRENCY_VALUE}   ${MIN_SALARY}    ${MAX_SALARY}
    click element       ${BTN_CURRENCY}
    clear element text  ${IN_PAY_GRADE}
    input text          ${IN_PAY_GRADE}       ${NEW_PAY_GRADE}
    click element       ${IN_CURRENCY}
    click element       //div[@id='currency_id_inputfileddiv']//ul/li/span[text()="${MY_CURRENCY_VALUE} "]
    input text          ${IN_MIN_SALARY}      ${MIN_SALARY}
    input text          ${IN_MAX_SALARY}      ${MAX_SALARY}
    Modal Save