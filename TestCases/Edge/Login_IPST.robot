*** Settings ***
Variables         ${EXECDIR}${/}TestData${/}environment.yaml
Variables         ${EXECDIR}${/}TestData${/}data.yaml
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Login_IPST.resource
Resource          ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}Login_IPST.resource

Test Setup      Open Browser And Go To URL      Edge      ${URL_IPST}    
Test Teardown   Close Browser

*** Test Cases ***
Login_001
    [Documentation]     Login Should Be Success: Teacher Role
    [Tags]              login
    Login: IPST Website    ${LOGIN_EMAIL_TEACHER}  ${LOGIN_PASSWORD_TEACHER}
    Check Role Of Account   ครู

Login_002
    [Documentation]     Login Should Be Success: Student Role
    [Tags]              login
    Login: IPST Website    ${LOGIN_EMAIL_STUDENT}  ${LOGIN_PASSWORD_STUDENT}
    Check Role Of Account   นักเรียน

Login_003
    [Documentation]     Login Should Be Success: Parent Role
    [Tags]              login
    Login: IPST Website    ${LOGIN_EMAIL_PARENT}  ${LOGIN_PASSWORD_PARENT}
    Check Role Of Account   ผู้ปกครอง

Login_004
    [Documentation]     Filled With Wrong Password
    [Tags]              login
    Wait And Click Element   ${LOGIN_IPST.LOGIN.BTN}
    Wait And Click Element   ${LOGIN_IPST.EMAIL.BTN}
    Wait And Fill Text      ${LOGIN_IPST.EMAIL.FIELD}   ${LOGIN_EMAIL_TEACHER}
    Wait And Click Element   ${LOGIN_IPST.CONFIRMLOGIN.BTN}
    ${error_msg}=   Get Text    ${LOGIN_IPST.ERRORLOGIN.MSG}
    Should Be Equal     ${error_msg}     ${ERROR_PASSWORD_IPST}

Login_005
    [Documentation]      Filled With Wrong Email
    [Tags]               login
    Wait And Click Element   ${LOGIN_IPST.LOGIN.BTN}
    Wait And Click Element   ${LOGIN_IPST.EMAIL.BTN}
    Wait And Fill Text      ${LOGIN_IPST.PASSWORD.FIELD}   ${LOGIN_PASSWORD_TEACHER}
    Wait And Click Element   ${LOGIN_IPST.CONFIRMLOGIN.BTN}
    ${error_msg}=   Get Text    ${LOGIN_IPST.ERRORLOGIN.MSG}
    Should Be Equal     ${error_msg}     ${ERROR_EMAIL_IPST}