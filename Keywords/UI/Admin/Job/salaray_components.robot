*** Settings ***

Library                      ExtendedSelenium2Library
Library                      OperatingSystem
Library                      BuiltIn
Library                         String
Resource                     ../../base.robot

*** Variables ***

${LNK_TOTAL_PAYABLE}         id=is_part_of_total_payable
${LNK_COST_OF_COMP}          id=is_cost_to_company
${LNK_AMOUNT}                id=amount
${LNK_PERCENTAGE}            id=percentage

*** Keywords ***

Add Salary Components:
    [Documentation]         Add new Salary Component
    [Arguments]             ${ADD_SALARY_COMP}  ${TYPE}   @{LIST_ADD_TO}
    Click on Add button
    input text              ${IN_NAME}      ${ADD_SALARY_COMP}
    run keyword if          '${TYPE}'=='Earning'     select radio button  type  1
    run keyword if          '${TYPE}'=='Deduction'   select radio button  type  2

    click element            xpath=//label[@for="amount"]

    FOR  ${element}  IN  @{LIST_ADD_TO}
        run keyword if  '${element}'=='Total Payable'     Select Item:  ${LNK_TOTAL_PAYABLE}
        run keyword if  '${element}'=='Cost to Company'   Select Item:  ${LNK_COST_OF_COMP}
        run keyword if  '${element}'=='Amount'            Select Item:  ${LNK_AMOUNT}
        run keyword if  '${element}'=='Percentage'        Select Item:  ${LNK_PERCENTAGE}
    END
    Modal Save