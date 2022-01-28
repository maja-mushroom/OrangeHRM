*** Settings ***

Library                     ExtendedSelenium2Library
Library                     String


Resource                    ../../base.robot
Resource                    ../../../../Keywords/UI/Helpers/table.robot

*** Variables ***
${BTN_ADD}                  id=addItemBtn
${BTN_SAVE}                 id=saveVendor
${FRAME_NONCORE}            noncoreIframe
${IN_ID}                    id=vendor_vendorCode
${IN_NAME}                  id=vendor_vendorName
${IN_CONTACT}               id=vendor_phone
${IN_EMAIL}                 id=vendor_email
${IN_WEBSITE}               id=vendor_website
${IN_ADRESS}                id=vendor_address
${BTN_FILTER}               id=searchModal
${IN_FILTER_NAME}           id=vendorSearch_vendorName
${IN_FILTER_ID}             id=vendorSearch_vendorCode
${BTN_SEARCH}               id=searchVendorFormBtn
${BTN_RESET}                id=searchDocumentResetBtn
${BTN_CANCEL}               id=searchDocumentCancelBtn
${BTN_...}                  id=frmList_ohrmListComponent_Menu
${DELETE}                   id=vendorDelete
${BTN_DELETE}               id=assetDelete
${VENDOR_DELETE}            id=vendorDelete
${BTN_YES_DELETE}           id=vendor-delete-button
*** Keywords ***
Add Vendor:
    [Documentation]         Adds new Vendor
    [Arguments]             ${NAME}     ${ID}=     ${CONTACT}=      ${EMAIL}=        ${WEBSITE}=      ${ADRESS}=
    select frame            ${FRAME_NONCORE}
    click element           ${BTN_ADD}
    run keyword if          '${ID}'!='${empty}'         input text      ${IN_ID}            ${ID}
    ${SET_ID}               get value   ${IN_ID}
    input text              ${IN_NAME}  ${NAME}
    run keyword unless      '${CONTACT}'=='${empty}'    input text      ${IN_CONTACT}       ${CONTACT}
    run keyword unless      '${EMAIL}'=='${empty}'      input text      ${IN_EMAIL}         ${EMAIL}
    run keyword unless      '${WEBSITE}'=='${empty}'    input text      ${IN_WEBSITE}       ${WEBSITE}
    run keyword unless      '${ADRESS}'=='${empty}'     input text      ${IN_ADRESS}        ${ADRESS}
    click element           ${BTN_SAVE}
    [Return]    ${SET_ID}
Generate random Email
    [Documentation]         Generates random Email
    ${RANDOM}               generate random string   8  [LOWER]
    [Return]                ${RANDOM}@outlook.com
Generate random Website
    [Documentation]         Generates random Website
    ${RANDOM}               generate random string    8  [LOWER]
    [Return]                http://www.${RANDOM}.com
Filter brand by ID and Name:
    [Documentation]         Filter brand by id
    [Arguments]             ${_ID_}  ${_NAME_}
    click element           ${BTN_FILTER}
    run keyword if          '${_ID_}'!='${EMPTY}'     input text    ${IN_FILTER_ID}     ${_ID_}
    run keyword if          '${_NAME_}'!='${EMPTY}'   input text    ${IN_FILTER_NAME}   ${_NAME_}
    click element           ${BTN_SEARCH}
    wait until angular ready
Reset filter
     [Documentation]         Reset filter
     click element           ${BTN_FILTER}
     click element           ${BTN_RESET}
     wait until angular ready
Delete Vendor:
    [Documentation]         Deletes added Vendor
    [Arguments]             ${ID}      ${NAME}
    Filter brand by ID and Name:   ${ID}      ${NAME}
    click element           //a[text()="${ID}"]/../..//label
    mouse over              ${BTN_...}
    click element           ${BTN_...}
    click element           ${VENDOR_DELETE}
    click element           ${BTN_YES_DELETE}
    Reset Filter
