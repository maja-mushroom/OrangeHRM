*** Settings ***

Library                         String

Resource                        ../../../../Keywords/UI/Admin/Qualifications/languages.robot

Force Tags                      Languages

Suite Setup                     Open Browser to login page
Suite Teardown                  Close browser

*** Test Cases ***

Verify Add Languages
    [Tags]                      AddLanguages
    [Documentation]             Verify add languages.
    [Setup]                     Login and navigate to Languages
    ${LANGUAGE}                 generate random string
    Add Languages:              ${LANGUAGE}
    ${MSG}                      Get toast message
    should be equal             ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    [Teardown]                  Logout



