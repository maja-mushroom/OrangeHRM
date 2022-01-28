*** Settings ***

Library                     ExtendedSelenium2Library

Resource                    ../../base.robot

*** Variables ***

${IN_TOPIC}                 id=news_topic
${IN_DESCRIPTION}           id=tinymce
${FRM_1}                    id=noncoreIframe
${FRM_2}                    id=news_description_ifr
${CB_ACKNOLEDGE}            id=news_acknowledge
${IN_PUBLISHED_DATE}        id=news_published_date
${CB_ALL_USER_ROLES}        id=news_publish_all
${IN_USER_ROLES}            id=news_publish_to
${IN_EMPLOYEE}              id=news_publish_emp
${CB_ALL_LOCATIONS}         news_publish_to_all_locations
${UNSELECT_CB_LOCATIONS}    xpath=//label[@for='news_publish_to_all_locations']
${IN_LOCATION}              id=news_location
${IN_EMPLOYMENT_STATUS}     id=news_publish_emp_status
${IN_JOB_TITLES}            id=news_publish_to_job_title
${IN_SUB_UNITS}             id=news_publish_to_sub_unit

*** Keywords ***

News add - general:
    [Documentation]         Adds news
    [Arguments]             ${TOPIC}    ${DESCRIPTION}=      ${CB_REQ_ACK}=
    select frame            ${FRM_1}
    wait until angular ready
    Click on Add button
    input text              ${IN_TOPIC}       ${TOPIC}
    select frame            ${FRM_2}
    run keyword unless      '${DESCRIPTION}'=='${EMPTY}'     input text        ${IN_DESCRIPTION}  ${DESCRIPTION}
    unselect frame
    select frame            ${FRM_1}
    run keyword unless      '${CB_REQ_ACK}'=='True'         select checkbox      ${CB_ACKNOLEDGE}
    ...        ELSE IF      '${CB_REQ_ACK}'='False'         checkbox should not be selected  ${CB_ACKNOLEDGE}
    Modal Next

Select date:
    [Arguments]             ${DAY}    ${MONTH}     ${YEAR}
    click element           ${IN_PUBLISHED_DATE}
    click element           //div[contains(@class,'picker__select--month')]
    click element           //*[contains(@class,'picker__select--month')]//span[text()='${MONTH}']
    click element           //div[contains(@class,'picker__select--year')]
    click element           //*[contains(@class,'picker__select--year')]//span[text()='${YEAR}']
    click element           //div[contains(@class,'picker__day')][text()='${DAY}']

Select from list:
    [Arguments]               ${ID}   @{LIST}
    FOR  ${element}  IN  @{LIST}
        double click element  ${ID}
        click element         //ul//*[text()='${element}']
    END

News - publish to all user roles:
    [Arguments]               ${CB}    @{USER_ROLES_LIST}
    run keyword if            '${CB}'=='True'    select checkbox      ${CB_ALL_USER_ROLES}
    ...    ELSE IF            '${CB}'=='False'   Select from list:    ${IN_USER_ROLES}   @{USER_ROLES_LIST}

Select employee:
    [Arguments]               @{LIST}
    FOR  ${element}  IN  @{LIST}
       input text             ${IN_EMPLOYEE}  ${element}
       click element          //*[text()='${element}']
    END

News - publish to all locations:
    [Arguments]               ${CB}    @{LOCATION_LIST}
    run keyword if            '${CB}'=='True'     Check checkbox:    ${CB_ALL_LOCATIONS}    True
    ...    ELSE IF            '${CB}'=='False'  run keywords
    ...    Check checkbox:     ${CB_ALL_LOCATIONS}   False
    ...    AND   Select from list:  ${IN_LOCATION}   @{LOCATION_LIST}

News - select employment status:
    [Arguments]               @{LIST}
    Select from list:         ${IN_EMPLOYMENT_STATUS}   @{LIST}

News - select job titles:
    [Arguments]               @{LIST}
    Select from list:         ${IN_JOB_TITLES}   @{LIST}

News - select sub units:
    [Arguments]               @{LIST}
    Select from list:         ${IN_SUB_UNITS}   @{LIST}

News add - publish:
    [Documentation]            Adds news
    [Arguments]
    wait until angular ready
    select checkbox            ${CB_ALL_USER_ROLES}
    Modal Publish