*** Settings ***
Library           SeleniumLibrary
Resource        ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}Login_Strapi.resource

*** Keywords ***
Login: Strapi Website
    [Arguments]     ${email}    ${password}
    Wait And Fill Text      ${LOGIN_STRAPI.EMAIL.FIELD}   ${email}
    Wait And Fill Text      ${LOGIN_STRAPI.PASSWORD.FIELD}   ${password}
    Wait And Click Element   ${LOGIN_STRAPI.CONFIRMLOGIN.BTN}

Check Error Message
    [Arguments]     ${locator}      ${msg}
    Wait Until Element Is Visible       ${locator}
    Sleep   1s
    ${error_msg}=   Get Text    ${locator}
    Should Be Equal     ${error_msg}     ${msg}