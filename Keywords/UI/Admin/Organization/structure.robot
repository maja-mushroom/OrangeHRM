*** Settings ***
Library                     ExtendedSelenium2Library
Library                     String
Library                     Collections

*** Variables ***
${BTN_EDIT}                 css=.edit-btn
${SELECT_ORANGE_HRM}        id=1_anchor
${LNK_MENU}                 //*[@id="1_anchor"]/span[@class="menu"]
${BTN_ADD}                  //a[text()="Add"]
${BTN_DELETE}               //a[text()="Delete"]
${BTN_CONFIRM_DELETE}       //*[contains(@class, "primary-btn") and text()="Yes, Delete"]
${IN_UNIT_ID}               id=unit_id
${IN_NAME}                  id=name
${IN_HEAD_OF_UNIT}          id=selectedEmployee_value
${SELECT_INPUT}             css=.match
${IN_DESCRIPTION}           id=description
${BTN_SAVE}                 //*[@class="modal-footer"]/a[text()="Save"]
${IN_COST_CENTER}           id=costCentre_value
${SELECT_MAIN_STRUCTURE}    //span[contains(text(),"Main")]/../parent::a
${LNK_MENU_MAIN}            //span[contains(text(),"Main")]/../../span[@class="menu"]
@{LIST_NAME}                Hewlett Packard  Lenovo  IBM  MSI  COMPAQ  TOSHIBA

*** Keywords ***
Add New Main Structure
    [Documentation]         Adds a new Main structure to the Organization Structure page.
    click element           ${BTN_EDIT}
    click element           ${SELECT_ORANGE_HRM}
    click element           ${LNK_MENU}
    click element           ${BTN_ADD}
    input text              ${IN_UNIT_ID}                   007
    input text              ${IN_NAME}                      Main Structure
    input text              ${IN_HEAD_OF_UNIT}              Aliyah Haq
    click element           ${SELECT_INPUT}
    input text              ${IN_COST_CENTER}               0006
    click element           ${SELECT_INPUT}
    input text              ${IN_DESCRIPTION}               This is main structure
    click element           ${BTN_SAVE}

Add New Structure in Main
    [Documentation]         Adds a new structure to the Main Structure page.
    set test variable       @{head_list}   Aliyah Ha  Cassidy Hop  David Morri  Fiona Grac  Garry Whit  Joe Roo
    set test variable       @{cost_list}   0006  0005  0003  0007  0008  00010  0009  0002  0004
    FOR   ${name}    IN     @{List_name}
        click element       ${SELECT_MAIN_STRUCTURE}
        click element       ${LNK_MENU_MAIN}
        click element       ${BTN_ADD}
        ${UNIT_ID}          generate random string  4   [NUMBERS]
        input text          ${IN_UNIT_ID}               ${UNIT_ID}
        input text          ${IN_NAME}                  ${name}
        ${HEAD}             evaluate      random.choice(@{head_list})
        input text          ${IN_HEAD_OF_UNIT}          ${HEAD}
        click element       ${SELECT_INPUT}
        ${COST_CENTER}      evaluate      random.choice(@{cost_list})
        input text          ${IN_COST_CENTER}           ${COST_CENTER}
        click element       ${SELECT_INPUT}
        ${DESCRIPTION}      generate random string  20  [LOWER]
        input text          ${IN_DESCRIPTION}           ${DESCRIPTION}
        click element       ${BTN_SAVE}
    END

Drag & Drop by offset Items Randomly
    [Documentation]         Drag and drop by offset elements randomly using Name of added structure.
    FOR                     ${i}   IN RANGE    1  6
    ${source_item}           evaluate    random.choice(@{list_name})
    remove values from list           ${list_name}    ${source_item}
    ${target_item}           evaluate    random.choice(@{list_name})
    set test variable       @{list_method_dd_by_offset}   Drag & Drop Items one in to other:
    ...                     Drag & Drop Items one above other:  Drag & Drop Items one under other:
    ${method}               evaluate    random.choice(@{list_method_dd_by_offset})
    run keyword if         '${method}'=='Drag & Drop Items one in to other:'
    ...                     run keyword  Drag & Drop Items one in to other:   ${source_item}   ${target_item}
    ...    ELSE IF         '${method}'=='Drag & Drop Items one above other:'
    ...                     run keyword   Drag & Drop Items one above other:  ${source_item}   ${target_item}
    ...    ELSE IF         '${method}'=='Drag & Drop Items one under other:'
    ...                     run keyword   Drag & Drop Items one under other:  ${source_item}   ${target_item}
    ...    ELSE             no operation
    END

Drag & Drop Items one in to other:
    [Documentation]         Drag and drop by offset items one in to other using name of the structure.
    [Arguments]             ${source_item}   ${target_item}
    ${SOURCE_POSITION}      get vertical position      //*[contains(text(),"${source_item}")]/../parent::a
    ${TARGET_POSITION}      get vertical position      //*[contains(text(),"${target_item}")]/../parent::a
    ${UP_OR_DOWN_PX}        evaluate  ${TARGET_POSITION} - ${SOURCE_POSITION}
    drag and drop by offset   //span[contains(text(),"${source_item}")]/../parent::a   0  ${UP_OR_DOWN_PX}
    sleep                   3s

Drag & Drop Items one above other:
    [Documentation]         Drag and drop by offset items one above other using name of the structure.
    [Arguments]             ${source_item}   ${target_item}
    ${SOURCE_POSITION}      get vertical position      //*[contains(text(),"${source_item}")]/../parent::a
    ${TARGET_POSITION}      get vertical position      //*[contains(text(),"${target_item}")]/../parent::a
    ${width}  ${height}     get element size           //*[contains(text(),"${target_item}")]/../parent::a
    ${field_1/3}            evaluate   ${height}/3
    ${UP_OR_DOWN_PX}        evaluate  (${TARGET_POSITION} - ${SOURCE_POSITION})-${field_1/3}
    drag and drop by offset   //span[contains(text(),"${source_item}")]/../parent::a   0   ${UP_OR_DOWN_PX}
    sleep                   3s

Drag & Drop Items one under other:
    [Documentation]         Drag and drop by offset one under other using name of the structure.
    [Arguments]             ${source_item}   ${target_item}
    ${SOURCE_POSITION}      get vertical position      //*[contains(text(),"${source_item}")]/../parent::a
    ${TARGET_POSITION}      get vertical position      //*[contains(text(),"${target_item}")]/../parent::a
    ${width}  ${height}     get element size           //*[contains(text(),"${target_item}")]/../parent::a
    ${field_1/3}            evaluate   ${height}/3
    ${UP_OR_DOWN_PX}        evaluate  (${TARGET_POSITION} - ${SOURCE_POSITION})+${field_1/3}
    drag and drop by offset   //span[contains(text(),"${source_item}")]/../parent::a   0   ${UP_OR_DOWN_PX}
    sleep                   3s

D&D Main on top OrangeHRM
    [Documentation]         Drag nad Drop Main structure on top page under OrangeHRM structure
    drag and drop           //span[contains(text(),"Main")]/../parent::a
    ...                     //span[contains(text(),"OrangeHRM")]/../parent::a

Delete Main Structure
    [Documentation]         Delete added main structure.
    click element           ${SELECT_MAIN_STRUCTURE}
    click element           ${LNK_MENU_MAIN}
    click element           ${BTN_DELETE}
    click element           ${BTN_CONFIRM_DELETE}
