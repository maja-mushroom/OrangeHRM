*** Settings ***

Resource            base.robot
Library             Selenium2Library

*** Variables ***

${WRONG_USERNAME}                Tralalalalalaal
${WRONG_PASSWORD}                probajseulogovati
${ROLE_SYS_ADMIN}                System Administrator
${ROLE_ADMINISTRATOR}            Administrator
${ROLE_ESS_USER}                 ESS User
${ROLE_1ST_LVL_SUPERVISOR}       1st Level Supervisor
${BTN_DROPDOWN}=                 css=.dropdown-toggle
${LOGO}=                         id=ohrm-small-logo
${TOAST_MSG}=                    css=.toast-message


*** Keywords ***

Verify login
    element should be visible   ${LOGO}

Open Browser and login as System Administrator
    [Documentation]    Opens browser and logsin as System admin
    Open Browser to login page
    Login as a Different Role:  ${ROLE_SYS_ADMIN}

Open Browser and login as Administrator
    [Documentation]    Opens browser and logsin as Admin user
    Open Browser to login page
    Login as a Different Role:  ${ROLE_ADMINISTRATOR}

Open Browser and login as ESS User
    [Documentation]    Opens browser and logsin as ESS user
    Open Browser to login page
    Login as a Different Role:  ${ROLE_ESS_USER}

Open Browser and login as 1st level supervisor
    [Documentation]    Opens browser and logsin as 1st level supervisor
    Open Browser to login page
    Login as a Different Role:  ${ROLE_1ST_LVL_SUPERVISOR}

Login as a Different Role:
    [Documentation]  Clicks on "Login as a Different Role" and selects provided role
    [Arguments]  ${role}
    click element   id=loginAsButtonGroup
    click element   //*[@id='loginAsButtonGroup']//a[text()='${role}']



