*** Settings ***
Library    AppiumLibrary
Resource    ../Pages/util.robot

*** Variables ***
${hepsiburadaIconLocator}     id=com.pozitron.hepsiburada:id/image_message_of_day
${searchBoxLocator}           id=com.pozitron.hepsiburada:id/etSearchBox
${firstResearchSuggestionLocator}  xpath=(//android.view.ViewGroup[@resource-id='com.pozitron.hepsiburada:id/search_suggestion'])[2]


*** Keywords ***
ValidateMainPage
    Wait Until Element Is Visible   ${hepsiburadaIconLocator}

searchYourProduct
    ClickElementWhenVisible    ${searchBoxLocator}
    Input Text    ${searchBoxLocator}   iphone 14

chooseFirstMatching
    ClickElementWhenVisible    ${firstResearchSuggestionLocator}
