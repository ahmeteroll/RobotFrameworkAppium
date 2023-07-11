*** Settings ***
Library    AppiumLibrary
Resource    ../Pages/util.robot

*** Variables ***
${myChartHeaderLocator}         xpath=(//android.widget.TextView[@text='Sepetim'])[1]
${trashIconLocator}               ${myChartHeaderLocator}/following-sibling::android.view.View
${deleteAllButtonLocator}         //android.widget.Button[@text='Tümünü sil']
${emptyChartHeaderLocator}         //android.widget.TextView[@text='Sepetin şu an boş']

*** Keywords ***
validateMyChartPage
    Sleep    5
    Wait Until Element Is Visible   ${myChartHeaderLocator}     15

removeProductsInMyChart
    ClickElementWhenVisible    ${trashIconLocator}
    Sleep    2
    ClickElementWhenVisible    ${deleteAllButtonLocator}

verifyEmptyMyChart
    Wait Until Element Is Visible   ${emptyChartHeaderLocator}  15