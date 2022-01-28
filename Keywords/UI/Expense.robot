*** Settings ***
Library                         ExtendedSelenium2Library

*** Variables ***
${DD_EXPENSE}                   id=menu_expense_viewExpenseModule
${DD_CONFIGURATION}             id=menu_expense_Configuration
${LNK_EXPENSE_TYPES}            id=menu_expense_viewExpenseType

*** Keywords ***
Navigate to in Expense:
      [Documentation]           Navigates through the Expense menu.
      [Arguments]               @{MENU_LIST}
      FOR    ${element}   IN    @{MENU_LIST}
      click element             ${element}
      END
      wait until angular ready

Navigate to Expense Types
      [Documentation]           Navigate to Expense Types in Configuration menu.
      Navigate to in Expense:   ${DD_EXPENSE}  ${DD_CONFIGURATION}  ${LNK_EXPENSE_TYPES}