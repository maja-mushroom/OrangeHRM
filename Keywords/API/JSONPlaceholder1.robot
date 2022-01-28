*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections

*** Variables ***

${base_url}     https://jsonplaceholder.typicode.com

*** Keywords ***

Filter resources by key and value:
    [Arguments]      ${in_key}   ${in_value}
    ${key}=          set variable      ${in_key}
    ${value}=        set variable      ${in_value}
    ${response}=     Get Request       jsonplaceholder          /posts?${key}=${value}
    [Return]         ${response}