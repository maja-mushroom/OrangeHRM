*** Settings ***
Library                             String

Resource                            ../../../../Keywords/UI/Expense/Configuration/ExpenseTypes.robot
Resource                            ../../../../Keywords/UI/Expense.robot
Resource                            ../../../../Keywords/UI/Helpers/table.robot

Force Tags                          ExpenseTypes

Suite Setup                         Open browser to login page
Suite Teardown                      Close browser

*** Variables ***
@{EXPENSE_TYPE_LIST_ID}             ExpenseType_active  ExpenseType_isMandatory   ExpenseType_eligibility
...                                 ExpenseType_multiCurrencyApplicable  ExpenseType_restrictionsApplicable

*** Test Cases ***
Add Expense Types - all Filds Manul
    [Tags]                          AddExpenseTypeAllFilds
    [Documentation]                 Add new Expense Type and delete added Expense Type.
    [Setup]    run keywords         Login:
    ...       AND                   Navigate to Expense Types
    Add new Expense Type:           First name   Hotel   @{EXPENSE_TYPE_LIST_ID}
    ${MSG}                          Get toast message
    should be equal                 ${MSG}  ${MSG_SUCCESSFULLY_SAVED}
    Modal Exit or Cancel ET
    Is item in the table:           First name
    Edit Added Expense Type:        First name  Second name  Airfare  @{EXPENSE_TYPE_LIST_ID}
    ${MSG}                          Get toast message
    should be equal                 ${MSG}  ${MSG_SUCCESSFULLY_UPDATED}
    Modal Exit or Cancel ET
    [Teardown]  run keywords        Delete Added Expense Type:  Second name
    ...    AND                      Logout