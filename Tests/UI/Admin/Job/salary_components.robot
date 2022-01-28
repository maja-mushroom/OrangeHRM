*** Settings ***

Library                         ExtendedSelenium2Library
Library                         String
Resource                        ../../../../Keywords/UI/adminmenu.robot
Resource                        ../../../../Keywords/UI/Admin/Job/salary_components.robot
Suite Setup                     Open Browser to login page
Suite Teardown                  Close browser

*** Variables ***

@{LIST_ADD_TO}=                 Total Payable      Cost to Company
@{LIST_VALUE_TYPE}=             Percentage
${VAR_TYPE}=                    Deduction

*** Test Cases ***

Add Salary Components
    [Tags]                      Salary
    [Documentation]             Add Salary Components
    [Setup]       run keywords  Login:
    ...           AND           Navigate to Salary Components

    ${SALARY_COMP_TITLE}        generate random string
    Add Salary Components:      ${SALARY_COMP_TITLE}    Deduction     Total Payable
    ${MSG}                      Get toast message
    should be equal             ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    [Teardown]                  Logout

Add Salary Components - all 4 selected
    [Tags]                      Salary
    [Documentation]             Add Salary Components
    [Setup]       run keywords  Login:
    ...           AND           Navigate to Salary Components
    ${SALARY_COMP_TITLE}        generate random string
    Add Salary Components:      ${SALARY_COMP_TITLE}    Deduction     Total Payable   Cost to Company   Percentage   Amount
    ${MSG}                      Get toast message
    should be equal             ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    [Teardown]                  Logout