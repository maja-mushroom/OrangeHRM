*** Settings ***

Library                         String

Resource                        ../../../../Keywords/UI/Admin/Job/pay_grades.robot
Resource                        ../../../../Keywords/UI/Helpers/table.robot
Resource                        ../../../../Keywords/UI/adminmenu.robot

Force Tags                      Job

Suite Setup                     Open Browser to login page
Suite Teardown                  Close browser

*** Test Cases ***

Verify Add Pay Grades
    [Tags]                      AddPayGrade
    [Documentation]             Verify add Oay grade.
    [Setup]     run keywords    Login:
    ...         AND             Navigate to Pay Grades
    ${PAY_GRADE}                generate random string
    Add Pay Grade:              ${PAY_GRADE}
    ${MSG}                      Get toast message
    should be equal             ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    [Teardown]                  Logout

Edit Pay Grades
    [Tags]                      EditPayGrades
    [Documentation]             Adding and editing pay grades
    [Setup]      run keywords   Login:
    ...          AND            Navigate to Pay Grades
    ${MY_PG}                    generate random string
    Add Pay Grade:              ${MY_PG}
    Click on Edit for item in the table:  ${MY_PG}
    ${NEW_PG}                   generate random string
    Edit Pay Grade:             ${NEW_PG}   ${MY_CURRENCY_VALUE}    500   5500
    ${TXT}                      get toast message
    should be equal             ${TXT}          ${MSG_SUCCESSFULLY_SAVED}
    [Teardown]                  Logout