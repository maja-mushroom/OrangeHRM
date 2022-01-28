*** Settings ***
Resource                    ../../../../Keywords/UI/Admin/Organization/Locations.robot
Resource                    ../../../../Keywords/UI/adminmenu.robot
Resource                    ../../../../Keywords/UI/Helpers/table.robot

Force Tags                  Locations

Suite Setup                 Open Browser to login page
Suite Teardown              Close browser

*** Variables ***
@{COUNTRY_LIST}             Albania  Algeria  Austria  Botswana  Canada  Chad  Estonia  Greece  Haiti  Ireland   Kuwait   Maldives  Niger
@{TIME_ZONE_LIST}           Europe/Sarajevo  Africa/Abidjan  Asia/Almaty   Europe/Chisinau  Pacific/Kosrae  Pacific/Tarawa  Atlantic/Reykjavik
@{EEO_LIST}                 true   false

*** Test Cases ***
Add Location - all fields
    [Tags]                  AddLocation
    [Documentation]         Login, goes to Location page and adds new location.
    [Setup]  run keywords   Login:
    ...           AND       Navigate to Locations
    ${NAME}                 generate random string    8    [UPPER]
    ${COUNTRY}              evaluate   random.choice(@{COUNTRY_LIST})
    ${TIME_ZONE}            evaluate   random.choice(@{TIME_ZONE_LIST})
    ${STATE}                generate random string    8    [UPPER]
    ${CITY}                 generate random string    8    [UPPER]
    ${ZIP_CODE}             generate random string    7    [NUMBERS]
    ${PHONE/FAX}            generate random string    11   [NUMBERS]
    ${EEO}                  evaluate   random.choice(@{EEO_LIST})
    ${ADDRESS}              generate random string    10   [LOWER]
    ${NOTE}                 generate random string    100  [LOWER]
    Add new Location:       ${NAME}   ${COUNTRY}   ${TIME_ZONE}   ${STATE}   ${CITY}   ${ZIP_CODE}   ${PHONE/FAX}   ${PHONE/FAX}   ${EEO}   ${ADDRESS}   ${NOTE}
    ${MSG}                  Get toast message
    should be equal         ${MSG}     ${MSG_SUCCESSFULLY_SAVED}
    Is item in the table:   ${NAME}
    [Teardown]              Logout