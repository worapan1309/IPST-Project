*** Settings ***
Variables         ${EXECDIR}${/}TestData${/}environment.yaml
Variables         ${EXECDIR}${/}TestData${/}data.yaml
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Login_Strapi.resource
Resource          ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}Login_Strapi.resource

Force Tags       login_strapi_mac 
Suite Setup      Open Browser And Go To URL      Edge      ${URL_STRAPI}    
Suite Teardown   Close Browser

*** Test Cases ***
Login_001
    [Documentation]     Filled With Wrong Password
    [Tags]              login
    Login: Strapi Website    ${LOGIN_EMAIL_STRAPI}  ${WRONG_PASSWORD_STRAPI}
    Check Error Message     ${LOGIN_STRAPI.FAILED.MSG}  ${FAILED_LOGIN_STRAPI}
    [Teardown]          Clear Input         

Login_002
    [Documentation]     Filled With Wrong Email
    [Tags]              login
    Login: Strapi Website    ${WRONG_EMAIL_STRAPI}  ${LOGIN_PASSWORD_STRAPI}
    Check Error Message     ${LOGIN_STRAPI.FAILED.MSG}  ${FAILED_LOGIN_STRAPI}
    [Teardown]          Clear Input 

Login_003
    [Documentation]     Not Filled Password
    [Tags]              login
    Wait And Fill Text      ${LOGIN_STRAPI.EMAIL.FIELD}   ${LOGIN_EMAIL_STRAPI}
    Wait And Click Element   ${LOGIN_STRAPI.CONFIRMLOGIN.BTN}
    ${status}   ${value}=   Run Keyword And Ignore Error    Check Error Message     ${LOGIN_STRAPI.REQUIREDPASSWORD.MSG}    ${REQUIRED_PASSWORD_STRAPI}
    Run Keyword If  '${status}' == 'FAIL'   Check Error Message     ${LOGIN_STRAPI.REQUIREDPASSWORD.MSG}    ${REQUIRED_THAI_STRAPI}
    [Teardown]          Clear Input 

Login_004
    [Documentation]     Not Filled Email
    [Tags]              login
    Wait And Fill Text      ${LOGIN_STRAPI.PASSWORD.FIELD}   ${LOGIN_PASSWORD_STRAPI}
    Wait And Click Element   ${LOGIN_STRAPI.CONFIRMLOGIN.BTN}
    ${status}   ${value}=   Run Keyword And Ignore Error    Check Error Message     ${LOGIN_STRAPI.REQUIREDEMAIL.MSG}    ${REQUIRED_EMAIL_STRAPI}
    Run Keyword If  '${status}' == 'FAIL'   Check Error Message     ${LOGIN_STRAPI.REQUIREDEMAIL.MSG}    ${REQUIRED_THAI_STRAPI}
    [Teardown]          Clear Input 

Login_005
    [Documentation]     Not Filled Both Email And Password
    [Tags]              login
    Wait And Click Element   ${LOGIN_STRAPI.CONFIRMLOGIN.BTN}
    ${status}   ${value}=   Run Keyword And Ignore Error    Check Error Message     ${LOGIN_STRAPI.REQUIREDEMAIL.MSG}    ${REQUIRED_EMAIL_STRAPI}
    Run Keyword If  '${status}' == 'FAIL'   Check Error Message     ${LOGIN_STRAPI.REQUIREDEMAIL.MSG}    ${REQUIRED_THAI_STRAPI}
    ${status}   ${value}=   Run Keyword And Ignore Error    Check Error Message     ${LOGIN_STRAPI.REQUIREDPASSWORD.MSG}    ${REQUIRED_PASSWORD_STRAPI}
    Run Keyword If  '${status}' == 'FAIL'   Check Error Message     ${LOGIN_STRAPI.REQUIREDPASSWORD.MSG}    ${REQUIRED_THAI_STRAPI}
    [Teardown]          Clear Input 

Login_006
    [Documentation]     Login Should Be Success
    [Tags]              login
    Login: Strapi Website    ${LOGIN_EMAIL_STRAPI}  ${LOGIN_PASSWORD_STRAPI}