*** Settings ***
Library    AppiumLibrary
Resource    ../Pages/util.robot

*** Variables ***
${discountedProductsLocator}     //android.widget.TextView[@text='İndirimli Ürünler']
${capacityLocator}              //android.widget.TextView[@text='Kapasite']
${filterBarTitleLocator}        id=com.pozitron.hepsiburada:id/tvFiltersToolbarTitle
${1TBCapacityLocator}           //android.widget.LinearLayout[@content-desc="1 TB"]/android.view.ViewGroup/android.widget.CheckBox
${confirmButtonLocator}         //android.widget.TextView[@text='Uygula']
${firstProductAddChart}         xpath=(//android.widget.Button[@content-desc="Sepete Ekle"])[1]
${productDetails}               com.pozitron.hepsiburada:id/lyt_variant_root
${addToChart}                   com.pozitron.hepsiburada:id/atcb_product_variant
${myBasketIcon}                 //android.widget.FrameLayout[contains(@content-desc,"new notification")]


*** Keywords ***
ValidateProductPage
    Wait Until Element Is Visible   ${discountedProductsLocator}

swipeRightUntilCapacitySeen
    WHILE     10
       Swipe    700  600  400  600
       ${status}    Run Keyword And Return Status    Wait Until Page Contains Element    ${capacityLocator}
       log    ${status}
       Run Keyword If    ${status}     Exit For Loop
    END

filterMemoryCapacity
    ClickElementWhenVisible    ${capacityLocator}
    Wait Until Element Is Visible    ${filterBarTitleLocator}
    ClickElementWhenVisible    ${1TBCapacityLocator}
    ${attribute}   Get Element Attribute    ${1TBCapacityLocator}  checked
    Should Contain        ${attribute}     true
    ClickElementWhenVisible    ${confirmButtonLocator}

addFirstProductToChart
    ClickElementWhenVisible          ${firstProductAddChart}
    Wait Until Element Is Visible    ${productDetails}
    ClickElementWhenVisible          ${addToChart}

verifyAndGoToMyChart
   Wait Until Element Is Visible     ${myBasketIcon}
    ClickElementWhenVisible         ${myBasketIcon}