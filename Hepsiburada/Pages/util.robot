*** Settings ***
Library    AppiumLibrary

*** Variables ***
${localhost}        http://localhost:4723/wd/hub
${platformName}     Android
${deviceName}       ae76b6d8
${appPackage}       com.pozitron.hepsiburada
${appActivity}      com.hepsiburada.ui.startup.SplashActivity
${automationName}   Uiautomator2

*** Keywords ***
OpenTestApplication
    Open Application  ${localhost}  platformName=${platformName}  deviceName=${deviceName}  appPackage=${appPackage}
    ...  appActivity=${appActivity}  automationName=${automationName}   noReset=true    autoAcceptAlerts=true  app=${CURDIR}/../DemoApp/hepsiburada-5-15-0.apk

ClickElementWhenVisible
    [Arguments]     ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element   ${locator}