*** Settings ***
Variables         ${EXECDIR}${/}TestData${/}environment.yaml
Variables         ${EXECDIR}${/}TestData${/}data.yaml
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Login_Strapi.resource
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}MediaItem_Detail_Strapi.resource
Resource          ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}MediaItem_Detail_Strapi.resource

Test Setup      Open Browser And Login: Strapi      Chrome
Test Teardown   Close Browser

*** Test Cases ***
Add Media Item 001
    [Documentation]     Filled All Information - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO

Add Media Item 002
    [Documentation]     Not Filled Slug - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     slug
    
    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        VDO

Add Media Item 003
    [Documentation]     Not Filled Title - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     title

Add Media Item 004
    [Documentation]     Not Filled Description - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     des

Add Media Item 005
    [Documentation]     Not Filled SeoDescription - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     seo

Add Media Item 006
    [Documentation]     Not Filled Subject - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     sub

Add Media Item 007
    [Documentation]     Not Filled Education Level - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     edLV

Add Media Item 008
    [Documentation]     Not Filled Category - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     cat

Add Media Item 009
    [Documentation]     Not Filled Cover Image - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     img

Add Media Item 010
    [Documentation]     Not Filled Metadata - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     meta

Add Media Item 011
    [Documentation]     Not Filled Preview Type - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     preType

Add Media Item 012
    [Documentation]     Not Filled Preview URL - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     preURL

Add Media Item 013
    [Documentation]     Not Filled Download URL - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     download

Add Media Item 014
    [Documentation]     Not Filled Embeded Code - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     embed
    