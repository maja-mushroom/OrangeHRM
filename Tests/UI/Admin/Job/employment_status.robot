*** Settings ***

Library                         String

Resource                        ../../../../Keywords/UI/Admin/Job/employment_status.robot

Force Tags                      Job EmploymentStatus

Suite Setup                     Open Browser to login page
Suite Teardown                  Close browser

*** Test Cases ***

Verify Add Employment Status
    [Tags]                      Add
    [Documentation]             Verify add Add Employment status.
    [Setup]     run keywords    Login:
    ...         AND             Navigate to Employment Status
    ${EMPLOYMENT_STATUS}        generate random string
    Add Pay Grade:              ${EMPLOYMENT_STATUS}
    ${MSG}                      Get toast message
    should be equal             ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    [Teardown]                  Logout