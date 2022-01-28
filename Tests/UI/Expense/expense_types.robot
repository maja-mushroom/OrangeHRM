*** Settings ***

Resource           ../../../Keywords/UI/Expense/expense_types.robot
Resource           ../../../Keywords/UI/Helpers/table.robot
Resource           ../../../Keywords/UI/expensemenu.robot
Force Tags         Expense     Configuration   Expense types
Suite Setup        Open Browser to login page
Suite Teardown     Close all browsers

*** Test Cases ***

Add new expense type
   [Documentation]          Adds new Expense type.
   [Tags]                   Expense
   [Setup]  run keywords    Login:
   ...    AND               Navigate to Expense Types
   Click Add button
   ${NAME}          generate random string
   Input name:      ${NAME}
   Choose applicable form:        Airfare
   Choose expense type options:   Expense Type Active
   Click Save button
   ${MSG}                      Get toast message
   should be equal             ${MSG}   ${MSG_SUCCESSFULLY_SAVED}
   [Teardown]  Logout



