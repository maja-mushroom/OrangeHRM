*** Settings ***
Resource                          ../../../../Keywords/UI/Admin/Organization/structure.robot
Resource                          ../../../../Keywords/UI/adminmenu.robot
Resource                          ../../../../Keywords/UI/base.robot

Force Tags                        Structure

Suite Setup                       Open browser to login page
Suite Teardown                    Close browser

*** Test Cases ***
Verify drag and drop by offset new structure Manually
    [Tags]                        DragDropByOffsetNewStructureManualy
    [Documentation]               Verify drag and drop by offset function manually after create new structure on The Organization Structure page.
    [Setup]  run keywords         Login:
    ...     AND                   Navigate to Structure
    Add New Main Structure
    ${MSG}                        Get toast message
    should be equal               ${MSG}    ${MSG_SUCCESSFULLY_SAVED}
    D&D Main on top OrangeHRM
    Add New Structure in Main
    ${MSG}                        Get toast message
    should be equal               ${MSG}    ${MSG_SUCCESSFULLY_SAVED}
    Drag & Drop Items one in to other:  Lenovo        Hewlett Packard
    Drag & Drop Items one above other:  TOSHIBA       Lenovo
    Drag & Drop Items one above other:  IBM           TOSHIBA
    Drag & Drop Items one above other:  MSI           IBM
    Drag & Drop Items one above other:  COMPAQ        MSI
    Drag & Drop Items one under other:  COMPAQ        Hewlett Packard
    Drag & Drop Items one under other:  Lenovo        COMPAQ
    Drag & Drop Items one under other:  MSI           TOSHIBA
    Delete Main Structure
    ${MSG}                        Get toast message
    should be equal               ${MSG}    ${MSG_SUCCESSFULLY_DELETED}
    [Teardown]                    Logout

Verify drag and drop by offset new structure Randomly
    [Tags]                        DragDropByOffsetNewStructureRandomly
    [Documentation]               Verify drag and drop by offset function randomly after create new structure on The Organization Structure page.
    [Setup]  run keywords         Login:
    ...     AND                   Navigate to Structure
    Add New Main Structure
    ${MSG}                        Get toast message
    should be equal               ${MSG}    ${MSG_SUCCESSFULLY_SAVED}
    D&D Main on top OrangeHRM
    Add New Structure in Main
    ${MSG}                        Get toast message
    should be equal               ${MSG}    ${MSG_SUCCESSFULLY_SAVED}
    Drag & Drop by offset Items Randomly
    Delete Main Structure
    ${MSG}                        Get toast message
    should be equal               ${MSG}    ${MSG_SUCCESSFULLY_DELETED}
    [Teardown]                    Logout