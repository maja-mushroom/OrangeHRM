*** Settings ***

Library                         String

Resource                        ../../../../Keywords/UI/Admin/Job/work_shifts.robot
Resource                        ../../../../Keywords/UI/adminmenu.robot

Force Tags                      Job

Suite Setup                     Open Browser to login page
Suite Teardown                  Close browser

*** Test Cases ***

Verify Add Work Shift
    [Tags]                      AddWorkShift
    [Documentation]             Verify add work shift.
    [Setup]     run keywords    Login:
    ...         AND             Navigate to Work Shift
    ${WORK_SHIFT}               generate random string
    Add Work Shift:             ${WORK_SHIFT}       07:00       15:00
    ${MSG}                      Get toast message
    should be equal             ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    [Teardown]                  Logout