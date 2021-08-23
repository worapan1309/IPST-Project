*** Settings ***
Library         SeleniumLibrary
Library         String
Variables       ${EXECDIR}${/}TestData${/}environment.yaml
Resource        ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Resource        ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}Baskets_Strapi.resource

*** Variables ***
@{LIST_FIELDS}=     slug    title   sub     edulvl    des   coverimg    downloadurl    purchaseurl

*** Keywords ***
Add Basket Except
    [Arguments]     ${except}=None
    ${args}=    Copy LIST   ${LIST_FIELDS}
    Remove Values From List     ${args}     ${except}
    ${CHECK_CONDITION}=     Set Variable    '${except}'=='slug' or '${except}'=='title' or '${except}'=='sub' or '${except}'=='edulvl' or '${except}'=='downloadurl'
    Go to Baskets
    Click Add new Basket

    FOR    ${item}    IN    @{args}
        Run Keyword If  '${item}'=='slug'           Input Basket Slug
        ...    ELSE IF  '${item}'=='title'          Input Basket Title 
        ...    ELSE IF  '${item}'=='sub'            Select Subject
        ...    ELSE IF  '${item}'=='edulvl'         Select Education Level
        ...    ELSE IF  '${item}'=='des'            Input Description
        ...    ELSE IF  '${item}'=='coverimg'       Upload Cover Image    
        ...    ELSE IF  '${item}'=='downloadurl'    Input Download URL   
        ...    ELSE IF  '${item}'=='purchaseurl'    Input Purchase URL   

    END

    Save New Basket  
    Publish New Basket 
    ${var_name}=    Convert To Upper Case       ${except}

    Run Keyword If  ${CHECK_CONDITION}  Run Keywords
    ...     Element Should Be Visible   ${BASKET_DETAIL_STRAPI.ERROR_${var_name}.MSG}   AND     
    ...     Capture Element Screenshot  ${BASKET_DETAIL_STRAPI.ERROR_${var_name}.MSG}


Sort Baskets By ID: Descending order
    Wait And Click Element  ${BASKETS_DASHBOARD_STRAPI.ID.SORT} 
    Wait And Click Element  ${BASKETS_DASHBOARD_STRAPI.ID.SORT} 

Go to Baskets
    Wait And Click Element      ${BASKETS_DASHBOARD_STRAPI.BASKETS.BUTTON}

Click Add new Basket
    Wait And Click Element      ${BASKETS_DASHBOARD_STRAPI.ADDNEWBASKET.BUTTON} 

Input Basket Slug
    Wait And Click Element      ${BASKET_DETAIL_STRAPI.SLUG.INPUT}
    Wait And Fill Text          ${BASKET_DETAIL_STRAPI.SLUG.INPUT}                      ${SLUG_BASKET_STRAPI}        

Input Basket Title  
    Wait And Click Element      ${BASKET_DETAIL_STRAPI.TITLE.INPUT}    
    Wait And Fill Text          ${BASKET_DETAIL_STRAPI.TITLE.INPUT}                     ${TITLE_BASKET_STRAPI}        
    
Select Subject    
    Select From List By Value   ${BASKET_DETAIL_STRAPI.SUBJECT.SELECT}                  ${SUBJECT_BASKET_STRAPI} 

Select Education Level
    Select From List By Value   ${BASKET_DETAIL_STRAPI.EDULVL.SELECT}                   ${EDULVL_BASKET_STRAPI}   

Input Description 
    Wait And Click Element      ${BASKET_DETAIL_STRAPI.DESCRIPTION.INPUT}
    Wait And Fill Text          ${BASKET_DETAIL_STRAPI.DESCRIPTION.INPUT}               ${DESCRIPTION_BASKET_STRAPI}         

Upload Cover Image
    Wait And Click Element      ${BASKET_DETAIL_STRAPI.COVERIMG.IMAGE}
    Wait And Click Element      ${BASKET_DETAIL_STRAPI.TESTCOVERIMG.IMAGE} 
    Wait And Click Element      ${BASKET_DETAIL_STRAPI.FINISH.BUTTON}      
     
Input Download URL 
    Wait And Click Element      ${BASKET_DETAIL_STRAPI.DOWNLOADURL.INPUT}
    Wait And Fill Text          ${BASKET_DETAIL_STRAPI.DOWNLOADURL.INPUT}               ${DOWNLOADURL_BASKET_STRAPI}           

Input Purchase URL  
    Wait And Click Element      ${BASKET_DETAIL_STRAPI.PURCHASEURL.INPUT}  
    Wait And Fill Text          ${BASKET_DETAIL_STRAPI.PURCHASEURL.INPUT}               ${PURCHASEURL_BASKET_STRAPI}         

Save New Basket  
    Wait And Click Element      ${BASKET_DETAIL_STRAPI.SAVE.BUTTON} 

Publish New Basket      
    Wait And Click Element      ${BASKET_DETAIL_STRAPI.PUBLISH.BUTTON} 

Unpublish Basket
    Wait And Click Element      ${BASKET_DETAIL_STRAPI.UNPUBLISH.BUTTON}
    Wait And Click Element      ${BASKET_DETAIL_STRAPI.CONFIRMUNPUBLISH.BUTTON} 
    
Back To Basket Dashboard
    Wait And Click Element      ${BASKET_DETAIL_STRAPI.BACK.BUTTON} 

Duplicate Basket  
    Sort Baskets By ID: Descending order  
    Wait And Click Element      ${BASKETS_DASHBOARD_STRAPI.COPY.BUTTON}
    Wait And Fill Text          ${BASKET_DETAIL_STRAPI.SLUG.INPUT}                       ${SLUGDUPLICATE_BASKET_STRAPI}
    Save New Basket  
    Publish New Basket 

Edit Basket        
    Sort Baskets By ID: Descending order      
    Wait And Click Element      ${BASKETS_DASHBOARD_STRAPI.EDIT.BUTTON} 
    Unpublish Basket
    sleep   1s
    Wait And Fill Text          ${BASKET_DETAIL_STRAPI.SLUG.INPUT}                       ${SLUGEDIT_BASKET_STRAPI}
    sleep   1s
    Save New Basket  
    sleep   1s
    Publish New Basket 

Remove Basket 
    Sort Baskets By ID: Descending order
    Wait And Click Element  ${BASKETS_DASHBOARD_STRAPI.DELETE.BUTTON} 
    Wait And Click Element  ${BASKETS_DASHBOARD_STRAPI.COMFIRMDELETE.BUTTON} 
    
Teardown For Failed
    [Arguments]        ${attribute}
    Back To Basket Dashboard
    Remove Entry Basket   
    Fail    '${attribute}' field needs to be filled information, but it can be published even the field is empty.
    Close Browser

Clear Manual Popup
    Wait And Click Element  xPath=//button[@class="active"]

Remove Entry Basket
    Sort Baskets By ID: Descending order
    
    ${status}   ${value}=   Run Keyword And Ignore Error    Wait And Click Element  ${BASKET_DETAIL_STRAPI.LASTESTITEM.ITEM} 
    Run Keyword If  '${status}' == 'FAIL'   Wait And Click Element  ${BASKET_DETAIL_STRAPI.LASTESTITEM_FIND_SLUG.ITEM} 
    
    Clear Manual Popup
    Wait And Click Element  ${BASKET_DETAIL_STRAPI.ENTRYDELETE.BUTTON}  
    Wait And Click Element  ${BASKET_DETAIL_STRAPI.ENTRYCONFIRMDELETE.BUTTON}   