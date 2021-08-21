*** Settings ***
Library         SeleniumLibrary
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

Sort Baskets By ID: Descending order
    Wait And Click Element  ${BASKETS_DASHBOARD_STRAPI.ID.SORT} 
    Wait And Click Element  ${BASKETS_DASHBOARD_STRAPI.ID.SORT} 

Teardown For Failed
    Remove Basket   
    Close Browser

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
    Select From List By Value   ${BASKET_DETAIL_STRAPI.SUBJECT.SELECT}                  COMPUTING_SCIENCE 

Select Education Level
    Select From List By Value   ${BASKET_DETAIL_STRAPI.EDULVL.SELECT}                   M5    

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
    Wait And Fill Text          ${BASKET_DETAIL_STRAPI.SLUG.INPUT}                       Computer-M5-Test-Duplicate
    Save New Basket  
    Publish New Basket 

Edit Basket        
    Sort Baskets By ID: Descending order      
    Wait And Click Element      ${BASKETS_DASHBOARD_STRAPI.EDIT.BUTTON} 
    Unpublish Basket
    sleep   1s
    Wait And Fill Text          ${BASKET_DETAIL_STRAPI.SLUG.INPUT}                       Computer-M5-Test-Edit
    sleep   1s
    Save New Basket  
    sleep   1s
    Publish New Basket 

Remove Basket 
    Sort Baskets By ID: Descending order
    Wait And Click Element  ${BASKETS_DASHBOARD_STRAPI.DELETE.BUTTON} 
    Wait And Click Element  ${BASKETS_DASHBOARD_STRAPI.COMFIRMDELETE.BUTTON} 
    
     
  