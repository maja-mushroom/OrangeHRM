*** Settings ***
Resource                                ../../base.robot

*** Variables ***
${IN_EXPENSE_TYPE_NAME}                 id=ExpenseType_name
${DD_APPLICABLE_CLAIM_FORM}             css=.select-wrapper
${BTN_SAVE}                             id=btnSave
${BTN_CANCEL}                           id=btnCancel
${DD_MENU}                              id=frmList_ohrmListComponent_Menu
${BTN_DELETE}                           id=deleteBtn
${BTN_CONFIRM_DELETE}                   id=expense-type-delete-button

*** Keywords ***
Add new Expense Type:
    [Documentation]                     Add new Expense Type with selected all checkboxes.
    [Arguments]                         ${expense_type_name}  ${app_claim_form}=  @{expense_type_list_id}
    select frame                        ${iFrame}
    Click on Add button
    Input Expense Type Name:            ${expense_type_name}
    Select Applicable Claim Form:       ${app_claim_form}
    FOR                                 ${expense_type}   IN    @{expense_type_list_id}
        Check checkbox:                 ${expense_type}   True
    END
    Modal Save Expense Type

Input Expense Type Name:
    [Documentation]                     Input Expense Type Name.
    [Arguments]                         ${expense_type_name}
    input text                          ${IN_EXPENSE_TYPE_NAME}  ${expense_type_name}

Select Applicable Claim Form:
    [Documentation]                     Select Applicable Claim Form from list.
    [Arguments]                         ${app_claim_form}
    click element                       ${DD_APPLICABLE_CLAIM_FORM}
    click element                       //span[text()='${app_claim_form}']

Modal Save Expense Type
    [Documentation]                     Save Expense Type Add Form.
    click element                       ${BTN_SAVE}

Modal Exit or Cancel ET
    [Documentation]                     Exit or Cancel Expense Type Add Form.
    click element                       ${BTN_CANCEL}

Delete Added Expense Type:
    [Documentation]                     Deleted added Expense Type.
    [Arguments]                         ${expense_type_name}
    click element                       //a[text()='${expense_type_name}']/../parent::tr/td/label
    execute javascript                  window.scrollTo(0,document.body.scrollHeight)
    sleep                               0.5s
    click element                       ${DD_MENU}
    click element                       ${BTN_DELETE}
    click element                       ${BTN_CONFIRM_DELETE}

Edit Added Expense Type:
    [Documentation]                     Edit added Expense Type.
    [Arguments]                         ${expense_type_name}  ${edit_expense_type_name}=  ${edit_app_claim_form}=  @{expense_type_list_id}
    click element                       //a[text()='${expense_type_name}']
    Input Expense Type Name:            ${edit_expense_type_name}
    Select Applicable Claim Form:       ${edit_app_claim_form}
    FOR                                 ${expense_type}   IN    @{expense_type_list_id}
        Check checkbox:                 ${expense_type}   False
    END
    Modal Save Expense Type