*** Settings ***
Documentation  End to End
Library  AppiumLibrary
Resource    ../Pages/util.robot
Resource    ../Pages/mainPage.robot
Resource    ../Pages/productPage.robot
Resource    ../Pages/myChartPage.robot

*** Test Cases ***
Purchase Iphone 14
    OpenTestApplication
    ValidateMainPage
    SearchYourProduct
    ChooseFirstMatching
    ValidateProductPage
    SwipeRightUntilCapacitySeen
    FilterMemoryCapacity
    AddFirstProductToChart
    VerifyAndGoToMyChart
    ValidateMyChartPage
    RemoveProductsInMyChart
    VerifyEmptyMyChart

