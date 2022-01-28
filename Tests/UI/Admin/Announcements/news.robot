*** Settings ***

Library                               String

Resource                              ../../../../Keywords/UI/Admin/Announcements/news.robot
Resource                              ../../../../Keywords/UI/adminmenu.robot
Resource                              ../../../../Keywords/UI/Helpers/table.robot

Force Tags                            News

Suite Setup                           Open Browser to login page
Suite Teardown                        Close browser

*** Test Cases ***

Verify Add News
    [Documentation]                    Verify adding news
    [Setup]     run keywords           Login:
    ...         AND                    Navigate to News
    ${NEWS_TOPIC}                      generate random string  8   [LETTERS][NUMBERS]
    ${NEWS_DESCRIPTION}                generate random string  30  [LOWER]
    News add - general:                ${NEWS_TOPIC}    ${NEWS_DESCRIPTION}   True
    ${MSG}                             Get toast message
    should be equal                    ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    Select date:                       30  March  2021
    News - publish to all user roles:  True
    Select employee:                   John Smith    Lisa Andrews
    click element                      ${UNSELECT_CB_LOCATIONS}
    News - publish to all locations:   False    Australian Regional HQ
    News - select employment status:   Freelance  Full-Time Probation
    News - select job titles:          CEO   CTO
    News - select sub units:           QA Team   Engineering   Architecture Team
    Modal Publish
    [Teardown]                         Logout