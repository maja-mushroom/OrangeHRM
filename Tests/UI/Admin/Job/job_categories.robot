*** Settings ***

Library                         String

Resource                        ../../../../Keywords/UI/Admin/Job/job_categories.robot
Resource                        ../../../../Keywords/UI/Helpers/table.robot
Resource                        ../../../../Keywords/UI/adminmenu.robot

Force Tags                      Jobcategories

Suite Setup                     Open Browser to login page
Suite Teardown                  Close browser

*** Variables ***

*** Test Cases ***

Verify Add Job Categories
    [Tags]                       Addjobcategory
    [Documentation]              Add Job Category and verify the message
    [Setup]      run keywords    Login:
    ...          AND             Navigate to Job Categories
    ${JOB_CATEGORIES}            generate random string
    Add Job Category:            ${JOB_CATEGORIES}
    ${MSG}                       Get toast message
    should be equal              ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    [Teardown]                   Logout

Verification of floating message Add Job Category
    [Tags]                       AddCategory
    [Documentation]              Verifies Add Job Category Popup
    [Setup]    run keywords      Login:
    ...        AND               Navigate to Job Categories
    mouse over                   ${BTN_ADD}
    element should be visible    ${FLOATING_MSG}
    [Teardown]                   Logout

Verify Add Job Category label
    [Tags]                        Verifylbl
    [Documentation]               Verifies label Add Job Category
    [Setup]      run keywords     Login:
    ...          AND              Navigate to Job Categories
    Click on Add button
    ${TITLE}                      Get modal title
    should be equal               ${TITLE}         Add Job Category
    Modal Cancel
    [Teardown]                    Logout

Edit job category
    [Tags]                        EdingJobCtg
    [Documentation]               Adding and editing Job Category
    [Setup]      run keywords     Login:
    ...          AND              Navigate to Job Categories
    ${MY_CATEGORY}                generate random string
    Add Job Category:             ${MY_CATEGORY}
    Click on Edit for item in the table:  ${MY_CATEGORY}
    ${NEW_CATEGORY}               generate random string
    Edit Job Category:            ${NEW_CATEGORY}
    ${TXT}                        get toast message
    should be equal               ${TXT}          ${MSG_SUCCESSFULLY_UPDATED}
    [Teardown]                    Logout