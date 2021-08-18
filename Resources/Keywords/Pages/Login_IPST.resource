*** Settings ***
Library           SeleniumLibrary
Resource        ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}Login_IPST.resource

*** Keywords ***
Login: IPST Website
    [Arguments]     ${email}    ${password}
    Wait And Click Element   ${LOGIN_IPST.LOGIN.BTN}
    Wait And Click Element   ${LOGIN_IPST.EMAIL.BTN}
    Wait And Fill Text      ${LOGIN_IPST.EMAIL.FIELD}   ${email}
    Wait And Fill Text      ${LOGIN_IPST.PASSWORD.FIELD}   ${password}
    Wait And Click Element   ${LOGIN_IPST.CONFIRMLOGIN.BTN}

Check Role Of Account
    [Arguments]     ${role_message}
    Wait And Click Element   ${LOGIN_IPST.PROFILE.BTN}
    Wait And Click Element   ${LOGIN_IPST.MYPROFILE.MENU}
    ${role}=   Get Text    ${LOGIN_IPST.ROLE.FIELD}
    Should Contain     ${role}     ${role_message}

Check Error Message
    [Arguments]     ${locator}      ${msg}
    Wait Until Element Is Visible       ${locator}
    ${error_msg}=   Get Text    ${locator}
    Should Be Equal     ${error_msg}     ${msg}