*** Settings ***

Resource            ../../../../Keywords/UI/More/Assets/brands.robot

Force Tags          Brands
Suite Setup         Open Browser to login page
Suite Teardown      Close all browsers

*** Test Cases ***

Add new brand
    [Documentation]                             Adds new brand.
    [Tags]                                      Newbrand
    [Setup]  run keywords                       Login:
    ...         AND                             Navigate to More
    ...         AND                             Select frame  ${iFrame}
    ...         AND                             Navigate to Brands
    Mouse over                                  ${BTN_ADD}
    Add Brand - Verify Add Brand toast message
    Click on Add button
    Verify Modal Title:                         Add Brand
    Add brand - Verify fields:                  ${HELPER_TXT_ID}  Id *
    ${RANDOM_ID}    generate random string      17   '[LETTERS][NUMBERS]'
    Add brand - Input ID:                       ${RANDOM_ID}
    Add brand - Verify fields:                  ${HELPER_TXT_NAME}  Name *
    ${RANDOM_NAME}    generate random string    7   '[LETTERS]'
    Add brand - Input Name:                     ${RANDOM_NAME}
    Add brand - Verify fields:                  ${HELPER_REQUIRED}  * Required field
    Add brand - Modal Save
    Verify message in the field:                ${TOAST_MSG}  Successfully Saved
    [Teardown]  run keywords                    Logout
    ...         AND                             Unselect frame


