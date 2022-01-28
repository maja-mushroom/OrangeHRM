*** Settings ***

Library                         String

Resource                        ../../../../Keywords/UI/Admin/Qualifications/memberships.robot

Force Tags                      Memberships

Suite Setup                     Open Browser to login page
Suite Teardown                  Close browser

*** Test Cases ***

Verify Add Membership
    [Tags]                      AddMembership
    [Documentation]             Verify add membership.
    [Setup]                     Login and navigate to Membership
    ${MEMBERSHIP}               generate random string
    Add Membership:             ${MEMBERSHIPS}
    ${MSG}                      Get toast message
    should be equal             ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    [Teardown]                  Logout
