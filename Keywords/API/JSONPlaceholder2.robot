*** Settings ***

Library         RequestsLibrary
Library         JSONLibrary
Library         Collections

Suite Setup     Create Session     jsonplaceholder     ${base_url}

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
    [Arguments]      ${in_req1}    ${in_req1_id}=  ${in_req2}=
    ${req1} =        set variable    ${in_req1}
    ${req1_id}=      set variable    ${in_req1_id}
    ${req2}=         set variable    ${in_req2}
    ${response}=     get request     jsonplaceholder     /${req1}/${req1_id}/${req2}
    [Return]         ${response}

Select posts by users id:
    [Arguments]      ${in_userId}
    ${userId}=       set variable    ${in_userId}
    ${response}=     get request     jsonplaceholder     /users/${userId}/posts
    [Return]         ${response}

Select comments by posts id:
    [Arguments]      ${in_postId}
    ${postId}=       set variable     ${in_postId}
    ${response}=     get request      jsonplaceholder     /posts/${postId}/comments
    [Return]         ${response}

Select photos by albums id:
    [Arguments]       ${in_albumId}
    ${albumId}=       set variable     ${in_albumId}
    ${response}=      get request      jsonplaceholder     /albums/${albumId}/photos
    [Return]          ${response}

Select albums by users id:
    [Arguments]       ${in_usersId}
    ${usersId}=       set variable     ${in_usersId}
    ${response}=      get request      jsonplaceholder     /users/${usersId}/albums
    [Return]          ${response}

Select todos by users id:
    [Arguments]       ${in_usersId}
    ${usersId}=       set variable     ${in_usersId}
    ${response}=      get request      jsonplaceholder     /users/${usersId}/todos
    [Return]          ${response}