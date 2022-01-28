*** Settings ***
Library  ExtendedSelenium2Library


*** Keywords ***
Click on Edit for item in the table:
    [Arguments]         ${item}
    [Documentation]     Click on Edit icon for item in the table identified by unique value from the table.
    click element       xpath=//tr[.//span[text()="${item}"]]//td[contains(@class,'edit_item')]

#TODO: Is item in the table:
Is item in the table:
    [Arguments]         ${item}
    [Documentation]     Fineds element in the table
    ${previous}=    set selenium implicit wait  2
    FOR     ${i}    IN RANGE      99
      ${is_there}=      is element visible  xpath=//tr[.//span[text()="${item}"]] | //tr[.//a[text()="${item}"]]
      exit for loop if  ${is_there}
      click element  xpath=//i[text()='chevron_right']
    END
    set selenium timeout  ${previous}

#TODO: Select items in the table [koristiti FOR petlju] argument mu je @{lista}
Select items in the table:
    [Arguments]         @{table}
    FOR  ${element}     IN  @{table}
    click element       //tr[${element}]//td[1]
    END