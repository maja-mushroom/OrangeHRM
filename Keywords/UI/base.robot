*** Settings ***
Library     ExtendedSelenium2Library
Variables   ../../variables.py

*** Variables ***
${DD_USER}                      id=user-dropdown
${MNU_LOGOUT}                   id=logoutLink
${INPUT_USERNAME}               id=txtUsername
${INPUT_PASSWORD}               id=txtPassword
${BTN_LOGIN}=                   id=btnLogin
${TOAST_MSG}=                   css=.toast-message
${FLOATING_MSG}                 css=.top.fade.tooltip.in
${MODAL_TITLE}=                 css=.modal.open h4
${BTN_ADD}                      css=.fixed-action-btn
${BTN_SAVE}                     css=.primary-btn
${BTN_CANCEL}                   css=[ng-click="modal.cancel()"]
${BTN_NEXT}                     id=nextBtn
${BTN_PUBLISH}                  xpath=//button[text()='Publish']
${IN_NAME}                      id=name
${IN_DESCRIPTION}               id=description
${iFrame}                       id=noncoreIframe
${_}                            \s

*** Keywords ***

Open Browser to login page
    [Documentation]             Opens browser to login page
    open browser    ${URL}      browser=${BROWSER}
    maximize browser window

Input username:
    [Documentation]  Unosi username u polje za username
    [Arguments]                 ${_USERNAME_}
    input text                  ${INPUT_USERNAME}   ${_USERNAME_}

Input password:
    [Documentation]  Unesi password u polje za password
    [Arguments]                 ${_PASSWORD_}
    input text                  ${INPUT_PASSWORD}   ${_PASSWORD_}

Login:
    [Documentation]  Unesi username i password
    [Arguments]                 ${_USERNAME_}=admin   ${_PASSWORD_}=admin123
    Input username:             ${_USERNAME_}
    Input password:             ${_PASSWORD_}
    click button                ${btn_login}

Logout
    [Documentation]  Logout the user
    click element  ${DD_USER}
    click element  ${MNU_LOGOUT}

Get toast message
    [Documentation]  Returns toast message text
    element should be visible   ${TOAST_MSG_}
    ${MSG}=   get text          ${TOAST_MSG_}
    [Return]   ${MSG}

Verify message in the field:
    [Documentation]     Verifies message in the field
    [Arguments]         ${FIELD_}    ${EXPCTD_MESSAGE_}
    element should be visible   ${FIELD_}
    ${MESSAGE_} =   get text    ${FIELD_}
    should be equal  ${MESSAGE_}    ${EXPCTD_MESSAGE_}

Get modal title
    [Documentation]    Returns modal title
    ${TITLE}=          get text  ${MODAL_TITLE}
    [Return]           ${TITLE}

Get help block text:
    [Arguments]        ${filed_label}
#    ${TXT}=           get text  xpath=//label[text()="${filed_label}"]/../span[@class="help-block"]
    ${TXT}=            get text  xpath=//*[@class='help-block']/../label[text()='${filed_label}']
    [Return]           ${TXT}

Get help Education:
    [Arguments]        ${filed_lavel}
    ${TXT}=            get text   //label[text()='Level of Education']//following-sibling::span[1]
    [Return]           ${TXT}

Get help Nataionalities:
    [Arguments]        ${filed_lavel}
    ${TXT}=            get text   xpath=//label[text()='Name']//following-sibling::span[1]
    [Return]           ${TXT}

Click on Add button
   click element      ${BTN_ADD}

Modal Save
    click element      ${BTN_SAVE}

Modal Cancel
    click element      ${BTN_CANCEL}

Modal Back
    click element

Modal Next
    click element      ${BTN_NEXT}

Modal Publish
    click element      ${BTN_PUBLISH}

Is checkbox checked:
    [Arguments]  ${checkbox_id}
    [Documentation]  Check if checkbox with provided id checked.
    ${is_checked}=  execute javascript with replaced variables      return document.getElementById('${checkbox_id}').checked
    [Return]  ${is_checked}

Check checkbox:
    [Arguments]  ${checkbox_id}   ${bool_select}
    [Documentation]  Select/unselect checkbox by id.     #standard keywords select/unselect doesn't work in some cases so we introduced this one.
    ${selected}=    Is checkbox checked:  ${checkbox_id}
    run keyword if  ${bool_select}  select checkbox  id=${checkbox_id}
    ...  ELSE   run keyword if  ${selected}  click element  xpath=//label[@for='${checkbox_id}']

Select from list:
    [Arguments]             ${ID}  @{LIST}
    FOR  ${element}  IN     @{LIST}
       input text           ${ID}  ${element}
       press key            ${ID}  \\13
    END

Select date in Calendar:
    [Arguments]             ${DAY}    ${MONTH}     ${YEAR}
    click element           css=.picker--opened.picker--focused .picker__select--month input
    click element           //ul[contains (@class,"active")]//*[text()="${MONTH}"]
    click element           //div[contains(@class,'picker__select--year')]
    click element           //ul[contains (@class,"active")]//*[text()="${YEAR}"]
    click element           //*[contains (@class,"focused")]//*[contains(@class,"infocus")][text()="${DAY}"]