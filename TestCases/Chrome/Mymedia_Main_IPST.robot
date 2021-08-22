*** Settings ***
Library     SeleniumLibrary
Variables   ${EXECDIR}${/}TestData${/}environment.yaml
Variables   ${EXECDIR}${/}TestData${/}data.yaml
Resource    ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Resource    ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Login_IPST.resource
Resource    ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}Mymedia_Main_IPST.resource
Resource    ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Mymedia_Main_IPST.resource

Test Setup       Open Browser And Go To URL      Chrome      ${URL_IPST}     
Test Teardown    Close Browser

*** Test Cases ***
My_Media_Main_001
    [Documentation]     Add an existing file to the another folder
    Login : IPST Website    ${LOGIN_EMAIL_TEACHER}  ${LOGIN_PASSWORD_TEACHER}
    Open Media       ${URL_MYMEDIAMAIN} 
    Add media   
    Check Media        

My_Media_Main_002
    [Documentation]     Add an existing file to the another folder create new folder 
    Login : IPST Website    ${LOGIN_EMAIL_TEACHER}  ${LOGIN_PASSWORD_TEACHER}
    Open Media       ${URL_MYMEDIAMAIN}
    Create New Folder Add Media
    Three point
    Delete folder


My_Media_Main_003
    [Documentation]     add new folder in my media 
    Login : IPST Website    ${LOGIN_EMAIL_TEACHER}  ${LOGIN_PASSWORD_TEACHER}
    Go to my media
    New folder
    Create Folder
    

My_Media_Main_004
    [Documentation]     edit folder name in my media
    Login : IPST Website    ${LOGIN_EMAIL_TEACHER}  ${LOGIN_PASSWORD_TEACHER}
    Go to my media
    Three point
    Edit folder

My_Media_Main_005
    [Documentation]     copy an exist folder in my media
    Login : IPST Website    ${LOGIN_EMAIL_TEACHER}  ${LOGIN_PASSWORD_TEACHER}
    Go to my media
    Three point
    Wait And Click Element          ${MYMEDIA_MAIN.COPY.BTN}
    Three point
    Delete folder
    
    
My_Media_Main_006
    [Documentation]     delete folder in my media
    Login : IPST Website    ${LOGIN_EMAIL_TEACHER}  ${LOGIN_PASSWORD_TEACHER}
    Go to my media
    Three point
    Delete folder
   

My_Media_Main_007
    [Documentation]     add new folder, but doesn't name it in my media
    Login : IPST Website    ${LOGIN_EMAIL_TEACHER}  ${LOGIN_PASSWORD_TEACHER}
    Go to my media
    New folder
    Check Error
    





    
    