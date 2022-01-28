*** Settings ***

Library                         String

Resource                        ../../../../Keywords/UI/Admin/Qualifications/skills.robot
Resource                        ../../../../Keywords/UI/Helpers/table.robot

Force Tags                      Skills

Suite Setup                     Open Browser to login page
Suite Teardown                  Close browser

*** Test Cases ***

Verify Add Skills
    [Tags]                      AddSkills
    [Documentation]             Verify add skills.
    [Setup]                     Login and navigate to Skills
    ${SKILL}                    generate random string
    Add Skills:                 ${SKILL}
    ${MSG}                      Get toast message
    should be equal             ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    [Teardown]                  Logout

Edit skill
    [Tags]                      EditSkill
    [Documentation]             Adding and editing Skill
    [Setup]      run keywords   Login:
    ...          AND            Navigate to Skills
    ${MY_SKILL}                 generate random string
    Add Skills:                 ${MY_SKILL}
    Click on Edit for item in the table:  ${MY_SKILL}
    ${NEW_SKILL}                generate random string
    ${NEW_DESCRIPTION}          generate random string
    Edit Skill:                 ${NEW_SKILL}   ${NEW_DESCRIPTION}
    ${TXT}                      get toast message
    should be equal             ${TXT}          ${MSG_SUCCESSFULLY_UPDATED}
    [Teardown]                  Logout

Is item in the table
    [Documentation]             Is item in the skill table
    [Setup]      run keywords   Login:
    ...          AND            Navigate to Skills
    is item in the table:       Accounting
    [Teardown]                  Logout

Select items in the table
    [Documentation]             Is item in the skill table
    [Setup]      run keywords   Login:
    ...          AND            Navigate to Skills
    Select items in the table:  1       2       3
    [Teardown]                  Logout