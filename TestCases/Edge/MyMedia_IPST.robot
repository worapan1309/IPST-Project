*** Settings ***
Library     SeleniumLibrary
Variables   ${EXECDIR}${/}TestData${/}environment.yaml
Variables   ${EXECDIR}${/}TestData${/}data.yaml
Resource    ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Resource    ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Login_IPST.resource
Resource    ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}Login_IPST.resource
Resource    ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}MyMedia_IPST.resource
Resource    ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}MyMedia_IPST.resource

Test Setup      Open Browser And Go To URL      Edge      ${URL_IPST}     
Test Teardown   Close Browser

*** Test Cases ***
My_Media_001 
    [Documentation]      Add Media Type: Video 
    Login: IPST Website    ${LOGIN_EMAIL_STUDENT}  ${LOGIN_PASSWORD_STUDENT}
    Open Media       ${URL_VDO}     
    Add Media
    Open My Media
    Check Media     ${MyMedia_IPST.MEDIA_NAME.HEADER}    ${VDO_NAME}   
    Delete Media 

My_Media_002
    [Documentation]      Add Media Type: Power Point
    Login: IPST Website    ${LOGIN_EMAIL_STUDENT}  ${LOGIN_PASSWORD_STUDENT}
    Open Media       ${URL_PPT}     
    Add Media
    Open My Media
    Check Media     ${MyMedia_IPST.MEDIA_NAME.HEADER}    ${PPT_NAME}   
    Delete Media

My_Media_003
    [Documentation]      Add Media Type: Word
    Login: IPST Website    ${LOGIN_EMAIL_STUDENT}  ${LOGIN_PASSWORD_STUDENT}
    Open Media       ${URL_WORD}     
    Add Media
    Open My Media
    Check Media     ${MyMedia_IPST.MEDIA_NAME.HEADER}    ${WORD_NAME}   
    Delete Media

My_Media_004
    [Documentation]     Add Media Type: PDF
    Login: IPST Website    ${LOGIN_EMAIL_STUDENT}  ${LOGIN_PASSWORD_STUDENT}
    Open Media       ${URL_PDF}     
    Add Media
    Open My Media
    Check Media     ${MyMedia_IPST.MEDIA_NAME.HEADER}    ${PDF_NAME}  
    Delete Media

My_Media_005
    [Documentation]     Add Media Type: Exercise
    Login: IPST Website    ${LOGIN_EMAIL_STUDENT}  ${LOGIN_PASSWORD_STUDENT}
    Open Media       ${URL_EXERCISE}     
    Add Media
    Open My Media
    Check Media     ${MyMedia_IPST.MEDIA_NAME.HEADER}    ${EXERCISE_NAME}   
    Delete Media

My_Media_006
    [Documentation]     Add Media Type: Other
    Login: IPST Website    ${LOGIN_EMAIL_STUDENT}  ${LOGIN_PASSWORD_STUDENT}
    Open Media       ${URL_OTHER}     
    Add Media
    Open My Media
    Check Media     ${MyMedia_IPST.MEDIA_NAME.HEADER}    ${OTHER_NAME}   
    Delete Media
   