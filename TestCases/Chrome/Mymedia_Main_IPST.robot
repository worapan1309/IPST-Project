*** Settings ***
Library     SeleniumLibrary
Variables   ${EXECDIR}${/}TestData${/}environment.yaml
Variables   ${EXECDIR}${/}TestData${/}data.yaml
Resource    ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Resource    ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Login_IPST.resource
Resource    ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}Mymedia_Main_IPST.resource
Resource    ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Mymedia_Main_IPST.resource

Test Setup       Open Browser And Go To URL      Chrome      ${URL_IPST}     WIN
# Test Teardown    Close Browser

*** Test Cases ***
My_Media_Main_001
    [Documentation]     Add an existing file to the another folder
    Login : IPST Website    ${LOGIN_EMAIL_TEACHER}  ${LOGIN_PASSWORD_TEACHER}
    Go to              http://202.139.199.68:3000/medias/m4b2_01_1part1relation_001_outline1  
    Add media

My_Media_Main_002
    [Documentation]     Check added media in my media 
    Login : IPST Website    ${LOGIN_EMAIL_TEACHER}  ${LOGIN_PASSWORD_TEACHER}
    Check media

    
    