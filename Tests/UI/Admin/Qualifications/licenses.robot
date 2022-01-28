*** Settings ***

Library                         String

Resource                        ../../../../Keywords/UI/Admin/Qualifications/licenses.robot

Force Tags                      Licenses

Suite Setup                     Open Browser to login page
Suite Teardown                  Close browser

*** Test Cases ***

Verify Add Licenses
    [Tags]                      AddLicenses
    [Documentation]             Verify add education.
    [Setup]                     Login and navigate to Licenses
    ${LICENSE}                  generate random string
    Add Licenses:               ${LICENSE}
    ${MSG}                      Get toast message
    should be equal             ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    [Teardown]                  Logout

