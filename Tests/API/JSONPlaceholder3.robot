*** Settings ***

Resource            ../../Keywords/API/JSONPlaceholder3.robot

Suite Setup         Create Session     jsonplaceholder     ${base_url}

*** Test Cases ***

Select photos by album Id+
    [Documentation]  Selects photos by albums id and verifies selected photo by its title, url and thumbnailUrl. This is positive test case.
    ${response}=     Select request:                                photos     album    13
    ${json}=         set variable         ${response.json()}
    should be equal as integers           ${response.status_code}   200
    ${search_criteria}=                   create dictionary         id=603
    ${dict}=         Get dictionary from JSON:                      ${json}    ${search_criteria}
    ${key}=          get from dictionary  ${dict}                   title
    should be equal as strings            ${key}                    officiis dolorum itaque sequi consequatur qui rerum soluta odit
    ${key*}=         get from dictionary  ${dict}                   url
    should be equal as strings            ${key*}                   https://via.placeholder.com/600/7b37f9
    ${key**}=        get from dictionary  ${dict}                   thumbnailUrl
    should be equal as strings            ${key**}                  https://via.placeholder.com/150/7b37f9

Select photos by album Id-
    [Documentation]  This is negtive test case. Inadequate photo id is selected. Status code is 200(OK) even though we have bad request. "No dictionary with expected values is found!" error message is logged to console.
    ${response}=     Select request:                                photos     album    13
    ${json}=         set variable         ${response.json()}
    should be equal as integers           ${response.status_code}   200
    ${search_criteria}=                   create dictionary         id=9
    ${dict}=         Get dictionary from JSON:                      ${json}    ${search_criteria}
    ${key}=          get from dictionary  ${dict}                   title
    should be equal as strings            ${key}                    officiis dolorum itaque sequi consequatur qui rerum soluta odit
    ${key*}=         get from dictionary  ${dict}                   url
    should be equal as strings            ${key*}                   https://via.placeholder.com/600/7b37f9
    ${key**}=        get from dictionary  ${dict}                   thumbnailUrl
    should be equal as strings            ${key**}                  https://via.placeholder.com/150/7b37f9

Update request+
    [Documentation]  Updates resource. This is poitive Test Case.
    ${response}=     Put request:                     posts   96    foo     bar     4
    log to console   ${response.status_code}
    log to console   ${response.content}
    ${status_code}=  convert to string                ${response.status_code}
    should be equal  ${status_code}                   200

Update request-
    [Documentation]  Updates resource. This is negative Test Case.
    ${response}=     Put request:                     ----  ----    ---     ----     -----
    ${status_code}=  convert to string                ${response.status_code}
    should be equal  ${status_code}                   404
    should be equal  ${response.content}              {}

Patch-Update request+
    [Documentation]  Updates resource. This is poitive Test Case.
    ${response}=     Patch request:    posts   96    title=lkasjlajl
    log to console   ${response.content}
    ${status_code}=  convert to string                ${response.status_code}
    should be equal  ${status_code}                   200

Patch-Update request-
    [Documentation]  Updates resource. This is poitive Test Case.
    ${response}=     Patch request:    posts   ggg    title=lkasjlajl
    log to console   ${response.content}
    ${status_code}=  convert to string                ${response.status_code}
    should be equal  ${status_code}                   200

Delete request+
    [Documentation]  Deletes resource. This is poitive Test Case.
    ${response}=     Delete request:    posts   96
    log to console   ${response.content}
    ${status_code}=  convert to string                ${response.status_code}
    should be equal  ${status_code}                   200
    should be equal  ${response.content}              {}

Delete request-
    [Documentation]  Deletes resource. This is poitive Test Case.
    ${response}=     Delete request:    posts   kanskask
    log to console   ${response.content}
    ${status_code}=  convert to string                ${response.status_code}
    should be equal  ${status_code}                   200
    should be equal  ${response.content}              {}