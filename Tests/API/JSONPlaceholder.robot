*** Settings ***

Resource        ../../Keywords/API/JSONPlaceholder.robot

Suite Setup     Create Session     jsonplaceholder     ${base_url}


*** Test Cases ***

Get resource+
    [Documentation]   Gets resource by post number. This Test Case is positive.
    ${response}=                      Post number:               1
    log to console                    ${response.text}
    should be equal as integers       ${response.status_code}    200
    ${json}=    set variable          ${response.json()}
    ${id}=   get value from json      ${json}                    $..id
    should be equal as strings        ${id[0]}                   1
    ${userId}=   get value from json  ${json}                    $..userId
    should be equal as strings        ${userId[0]}               1
    ${title}=   get value from json   ${json}                    $..title
    should be equal as strings        ${title[0]}                sunt aut facere repellat provident occaecati excepturi optio reprehenderit
    log to console                    ${title[0]}

Get resource-
    [Documentation]   Gets resource by post number. This Test Case is negative. We used unexpected value.
    ${response}=                      Post number:               aaa
    log to console                    ${response.text}
    should be equal as integers       ${response.status_code}    404
    ${json}=    set variable          ${response.json()}
    ${body}=   get value from json    ${json}                    $..body
    should be equal as strings        ${body}                    []

List all resources+
    [Documentation]  Lists all resources and isolates one with requested keys and values of that keys. This Test Case is positive.
    ${response}=     get request        jsonplaceholder            /posts
    should be equal as integers         ${response.status_code}    200
    ${json}=      set variable          ${response.json()}
    ${id}=   get value from json        ${json}                    $..id
    list should not contain value       ${id}                      0   101
    ${userId}=   get value from json    ${json}                    $..userId
    list should not contain value       ${userId}                  0   11
    ${count}=  get slice from list      ${userId}[0:10]
    should be equal as strings          ${count[0]}                1
    ${search_criteria}=                 create dictionary          id=2    userId=1
    ${dict}=    Get dictionary from JSON:                          ${json}    ${search_criteria}
    ${title}=   get from dictionary                                ${dict}    title
    should be equal                                                ${title}   qui est esse

List all resources-
    [Documentation]  Test fails. "No dictionary with expected values is found!" message is logged to console.
    ${response}=     get request        jsonplaceholder            /posts
    should be equal as integers         ${response.status_code}    200
    log to console                      ${response.status_code}
    ${json}=      set variable          ${response.json()}
    ${search_criteria}=                 create dictionary          id=amra    userId=1
    Get dictionary from JSON:           ${json}    ${search_criteria}

Create resource+
    [Documentation]  Creates new resource. This is poitive Test Case.
    ${response}=     Inputs for resource creation:    foo     bar     1
    log to console   ${response.status_code}
    log to console   ${response.content}
    ${status_code}=  convert to string                ${response.status_code}
    should be equal  ${status_code}                   201
    ${res_body}=     convert to string                ${response.content}
    should contain   ${res_body}                      "id": 101

Create resource-
    [Documentation]  Haven't succeeded making negative test case because every input combo is accepted (numbers, letters, symbol, empty input).
    ${response}=     Inputs for resource creation:  _   _   _
    log to console   ${response.status_code}
    log to console   ${response.content}
    ${status_code}=  convert to string              ${response.status_code}
    should be equal  ${status_code}                 201
    ${res_body}=     convert to string              ${response.content}
    should contain   ${res_body}                    "id": 101