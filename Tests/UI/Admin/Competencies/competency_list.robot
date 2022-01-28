*** Settings ***
Resource                        ../../../../Keywords/UI/Admin/Competencies/competency_list.robot
Resource                        ../../../../Keywords/UI/adminmenu.robot
Resource                        ../../../../Keywords/UI/Helpers/table.robot

Force Tags                      Competency

Suite Setup                     Open Browser to login page
Suite Teardown                  Close browser

*** Variables ***

*** Test Cases ***

Add Competency List - parent
    [Tags]                       CompetencyParent
    [Documentation]              Login, goes to Competency page and adds new Competency List .
    [Setup]  run keywords        Login:
    ...           AND            Navigate to Competency List
    ${MY_NAME}                   generate random string
    ${MY_DESCRIPTION}            generate random string
    Add Competency List:         ${MY_NAME}   ${MY_DESCRIPTION}   False    IT Skill
    ${MSG}                       Get toast message
    should be equal              ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    [Teardown]                   Logout


Add Competency List - checkbox
     [Tags]                       CompetencyCheckbox
     [Documentation]              Login, goes to Competency page and adds new Competency List .
     [Setup]  run keywords        Login:
     ...           AND            Navigate to Competency List
     ${MY_NAME}                   generate random string
     ${MY_DESCRIPTION}            generate random string
     Add Competency List:         ${MY_NAME}   ${MY_DESCRIPTION}   True
     ${MSG}                       Get toast message
     should be equal              ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
     [Teardown]                   Logout
