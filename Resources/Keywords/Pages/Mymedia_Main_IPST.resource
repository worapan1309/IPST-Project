*** Settings ***
Library           SeleniumLibrary
Resource        ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}Mymedia_Main_IPST.resource

*** Keywords ***
Add media
    Wait And Click Element           ${MYMEDIA_MAIN.ADDMYMEDIA.BTN}
    Wait And Click Element           ${MYMEDIA_MAIN.ADD.BTN} 

Check Media
    Wait And Click Element           ${MYMEDIA_MAIN.CLOSEPOPUP.BTN}
    Wait And Click Element           ${MYMEDIA_MAIN.MYMEDIA.BTN}
    Wait And Click Element           ${MYMEDIA_MAIN.MEDIA.BTN}
    Wait And Click Element           ${MYMEDIA_MAIN.DELETEMEDIA.BTN}
    Wait And Click Element           ${MYMEDIA_MAIN.CONFIRM.BTN}


Go to my media
    Wait And Click Element           ${MYMEDIA_MAIN.MYMEDIA.BTN} 
   
New folder
    Wait And Click Element           ${MYMEDIA_MAIN.PLUSADD.BTN}

Create New Folder Add Media
    Wait And Click Element           ${MYMEDIA_MAIN.ADDMYMEDIA.BTN} 
    Wait And Click Element           ${MYMEDIA_MAIN.NEWFOLDER.BTN}
    Wait And Fill Text               ${MYMEDIA_MAIN.INPUTNAME.FIELD}       ลองดู
    Wait And Click Element           ${MYMEDIA_MAIN.CONFIRMCREATE.BTN}
    Wait And Click Element           ${MYMEDIA_MAIN.GOTOMYMEDIA.BTN}
    
Create Folder
    Wait And Fill Text               ${MYMEDIA_MAIN.NAMEFOLDER.FIELD}       ทดสอบ
    Wait And Click Element           ${MYMEDIA_MAIN.CREATE.BTN} 

Three point
    Wait And Click Element           ${MYMEDIA_MAIN.THREEPOINT.BTN}

Edit folder 
    Wait And Click Element           ${MYMEDIA_MAIN.EDITNAME.BTN}
    Clear Element Text               ${MYMEDIA_MAIN.EDIT.FIELD}
    Wait And Fill Text               ${MYMEDIA_MAIN.EDIT.FIELD}             แก้ไข
    Wait And Click Element           ${MYMEDIA_MAIN.SAVEEDIT.BTN}
    
Delete folder
    Wait And Click Element          ${MYMEDIA_MAIN.DELETE.BTN}  
    Wait And Click Element          ${MYMEDIA_MAIN.CONFIRMDELETE.BTN}

Open Media  
    [Arguments]     ${media}
    Go to       ${media}

Check Error
    Wait And Click Element           ${MYMEDIA_MAIN.NOTFILLCREATE.BTN} 
    Check Error Message              ${MYMEDIA_MAIN.ERROR.MSG}  ${ERROR_CEATEFOLDER_IPST}



    


