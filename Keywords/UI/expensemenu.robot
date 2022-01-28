*** Settings ***

Library                      ExtendedSelenium2Library

*** Variables ***

${DD_EXPENSE}                id=menu_expense_viewExpenseModule
${LNK_EXPENCE_TYPE}          id=menu_expense_viewExpenseType
${DD_CONFIGURATION}          id=menu_expense_Configuration
*** Keywords ***

Navigate to in Expense:
      [Documentation]         Navigates through the expence menu
      [Arguments]             @{MENU_LIST}
      FOR    ${element}   IN  @{MENU_LIST}
      click element           ${element}
      END
      wait until angular ready

Navigate to Expense Types
      [Documentation]              Navigate to Brands in More menu
      Navigate to in Expense:      ${DD_EXPENSE}    ${DD_CONFIGURATION}   ${LNK_EXPENCE_TYPE}