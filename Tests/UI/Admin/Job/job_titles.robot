*** Settings ***

Library                         String
Library                         OperatingSystem

Resource                        ../../../../Keywords/UI/Admin/Job/job_titles.robot
Resource                        ../../../../Keywords/UI/adminmenu.robot

Force Tags                      Job     JobTitles

Suite Setup                     Open Browser to login page
Suite Teardown                  Close browser

*** Variables ***
${FILES_FOLDER}                 ${CURDIR}${/}..${/}..${/}..${/}..${/}Files
${FILE_JOB_DESCRIPTION}         ${FILES_FOLDER}${/}JobDescription.txt
${FILE_JOB_DESCRIPTION_1}       K:${/}workspace${/}QAAcademy2021${/}OrangeHRMAutomation${/}Files${/}JobDescription.txt

*** Test Cases ***

Add Job Titles
    [Tags]                      Add
    [Documentation]             Verify add Job Titles.
    [Setup]     run keywords    Login:
    ...         AND             Navigate to Job Titles
    ${JOB_TITLE}                generate random string
    Add Job Title:              ${JOB_TITLE}    Job description     ${FILE_JOB_DESCRIPTION}    Some note
    ${MSG}                      Get toast message
    should be equal             ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    [Teardown]                  Logout
