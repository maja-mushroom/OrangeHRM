*** Settings ***

Library                     ExtendedSelenium2Library
Library                     String


Resource                    ../base.robot

*** Variables ***
${BTN_ADD}          id=addItemBtn
${BTN_SAVE}         id=btnSave
${IN_NAME}          id=ExpenseType_name
${FRAME}            id=noncoreIframe

*** Keywords ***

Click Add button
    [Documentation]      Clicks on add button after selecting frame
    select frame         ${FRAME}
    click element        ${BTN_ADD}

Click Save button
    [Documentation]      Saves expense type
    click element        ${BTN_SAVE}

Input name:
    [Documentation]      Inputs genereted name
    [Arguments]          ${NAME}
    input text           ${IN_NAME}     ${NAME}

Choose applicable form:
    [Arguments]          ${LI_FORM}
    [Documentation]      Chooses provided aplicable form in dropdown menu
    click element        //div[./ul[contains(@id,'select-options')]]
    click element        //span[text()="${LI_FORM}"]

Choose expense type options:
    [Arguments]         ${LI_OPT}
    [Documentation]    Chooses provided expense options
    click element      //*[@class="row expenseTypeOptions"]//*[text()="${LI_OPT}"]