*** Settings ***

Library                 ExtendedSelenium2Library

*** Variables ***

${BTN_HELP}             id=stickyHelpButton
${IN_SEARCH}            id=query

*** Keywords ***

Open help
    [Documentation]     Opens Help
    click element       ${BTN_HELP}

Search for topic:
    [Documentation]     Searches for "Add Users" topic
    [Arguments]         ${TOPIC}
    input text          ${IN_SEARCH}             ${TOPIC}
    press key           ${IN_SEARCH}             \\13
