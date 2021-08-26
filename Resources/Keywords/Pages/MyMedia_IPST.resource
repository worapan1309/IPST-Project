*** Settings ***
Library           SeleniumLibrary
Resource        ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}MyMedia_IPST.resource

*** Keywords ***
Open Media  
    [Arguments]     ${media}
    Go to       ${media}

Add Media
    Wait And Click Element   ${Preview_IPST.ADD.BTN} 
    Wait And Click Element      ${Preview_IPST.ADD_FLODER.BTN}
    
Open My Media
    Go to       ${URL_MYMEDIA} 

Delete Media 
    Wait And Click Element  ${MyMedia_IPST.DOT.BTN}   
    Wait And Click Element  ${MyMedia_IPST.DELETE.BTN}
    Wait And Click Element  ${MyMedia_IPST.CONFIRM_DELETE.BTN}  
    sleep       2s

Check Media
    [Arguments]     ${locator}      ${mgs}
    Wait Until Element Is Visible       ${locator}   20s   
    Element Text Should Be  ${locator}    ${mgs} 






    