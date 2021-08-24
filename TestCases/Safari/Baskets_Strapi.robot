*** Settings ***
Variables         ${EXECDIR}${/}TestData${/}environment.yaml
Variables         ${EXECDIR}${/}TestData${/}data.yaml
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Baskets_Strapi.resource
Resource          ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}Baskets_Strapi.resource
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Login_Strapi.resource

Force Tags       baskets_strapi_mac 
Test Setup      Open Browser And Login: Strapi      Safari     
Test Teardown   Close Browser


*** Test Cases ***
Baskets_001
    [Documentation]     สร้างสื่อกระเช้าการสอนกรอกข้อมูลครบถ้วน
    [Tags]              addbaskets
    Add Basket Except   None
    Back To Basket Dashboard
    Remove Entry Basket 

# Baskets_002
#     [Documentation]     กรอกข้อมูลช่อง Slug เว้นวรรค
#     [Tags]              addbaskets
#     Add Basket Except   slug
#     Back To Basket Dashboard
#     Remove Entry Basket 
#     [Teardown]  Run Keyword If Test Failed      Teardown For Failed       slug    

Baskets_003
    [Documentation]     ไม่กรอกข้อมูลช่อง Slug
    [Tags]              addbaskets
    Add Basket Except   slug
    Back To Basket Dashboard
    Remove Entry Basket 
    [Teardown]  Run Keywords    Run Keyword If Test Failed      Teardown For Failed       slug      AND     Run Keyword If Test Passed      Close Browser
        
Baskets_004
    [Documentation]     ไม่กรอกข้อมูลช่อง Title
    [Tags]              addbaskets                
    Add Basket Except   title
    Back To Basket Dashboard
    Remove Entry Basket 
    [Teardown]  Run Keywords    Run Keyword If Test Failed      Teardown For Failed       title      AND     Run Keyword If Test Passed      Close Browser

Baskets_005
    [Documentation]     ไม่กรอกข้อมูลช่อง Subject
    [Tags]              addbaskets
    Add Basket Except   sub  
    Back To Basket Dashboard 
    Remove Entry Basket 
    [Teardown]  Run Keywords    Run Keyword If Test Failed      Teardown For Failed       sub      AND     Run Keyword If Test Passed      Close Browser
Baskets_006
    [Documentation]     ไม่กรอกข้อมูลช่อง Education Level
    [Tags]              addbaskets
    Add Basket Except   edulvl  
    Back To Basket Dashboard 
    Remove Entry Basket 
    [Teardown]  Run Keywords    Run Keyword If Test Failed      Teardown For Failed       edulvl      AND     Run Keyword If Test Passed      Close Browser

Baskets_007    
    [Documentation]     ไม่กรอกข้อมูลช่อง Cover Image
    [Tags]              addbaskets
    Add Basket Except   coverimg
    Back To Basket Dashboard
    Remove Entry Basket 
    [Teardown]  Run Keywords    Run Keyword If Test Failed      Teardown For Failed       coverimg      AND     Run Keyword If Test Passed      Close Browser

Baskets_008    
    [Documentation]     ไม่กรอกข้อมูลช่อง Purchase URL
    [Tags]              addbaskets
    Add Basket Except   purchaseurl
    Back To Basket Dashboard
    Remove Entry Basket 
    [Teardown]  Run Keywords    Run Keyword If Test Failed      Teardown For Failed       purchaseurl      AND     Run Keyword If Test Passed      Close Browser

Baskets_009    
    [Documentation]     ไม่กรอกข้อมูลช่อง Download URL
    [Tags]              addbaskets
    Add Basket Except   downloadurl
    Back To Basket Dashboard
    Remove Entry Basket 
    [Teardown]  Run Keywords    Run Keyword If Test Failed      Teardown For Failed       downloadurl      AND     Run Keyword If Test Passed      Close Browser

Baskets_010
    [Documentation]     คัดลอกกระเช้าการสอน
    [Tags]              addbaskets
    Add Basket Except   None
    Back To Basket Dashboard
    Duplicate Basket
    Back To Basket Dashboard
    Remove Basket
    Remove Basket

Baskets_011
    [Documentation]     แก้ไขกระเช้าการสอน
    [Tags]              addbaskets
    Add Basket Except   None
    Back To Basket Dashboard
    Edit Basket
    Back To Basket Dashboard
    Remove Basket

Baskets_012
    [Documentation]     ลบกระเช้าการสอน
    [Tags]              addbaskets    
    Add Basket Except   None
    Back To Basket Dashboard
    Remove Basket