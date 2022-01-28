*** Settings ***

Library                             ExtendedSelenium2Library
Library                             String
Library                             OperatingSystem

Resource                            ../../base.robot
Resource                            ../../adminmenu.robot
Resource                            ../../moremenu.robot
Resource                            ../../Helpers/table.robot

*** Variables ***
${ASSET_TST_MSG}                    Add Asset
${IN_ASSET_ID}                      id=addAsset_assetCode
${IN_ASSET_NAME}                    id=addAsset_assetName
${ADD_ASSET_TOOLTIP}                id=addItemBtn@data-tooltip
${IN_ASSET_BRAND}                   id=addAsset_brand
${IN_ASSET_VENDOR}                  id=addAsset_vendor
${IN_ASSET_MODEL}                   id=addAsset_model
${IN_ASSET_CATEGORY}                id=addAsset_category
${DD_ASSET_LOCATION}                //input[@type="text" and @class="select-dropdown"]
${IN_ASSET_ACQUIRED}                id=addAsset_aquiredDate
${IN_WARRANTY_START}                id=addAsset_warrantyStart
${IN_WARRANTY_END}                  id=addAsset_warrantyEnd
${IN_ASSET_DESCR}                   id=addAsset_description
${ASSET_IMAGE}                      id=assetImageId
${ASSET_FILE}                       //i[@id="addAssetAttachment" and @data-tooltip="Add Attachment"]    #id=addAssetAttachment
${BTN_SELECT_FILE}                  id=addAssetAttachment_attachment
${BTN_SELECT_IMAGE}                 id=addAssetPhotoAttachment_photofile
${BTN_SAVE_FILE}                    id=addNewAttach
${BTN_SAVE_IMAGE}                   id=addNewPicture
${BTN_EDIT_ASSET}                   id=btnSave
${BTN_SAVE_ASSET}                   id=btnSave
${BTN_FILTER}                       id=searchModal
${IN_FILTER_SERIAL}                 id=assetSearch_assetName
${BTN_SEARCH}                       id=btnSrch
${FILES_FOLDER}                     ${CURDIR}${/}..${/}..${/}..${/}..${/}Files
${FILE_ASSETS}                      ${FILES_FOLDER}${/}assets_file.txt
${IMAGE_ASSETS}                     ${FILES_FOLDER}${/}assets_image.png

*** Keywords ***

Add Asset - Verify Add Asset button tooltip
    [Documentation]                 Verify Add Asset toast message.
    ${msg}=                         get element attribute   ${ADD_ASSET_TOOLTIP}
    should be equal                 ${msg}    ${ASSET_TST_MSG}

Add Asset:
    [Documentation]  Add asset
    [Arguments]     ${serial_no}    ${asset_id}=   ${brand}=    ${vendor}=  ${model}=  ${category}=     ${location}=        ${status}=      ${acquired}=        ${warranty_starts}=     ${warranty_ends}=   ${description}=    ${file}=    ${image}=
    Asset - input serial:           ${serial_no}
    Asset - input asset id:         ${asset_id}
    Asset - set Brand:              ${brand}
    Asset - set Vendor:             ${vendor}
    Asset - input Model:            ${model}
    Asset - set Category:           ${category}
    Asset - set Location:           ${location}
    Asset - set Date Acquired:      ${acquired}
    Asset - set Warranty Starts:    ${warranty_starts}
    Asset - set Warranty Ends:      ${warranty_ends}
    Asset - Input Description:      ${description}
    Save Asset
    Toast message check
    Edit Asset
    Asset - Choose Status:          ${status}
    Toast message check
    Asset - Add Attachment:         ${file}
    Toast message check
    Asset - Add Image:              ${image}
    Save Asset
    Toast message check
    Is Asset in the table:          ${serial_no}

Asset - input serial:
    [Arguments]     ${serial_no}
    input text                      ${IN_ASSET_NAME}   ${serial_no}

Asset - input asset id:
    [Arguments]     ${id}=
    run keyword if                  "${id}" != ""   clear element text  ${IN_ASSET_ID}
    run keyword if                  "${id}" != ""   input text  ${IN_ASSET_ID}   ${id}
    [Return]    ${id}

Asset - set Brand:
    [Arguments]   ${brand}
    Select from list:               ${IN_ASSET_BRAND}    ${brand}

Asset - set Warranty Starts:
    [Arguments]  ${date}
    [Documentation]     Sets Warranty start date. Date should be provided in format DD/Month/YYYY (1/January/2021).
    @{tmp}=                         split string  ${date}   /
    [Return]    @{tmp}
    run keyword if                  '${date}'==""   no operation
    ...     ELSE    run keyword     Warranty Starts Date    @{tmp}

Warranty Starts Date
    [Arguments]             @{tmp}
    click element           ${IN_WARRANTY_START}
    click element           xpath=//div[@id="addAsset_warrantyStart_root"]//div[contains(@class,'picker__select--year')]    #//div[@class="select-wrapper picker__select--year"]
    click element           xpath=//*[@id="addAsset_warrantyStart_root"]//span[text()="${tmp}[2]"]
    click element           xpath=//div[@id="addAsset_warrantyStart_root"]//div[contains(@class,'picker__select--month')]
    click element           xpath=//*[@id="addAsset_warrantyStart_root"]//span[text()="${tmp}[1]"]
    click element           //*[contains (@class,"focused")]//*[contains(@class,"infocus")][text()="${tmp}[0]"]


Asset - set Vendor:
    [Arguments]   ${vendor}
    Select from list:        ${IN_ASSET_VENDOR}    ${vendor}

Asset - set Category:
    [Arguments]   ${category}
    Select from list:         ${IN_ASSET_CATEGORY}    ${category}

Asset - input Model:
    [Arguments]     ${model}
    input text                ${IN_ASSET_MODEL}   ${model}

Choose Location
    [Arguments]             ${location}
    click element           ${DD_ASSET_LOCATION}
    click element           xpath=//span[text()='${location}']

Asset - set Location:
    [Arguments]              ${location}
    [Return]                 ${location}
    run keyword if           '${location}'==""       no operation
    ...     ELSE    run keyword     Choose Location     ${location}

Asset - set Warranty Ends:
    [Arguments]  ${date}
    [Documentation]     Sets Warranty end date. Date should be provided in format DD/Month/YYYY (1/January/2021).
    @{tmp}=                   split string  ${date}   /
    [Return]  @{tmp}
    run keyword if            '${date}'==""   no operation
    ...     ELSE    run keyword     Warranty Ends Date  @{tmp}

Warranty Ends Date
    [Arguments]            @{tmp}
    click element          ${IN_WARRANTY_END}
    click element          xpath=//div[@id="addAsset_warrantyEnd_root"]//div[contains(@class,'picker__select--year')]    #//div[@class="select-wrapper picker__select--year"]
    click element          xpath=//*[@id="addAsset_warrantyEnd_root"]//span[text()="${tmp}[2]"]
    click element          xpath=//div[@id="addAsset_warrantyEnd_root"]//div[contains(@class,'picker__select--month')]
    click element          xpath=//*[@id="addAsset_warrantyEnd_root"]//span[text()="${tmp}[1]"]
    click element          xpath=//*[contains (@class,"focused")]//*[contains(@class,"infocus")][text()="${tmp}[0]"]

Asset - set Date Acquired:
    [Arguments]  ${date}
    [Documentation]      Sets acquired date. Date should be provided in format DD/Month/YYYY (1/January/2021).
    @{tmp}=                 split string  ${date}   /
    [Return]    @{tmp}
    run keyword if          '${date}'==""   no operation
    ...     ELSE        run keyword     Date Acquired  @{tmp}

Date Acquired
    [Arguments]  @{tmp}
    click element               ${IN_ASSET_ACQUIRED}
    Select date in Calendar:    ${tmp}[0]   ${tmp}[1]   ${tmp}[2]

Asset - Input Description:
    [Documentation]         Enters asset description in add asset form
    [Arguments]             ${description}
    run keyword if                      '${description}'==""    no operation
    ...     ELSE    input text           ${IN_ASSET_DESCR}    ${description}

Asset - Add Attachment:
    [Documentation]         Uploads file attachment
    [Arguments]             ${file}
    [Return]        ${file}
    run keyword if                  '${file}'==""    no operation
    ...     ELSE    run keywords    execute javascript      window.scrollTo(0,0)
    ...     AND     Upload File     ${file}

Upload File
    [Arguments]     ${file}
    click element           ${ASSET_FILE}
    ${file}                 normalize path          ${file}
    choose file             ${BTN_SELECT_FILE}      ${file}
    click element           ${BTN_SAVE_FILE}

Asset - Add Image:
    [Documentation]         Uploads image
    [Arguments]             ${image}
    [Return]    ${image}
    run keyword if                  '${image}'==""      no operation
    ...     ELSE    run keyword  Upload Image  ${image}

Upload Image
    [Arguments]     ${image}
    click element           ${ASSET_IMAGE}
    should exist            ${image}
    ${image}                normalize path        ${image}
    choose file             ${BTN_SELECT_IMAGE}   ${image}
    click element           ${BTN_SAVE_IMAGE}

Save Asset
    [Documentation]         Save button in add asset
    click element           ${BTN_SAVE_ASSET}

Edit Asset
    [Documentation]         Edit button in add asset form
    click element           ${BTN_EDIT_ASSET}

Asset - Choose Status:
    [Documentation]         Chooses Status in edit asset form
    [Arguments]             ${ASSET_STATUS}
    [Return]  ${ASSET_STATUS}
    run keyword if                  '${ASSET_STATUS}'==""    no operation
    ...     ELSE    run keyword  Choose Status  ${ASSET_STATUS}

Choose Status
    [Arguments]  ${ASSET_STATUS}
    click element           changeStatusDivId
    click element           ${ASSET_STATUS}

Toast message check
    [Documentation]         Checks will toast message dissapear
    FOR   ${time}    IN RANGE   1  9999
        ${VISIBLE}=     is element visible   css=.toast-message
        run keyword if   ${VISIBLE}    sleep  1
        ...       ELSE     exit for loop
        END

Is Asset in the table:
    [Documentation]         Checks is newly added asset in the table
    [Arguments]             ${serial_no}
    click element                   ${3_LNK_VIEW_ASSETS}
    click element                   ${BTN_FILTER}
    input text                      ${IN_FILTER_SERIAL}     ${serial_no}
    click element                   ${BTN_SEARCH}
    Is item in the table:           ${serial_no}


