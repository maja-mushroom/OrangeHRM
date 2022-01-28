*** Settings ***

Library         RequestsLibrary
Library         JSONLibrary
Library         Collections

*** Variables ***

${base_url}     https://jsonplaceholder.typicode.com

*** Keywords ***

Get dictionary from JSON:
    [Arguments]  ${json}    @{key_value_dic}
    FOR     ${dictionary}   IN    @{json}
        ${match}=   Match disctionary:  ${dictionary}    @{key_value_dic}
        return from keyword if  ${match}    ${dictionary}
    END
    Fail   No dictionary with expected values is found!

Match disctionary:
    [Arguments]    ${dictionary}    @{key_value_dic}
     @{keys}=    get dictionary keys  @{key_value_dic}
     FOR  ${key}  IN  @{keys}
        ${tmp}=     get from dictionary  ${dictionary}  ${key}
        ${value}=   get from dictionary  @{key_value_dic}  ${key}
        run keyword if  "${tmp}" != "${value}"  return from keyword  False
     END
     [Return]  True

Select request:
    [Documentation]  Selects required request.
    [Arguments]      ${in_req1}    ${in_req2}=    ${in_req1_id}=
    ${req1} =        set variable    ${in_req1}
    ${req1_id}=      set variable    ${in_req1_id}
    ${req2}=         set variable    ${in_req2}
    ${response}=     get request     jsonplaceholder     /${in_req1}?${in_req2}Id=${in_req1_id}
    [Return]         ${response}

Put request:
    [Documentation]  Updates required request.
    [Arguments]      ${in_req1}      ${in_req1_id}    ${title}=    ${body}=   ${userId}=
    ${body1}=        create dictionary      id=${in_req1_id}    title=${title}    body=${body}   userId=${userId}
    ${header}=       create dictionary      Content-Type=application/json; charset=utf-8
    ${response}=     put request            jsonplaceholder  /${in_req1}/${in_req1_id}  data=${body1}   headers=${header}
    [Return]         ${response}

Patch request:
    [Documentation]  Updates required request.
    [Arguments]      ${in_req1}      ${in_req1_id}    ${title}=    ${body}=   ${userId}=
    ${body1}=        create dictionary      id=${in_req1_id}    title=${title}    body=${body}   userId=${userId}
    ${header}=       create dictionary      Content-Type=application/json; charset=utf-8
    ${response}=     patch request            jsonplaceholder  /${in_req1}/${in_req1_id}  data=${body1}   headers=${header}
    [Return]         ${response}

Delete request:
    [Documentation]  Deletes required request.
    [Arguments]      ${in_req1}      ${in_req1_id}
    ${response}=     delete request            jsonplaceholder    /${in_req1}/${in_req1_id}
    [Return]         ${response}