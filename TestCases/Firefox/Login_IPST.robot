*** Settings ***
Library     SeleniumLibrary
Variables   ${EXECDIR}${/}TestData${/}environment.yaml
Variables   ${EXECDIR}${/}TestData${/}data.yaml
Resource    ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Resource    ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Login_IPST.resource
Resource    ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}Login_IPST.resource

Test Setup      Open Browser And Go To URL      Firefox      ${URL_IPST}     WIN
Test Teardown   Close Browser

*** Test Cases ***
Login Should Be Success: Teacher Role
    Login Success: IPST Website    ${LOGIN_EMAIL_TEACHER}  ${LOGIN_PASSWORD_TEACHER}
    Check Role Of Account   ครู

Login Should Be Success: Student Role
    Login Success: IPST Website    ${LOGIN_EMAIL_STUDENT}  ${LOGIN_PASSWORD_STUDENT}
    Check Role Of Account   นักเรียน

Login Should Be Success: Parent Role
    Login Success: IPST Website    ${LOGIN_EMAIL_PARENT}  ${LOGIN_PASSWORD_PARENT}
    Check Role Of Account   ผู้ปกครอง

Filled With Wrong Password
    Wait And Click Element   ${LOGIN_IPST.LOGIN.BTN}
    Wait And Click Element   ${LOGIN_IPST.EMAIL.BTN}
    Wait And Fill Text      ${LOGIN_IPST.EMAIL.FIELD}   ${LOGIN_EMAIL_TEACHER}
    Wait And Click Element   ${LOGIN_IPST.CONFIRMLOGIN.BTN}
    ${error_msg}=   Get Text    ${LOGIN_IPST.ERRORLOGIN.MSG}
    Should Be Equal     ${error_msg}     ${ERROR_PASSWORD_IPST}

Filled With Wrong Email
    Wait And Click Element   ${LOGIN_IPST.LOGIN.BTN}
    Wait And Click Element   ${LOGIN_IPST.EMAIL.BTN}
    Wait And Fill Text      ${LOGIN_IPST.PASSWORD.FIELD}   ${LOGIN_PASSWORD_TEACHER}
    Wait And Click Element   ${LOGIN_IPST.CONFIRMLOGIN.BTN}
    ${error_msg}=   Get Text    ${LOGIN_IPST.ERRORLOGIN.MSG}
    Should Be Equal     ${error_msg}     ${ERROR_EMAIL_IPST}