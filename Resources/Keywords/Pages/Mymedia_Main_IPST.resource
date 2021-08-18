*** Settings ***
Library           SeleniumLibrary
Resource        ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}Mymedia_Main_IPST.resource

*** Keywords ***
Add media
    # Wait And Click Element           ${MYMEDIA_MAIN.TOPIC.BTN}
    # Wait Until Page Contains Element    ${MYMEDIA_MAIN.TOPICLIST.MENU}  
    # Click Button      ${MYMEDIA_MAIN.MEDIA.BTN}
    Wait And Click Element           ${MYMEDIA_MAIN.ADDMYMEDIA.BTN}
    Wait And Click Element           ${MYMEDIA_MAIN.ADD.BTN} 
      
Check media
    Wait And Click Element           ${MYMEDIA_MAIN.MYMEDIA.BTN} 
   