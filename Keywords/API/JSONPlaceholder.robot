*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections

*** Variables ***

${base_url}     https://jsonplaceholder.typicode.com

*** Keywords ***

Get dictionary from JSON:
    [Arguments]  ${json}    @{key_value_dic}
    log to console  @{key_value_dic}
    FOR     ${dictionary}   IN    @{json}
        ${match}=   Match dictionary:  ${dictionary}    @{key_value_dic}
        return from keyword if  ${match}    ${dictionary}
    END
    Fail   No dictionary with expected values is found!

Match dictionary:
    [Arguments]    ${dictionary}    @{key_value_dic}
     @{keys}=    get dictionary keys  @{key_value_dic}
     FOR  ${key}  IN  @{keys}
        ${tmp}=     get from dictionary  ${dictionary}  ${key}
        ${value}=   get from dictionary  @{key_value_dic}  ${key}
        run keyword if  "${tmp}" != "${value}"  return from keyword  False
     END
     [Return]  True

Post number:
    [Arguments]      ${posts_no}
    ${response}=     get request      jsonplaceholder            /posts/${posts_no}
    [Return]         ${response}

Inputs for resource creation:
    [Arguments]      ${title}=    ${body1}=   ${userId}=
    ${body}=         create dictionary       title=${title}    body=${body1}   userId=${userId}
    ${header}=       create dictionary       Content-Type=application/json; charset=utf-8
    ${response}=     post request            jsonplaceholder  /posts  data=${body}   headers=${header}
    [Return]         ${response}
