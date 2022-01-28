*** Settings ***

Library                         String

Resource                        ../../../../Keywords/UI/Admin/Qualifications/education.robot

Force Tags                      Education

Suite Setup                     Open Browser to login page
Suite Teardown                  Close browser

*** Test Cases ***

Verify Add Education
    [Tags]                      AddEducation
    [Documentation]             Verify add education.
    [Setup]                     Login and navigate to Education
    ${EDUCATION}                generate random string
    Add Education:              ${EDUCATION}
    ${MSG}                      Get toast message
    should be equal             ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    [Teardown]                  Logout

