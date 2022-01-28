*** Settings ***

Resource        ../../Keywords/API/JSONPlaceholder2.robot

Suite Setup     Create Session     jsonplaceholder     ${base_url}


*** Test Cases ***

Select requred users post+
    [Documentation]  Selects posts by users id and verifies selected posts by its title. This is positive test case.
    ${response}=     Select request:                                users      3     posts
    ${json}=         set variable         ${response.json()}
    should be equal as integers           ${response.status_code}   200
    ${search_criteria}=                   create dictionary         id=21
    ${dict}=         Get dictionary from JSON:                      ${json}    ${search_criteria}
    ${key}=          get from dictionary  ${dict}                   title
    should be equal as strings            ${key}                    asperiores ea ipsam voluptatibus modi minima quia sint

Select requred users post-
    [Documentation]  This is negtive test case. Inadequate post id is selected. Status code is 200(OK) even though we have bad request. "No dictionary with expected values is found!" error message is logged to console.
    ${response}=     Select request:                                users      3     posts
    ${json}=         set variable         ${response.json()}
    should be equal as integers           ${response.status_code}   200
    ${search_criteria}=                   create dictionary         id=55
    ${dict}=         Get dictionary from JSON:                      ${json}    ${search_criteria}
    ${key}=          get from dictionary  ${dict}                   title
    should be equal as strings            ${key}                    asperiores ea ipsam voluptatibus modi minima quia sint

Select requred posts comments+
    [Documentation]  Selects comments by posts id and verifies selected comment by its name and email. This is positive test case.
    ${response}=     Select request:                                posts      8    comments
    ${json}=         set variable         ${response.json()}
    should be equal as integers           ${response.status_code}   200
    ${search_criteria}=                   create dictionary         id=38
    ${dict}=         Get dictionary from JSON:                      ${json}    ${search_criteria}
    ${key}=          get from dictionary  ${dict}                   name
    should be equal as strings            ${key}                    maiores dolores expedita
    ${key*}=         get from dictionary  ${dict}                   email
    should be equal as strings            ${key*}                   Piper@linwood.us

Select requred posts comments-
    [Documentation]  This is negtive test case. Inadequate comment id is selected. Status code is 200(OK) even though we have bad request. "No dictionary with expected values is found!" error message is logged to console.
    ${response}=     Select request:                                posts      8    comments
    ${json}=         set variable         ${response.json()}
    should be equal as integers           ${response.status_code}   200
    ${search_criteria}=                   create dictionary         id=aaa
    ${dict}=         Get dictionary from JSON:                      ${json}    ${search_criteria}
    ${key}=          get from dictionary  ${dict}                   name
    should be equal as strings            ${key}                    maiores dolores expedita
    ${key*}=         get from dictionary  ${dict}                   email
    should be equal as strings            ${key*}                   Piper@linwood.us

Select requred albums photos+
    [Documentation]  Selects photos by albums id and verifies selected photo by its title, url and thumbnailUrl. This is positive test case.
    ${response}=     Select request:                                albums      13    photos
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

Select requred albums photos-
    [Documentation]  This is negtive test case. Inadequate photo id is selected. Status code is 200(OK) even though we have bad request. "No dictionary with expected values is found!" error message is logged to console.
    ${response}=     Select request:                                albums      13    photos
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

Select requred users albums+
    [Documentation]  Selects albums by users id and verifies selected album by its title. This is positive test case.
    ${response}=     Select request:                                users      8     albums
    ${json}=         set variable         ${response.json()}
    should be equal as integers           ${response.status_code}   200
    ${search_criteria}=                   create dictionary         id=77
    ${dict}=         Get dictionary from JSON:                      ${json}    ${search_criteria}
    ${key}=          get from dictionary  ${dict}                   title
    should be equal as strings            ${key}                    cupiditate sapiente maiores iusto ducimus cum excepturi veritatis quia

Select requred users albums-
    [Documentation]  This is negtive test case. Inadequate album id is selected. Status code is 200(OK) even though we have bad request. "No dictionary with expected values is found!" error message is logged to console.
    ${response}=     Select request:                                users      8     albums
    ${json}=         set variable         ${response.json()}
    should be equal as integers           ${response.status_code}   200
    ${search_criteria}=                   create dictionary         id=33
    ${dict}=         Get dictionary from JSON:                      ${json}    ${search_criteria}
    ${key}=          get from dictionary  ${dict}                   title
    should be equal as strings            ${key}                    cupiditate sapiente maiores iusto ducimus cum excepturi veritatis quia

Select requred users todos+
    [Documentation]  Selects todos by users id and verifies selected todo by its title and "completed" status. This is positive test case.
    ${response}=     Select request:                                users      10     todos
    ${json}=         set variable         ${response.json()}
    should be equal as integers           ${response.status_code}   200
    ${search_criteria}=                   create dictionary         id=187
    ${dict}=         Get dictionary from JSON:                      ${json}    ${search_criteria}
    ${key}=          get from dictionary  ${dict}                   title
    should be equal as strings            ${key}                    consequuntur animi possimus
    ${key*}=         get from dictionary  ${dict}                   completed
    should be equal as strings            ${key*}                   False

Select requred users todos-
    [Documentation]  This is negtive test case. nonexistent verification key is selected. Status code is 200(OK) even though we have bad request. "Dictionary does not contain key 'email'" error message is logged to console.
    ${response}=     Select request:                                users      10     todos
    ${json}=         set variable         ${response.json()}
    should be equal as integers           ${response.status_code}   200
    ${search_criteria}=                   create dictionary         id=187
    ${dict}=         Get dictionary from JSON:                      ${json}    ${search_criteria}
    ${key}=          get from dictionary  ${dict}                   email
    should be equal as strings            ${key}                    consequuntur animi possimus
    ${key*}=         get from dictionary  ${dict}                   completed
    should be equal as strings            ${key*}                   False