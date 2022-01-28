*** Settings ***

Library             String
Resource            ../../../Keywords/UI/Admin/nationalities.robot
Resource            ../../../Keywords/UI/Helpers/table.robot
Force Tags          Add Nationalities
Suite Setup         Open Browser to login page
Suite Teardown      Close Browser

*** Test Cases ***

Verify Add Nationality
    [Tags]                      Add Nationalities
    [Setup]     run keywords    Login:
    ...         AND             Navigate to Nationalities
    ${NATIONALITY}              generate random string
    Add Nationality:           ${NATIONALITY}
    ${MSG}                      Get toast message
    should be equal             ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    [Teardown]                  Logout

Verify reqired fields for Nationalities
    [Tags]                        VerifyreqmesgNationalitiy
    [Documentation]               Verifies required messages for Nationality
    [Setup]  run keywords         Login:
    ...          AND              Navigate to Nationalities
    click element                 ${BTN_ADD}
    Modal Save
    ${HELP-TEXT}    Get help Nataionalities:     Name
    should be equal  ${HELP-TEXT}   Required
    Modal Cancel
    [Teardown]                    Logout

Edit Nationality
    [Tags]                        EditNationality
    [Documentation]               Adds and addits nationalitiy and verfies the update message
    [Setup]      run keywords     Login:
    ...          AND              Navigate to Nationalities
    ${MY_NATIONALITY}             generate random string
    Add Nationality:             ${MY_NATIONALITY}
    Click on Edit for item in the table:  ${MY_NATIONALITY}
    ${NEW_NATIONALITY}            generate random string
    Edit Nationality:             ${NEW_NATIONALITY}
    ${TXT}                        get toast message
    should be equal               ${TXT}          ${MSG_SUCCESSFULLY_UPDATED}
    [Teardown]                    Logout
