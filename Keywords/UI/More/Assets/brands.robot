*** Settings ***

Library             ExtendedSelenium2Library
Library             String

Resource            ../../base.robot
Resource            ../../adminmenu.robot

*** Variables ***
${IN_ID}             id=brandForm_brandCode
${IN_NME}            id=brandForm_brandName
${TITLE_FIELD}       xpath=//div[@id="addEditVendorModal"]//h5[@id="formHeaderText"]
${HELPER_REQUIRED}   css=.requiredHelperText
${HELPER_TXT_ID}     xpath=//label[@for="brandForm_brandCode"]
${HELPER_TXT_NAME}   xpath=//label[@for="brandForm_brandName"]
${BTN_CANCEL_BRAND}  id=btnCancel
${BTN_SAVE_BRAND}    id=saveVendor
${BRAND_TST_MSG}     xpath=//a[@data-tooltip="Add Brand"]

*** Keywords ***

Add Brand - Verify Add Brand toast message
    [Documentation]             Add Brand toast message.
    element should be visible   ${BRAND_TST_MSG}

Verify Modal Title:
    [Documentation]               Verifies Modal Title.
    [Arguments]                   ${EXPECTED_TITLE}
    element should be visible     ${TITLE_FIELD}
    ${TITLE2} =   get text        ${TITLE_FIELD}
    should be equal  ${TITLE2}    ${EXPECTED_TITLE}

Add brand - Input ID:
    [Documentation]     Inputs ID.
    [Arguments]         ${ID}=
    ${value}            get value     ${IN_ID}
    run keyword if      "${value}" == "${empty}"     input text          ${IN_ID}      ${ID}

Add brand - Input Name:
    [Documentation]     Inputs Name.
    [Arguments]         ${NAME}
    input text          ${IN_NME}      ${NAME}

Add brand - Verify fields:
    [Documentation]            Verifies "Requred" field.
    [Arguments]                ${FILED}  ${REQUIRED}
    element should contain     ${FILED}  ${REQUIRED}

Add brand - Modal Save
    [Documentation]     Clicks on "Save".
    click element       ${BTN_SAVE_BRAND}

Add brand - Modal Cancel
    [Documentation]     Clicks on "Cancel".
    click element       ${BTN_CANCEL_BRAND}

