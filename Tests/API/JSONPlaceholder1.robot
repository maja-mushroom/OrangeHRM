*** Settings ***

Resource        ../../Keywords/API/JSONPlaceholder1.robot

Suite Setup     Create Session     jsonplaceholder     ${base_url}


*** Test Cases ***

Filter resources+
    [Documentation]     Filters resources. This test case is positive.
    ${response}=    Filter resources by key and value:            id      14
    log to console                     ${response.text}
    should be equal as integers        ${response.status_code}    200
    ${json}=    set variable           ${response.json()}
    ${title}=   get value from json    ${json}                    $..title
    should be equal as strings         ${title[0]}                voluptatem eligendi optio
    ${body}=   get value from json     ${json}                    $..body
    should be equal as strings         ${body[0]}                 fuga et accusamus dolorum perferendis illo voluptas\nnon doloremque neque facere\nad qui dolorum molestiae beatae\nsed aut voluptas totam sit illum

Filter resources-
    [Documentation]     Filters resources. This test case is negative. We don't get status code that indicates bad request. Instead of that we get empty body.
    ${response}=    Filter resources by key and value:            id     amra
    should be equal as integers        ${response.status_code}    200
    log to console                     ${response.text}
    ${json}=    set variable           ${response.json()}
    ${body}=   get value from json     ${json}                    $..body
    should be equal as strings         ${body}                    []

