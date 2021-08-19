*** Settings ***
Variables         ${EXECDIR}${/}TestData${/}environment.yaml
Variables         ${EXECDIR}${/}TestData${/}data.yaml
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Baskets_Strapi.resource
Resource          ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}Baskets_Strapi.resource
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Login_Strapi.resource

Force Tags       baskets_strapi_mac 
Suite Setup      Open Browser And Go To URL      Chrome      ${URL_STRAPI}     
#Suite Teardown   Close Browser


*** Test Cases ***
Baskets_001
    [Documentation]     สร้างสื่อกระเช้าการสอนกรอกข้อมูลครบถ้วน
    [Tags]              addbaskets
    Login: Strapi Website    ${LOGIN_EMAIL_STRAPI}  ${LOGIN_PASSWORD_STRAPI}
    Go to Baskets
    Click Add new Basket
    Input Basket Slug                 
    Input Baskets Title  
    Select Subject    
    Select Education Level
    Input Description    
    Upload Cover Image           
    Input Download URL 
    Input Purchase URL  
    Save New Basket  
    Publish New Basket      
        
