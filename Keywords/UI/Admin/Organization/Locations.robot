*** Settings ***
Library                     ExtendedSelenium2Library
Library                     String
Resource                    ../../base.robot


*** Variables ***
${DD_COUNTRY}               id=countryCode_inputfileddiv
${DD_TIME_ZONE}             id=time_zone_inputfileddiv
${IN_PROVINCE}              id=province
${IN_CITY}                  id=city
${IN_ZIP_CODE}              id=zipCode
${IN_PHONE}                 id=phone
${IN_FAX}                   id=fax
${CHB_EEO_ENABLED}          id=eeo_applicable
${IN_ADDRESS}               id=address
${IN_NOTES}                 id=notes

*** Keywords ***
Add new Location:
    [Documentation]         Adds new Location.
    [Arguments]             ${name}   ${country}   ${time_zone}   ${province}   ${city}   ${zip_code}   ${phone}   ${fax}   ${eeo_enabled}   ${address}   ${notes}
    Click on Add button
    input text              ${IN_NAME}       ${name}
    click element           ${DD_COUNTRY}
    click element           //*[@id="countryCode_inputfileddiv"]//span[text()="${country}"]
    click element           ${DD_TIME_ZONE}
    click element           //*[@id="time_zone_inputfileddiv"]//span[text()="${time_zone}"]
    input text              ${IN_PROVINCE}   ${province}
    input text              ${IN_CITY}       ${city}
    input text              ${IN_ZIP_CODE}   ${zip_code}
    input text              ${IN_PHONE}      ${phone}
    input text              ${IN_FAX}        ${fax}
    run keyword if          '${eeo_enabled}'=='true'       select checkbox                    ${CHB_EEO_ENABLED}
    ...    ELSE IF          '${eeo_enabled}'=='false'      checkbox should not be selected    ${CHB_EEO_ENABLED}
    input text              ${IN_ADDRESS}    ${address}
    input text              ${IN_NOTES}      ${notes}
    modal save