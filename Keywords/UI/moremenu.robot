*** Settings ***

Library                      ExtendedSelenium2Library

*** Variables ***

${DD_MORE}                   id=menu_news_More
${DD_ASSETS}                 id=menu_asset_viewUserAssetList
${LNK_BRANDS}                id=menu_asset_viewBrands
${LNK_VENDORS}               id=menu_asset_viewVendorList
${LNK_VIEW_ASSETS}           id=menu_asset_viewAssets

*** Keywords ***

Navigate to in More:
      [Documentation]         Navigates through the More menu
      [Arguments]             @{MENU_LIST}
      FOR    ${element}   IN  @{MENU_LIST}
      click element           ${element}
      END
      wait until angular ready

Navigate to Brands
      [Documentation]          Navigate to Brands in More menu
      Navigate to in More:             ${DD_ASSETS}  ${LNK_BRANDS}

Navigate to Vendors
      [Documentation]          Navigate to Vendors in More menu
      Navigate to in More:             ${DD_ASSETS}  ${LNK_VENDORS}

Navigate to ViewAssets
      [Documentation]          Navigate to ViewAssets in More menu
      Navigate to in More:             ${DD_ASSETS}  ${LNK_VIEW_ASSETS}