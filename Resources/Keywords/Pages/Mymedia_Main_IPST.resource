*** Settings ***
Library           SeleniumLibrary
Resource        ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}Mymedia_Main_IPST.resource

*** Keywords ***
Add media
    Wait And Click Element           ${MYMEDIA_MAIN.ADDMYMEDIA.BTN}
    Wait And Click Element           ${MYMEDIA_MAIN.ADD.BTN} 
      
Check media
    Wait And Click Element           ${MYMEDIA_MAIN.MYMEDIA.BTN} 
   
New folder
    Wait And Click Element           ${MYMEDIA_MAIN.PLUSADD.BTN}
    

Three point
    Wait And Click Element           ${MYMEDIA_MAIN.THREEPOINT.BTN}

Edit folder 
    Wait And Click Element           ${MYMEDIA_MAIN.EDITNAME.BTN}
    Clear Element Text               ${MYMEDIA_MAIN.EDIT.FIELD}
    Wait And Fill Text               ${MYMEDIA_MAIN.EDIT.FIELD}             แก้ไข
    Wait And Click Element           ${MYMEDIA_MAIN.SAVEEDIT.BTN}
    
Open Media  
    [Arguments]     ${media}
    Go to       ${media}

    


