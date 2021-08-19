*** Keywords ***

Go to Baskets
    Wait And Click Element      ${BASKETS_DASHBOARD_STRAPI.BASKETS.BUTTON}

Click Add new Basket
    Wait And Click Element      ${BASKETS_DASHBOARD_STRAPI.ADDNEWBASKET.BUTTON} 

Input Basket Slug
    Wait And Click Element      ${BASKET_DETAIL_STRAPI.SLUG.INPUT}
    Wait And Fill Text          ${BASKET_DETAIL_STRAPI.SLUG.INPUT}                      ${SLUG_BASKET_STRAPI}        

Input Baskets Title  
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
    
     
  