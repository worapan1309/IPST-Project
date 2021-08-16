*** Settings ***
Library     SeleniumLibrary
Variables   ../TestData/environment.yaml
Variables   ../TestData/data.yaml
Resource    ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}common_keywords.robot
Resource    ../Resources/Keywords/Pages/Common.resource
Resource    ../Resources/Keywords/Pages/Login_IPST.resource
Resource    ../Resources/Locator/Pages/Login_IPST.resource

Test Setup      Open Browser   ${URL_IPST}    chrome
Test Teardown   Close Browser

*** Test Cases ***
Login Should Be Success
    Wait And Click Element   ${LOGIN_IPST.LOGIN.BTN}
    Wait And Click Element   ${LOGIN_IPST.EMAIL.BTN}
    Wait And Fill Text      ${LOGIN_IPST.EMAIL.FIELD}   ${LOGIN_EMAIL}
    Wait And Fill Text      ${LOGIN_IPST.PASSWORD.FIELD}   ${LOGIN_PASSWORD}
    Wait And Click Element   ${LOGIN_IPST.CONFIRMLOGIN.BTN}

Filled With Wrong Password
    Wait And Click Element   ${LOGIN_IPST.LOGIN.BTN}
    Wait And Click Element   ${LOGIN_IPST.EMAIL.BTN}
    Wait And Fill Text      ${LOGIN_IPST.EMAIL.FIELD}   ${LOGIN_EMAIL}
    Wait And Click Element   ${LOGIN_IPST.CONFIRMLOGIN.BTN}
    ${error_msg}=   Get Text    xPath=//div[@class='chakra-form__error-message css-zrexl5']
    Should Be Equal     ${error_msg}     ${ERROR_PASSWORD}