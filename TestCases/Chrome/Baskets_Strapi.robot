*** Settings ***
Variables         ${EXECDIR}${/}TestData${/}environment.yaml
Variables         ${EXECDIR}${/}TestData${/}data.yaml
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Baskets_Strapi.resource
Resource          ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}Baskets_Strapi.resource
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Login_Strapi.resource

Force Tags       baskets_strapi_mac 
Suite Setup      Open Browser And Login: Strapi      Chrome     
#Suite Teardown   Close Browser


*** Test Cases ***
Baskets_001
    [Documentation]     สร้างสื่อกระเช้าการสอนกรอกข้อมูลครบถ้วน
    [Tags]              addbaskets
    Add Basket Except   None
    Back To Basket Dashboard
    Remove Basket 

Baskets_003
    [Documentation]     ไม่กรอกข้อมูลช่อง Slug
    [Tags]              addbaskets
    Add Basket Except   slug
    Back To Basket Dashboard
    Remove Basket 
        
Baskets_004
    [Documentation]     ไม่กรอกข้อมูลช่อง Title
    [Tags]              addbaskets                
    Add Basket Except   title
    Back To Basket Dashboard
    Remove Basket

Baskets_005
    [Documentation]     ไม่กรอกข้อมูลช่อง Subject
    [Tags]              addbaskets
    Add Basket Except   sub  
    Back To Basket Dashboard 
    Remove Basket

Baskets_006
    [Documentation]     ไม่กรอกข้อมูลช่อง Education Level
    [Tags]              addbaskets
    Add Basket Except   edulvl  
    Back To Basket Dashboard 
    Remove Basket

Baskets_007    
    [Documentation]     ไม่กรอกข้อมูลช่อง Cover Image
    [Tags]              addbaskets
    Add Basket Except   coverimg
    Back To Basket Dashboard
    Remove Basket

Baskets_008    
    [Documentation]     ไม่กรอกข้อมูลช่อง Purchase URL
    [Tags]              addbaskets
    Add Basket Except   purchaseurl
    Back To Basket Dashboard
    Remove Basket

Baskets_009
    [Documentation]     คัดลอกกระเช้าการสอน
    [Tags]              addbaskets
    Add Basket Except   None
    Back To Basket Dashboard
    Duplicate Basket
    Back To Basket Dashboard
    Remove Basket
    Remove Basket

Baskets_010
    [Documentation]     แก้ไขกระเช้าการสอน
    [Tags]              addbaskets
    Add Basket Except   None
    Back To Basket Dashboard
    Edit Basket
    Back To Basket Dashboard
    Remove Basket

Baskets_011
    [Documentation]     ลบกระเช้าการสอน
    [Tags]              addbaskets    
    Add Basket Except   None
    Back To Basket Dashboard
    Remove Basket