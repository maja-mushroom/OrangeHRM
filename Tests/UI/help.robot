*** Settings ***

Library                         String

Resource                        ../../Keywords/UI/help.robot
Resource                        ../../Keywords/UI/base.robot
Resource                        ../../Keywords/UI/adminmenu.robot

Force Tags                      Help

Suite Setup                     Open Browser to login page
Suite Teardown                  Close browser

*** Variables ***
${TOPIC}                        Add Users
${SEARCH_RESULTS}               xpath=//ul[@class='search-results-list']//a[text()='${TOPIC}']

*** Test Cases ***

Help - Add user
    [Tags]                      HelpAddUser
    [Documentation]             Goes to Help and finds "Add Users" topic
    [Setup]       run keywords  Login:
    ...             AND         Navigate to users
    Open help
    select window               new
    Search for topic:           ${TOPIC}
    element should be visible   ${SEARCH_RESULTS}
    select window               main
    [Teardown]                  Logout