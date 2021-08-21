*** Settings ***
Variables         ${EXECDIR}${/}TestData${/}environment.yaml
Variables         ${EXECDIR}${/}TestData${/}data.yaml
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Login_Strapi.resource
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}MediaItem_Detail_Strapi.resource
Resource          ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}MediaItem_Detail_Strapi.resource

Test Setup      Open Browser And Login: Strapi      Safari
Test Teardown   Close Browser
Suite Teardown  Close Browser

*** Test Cases ***
Add Media Item 001
    [Documentation]     Filled All Information - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO

Add Media Item 002
    [Documentation]     Not Filled Slug - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     slug
    
    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        VDO      Slug

Add Media Item 003
    [Documentation]     Not Filled Title - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     title

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        VDO      Title

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

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        VDO      Subject

Add Media Item 007
    [Documentation]     Not Filled Education Level - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     edLV

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        VDO      Education Level

Add Media Item 008
    [Documentation]     Not Filled Category - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     cat

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        VDO      Category

Add Media Item 009
    [Documentation]     Not Filled Cover Image - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     img

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        VDO      Cover Image

Add Media Item 010
    [Documentation]     Not Filled Metadata - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     meta

Add Media Item 011
    [Documentation]     Not Filled Preview Type - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     preType

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        VDO      Preview Type

Add Media Item 012
    [Documentation]     Not Filled Preview URL - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     preURL

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        VDO      Preview URL

Add Media Item 013
    [Documentation]     Not Filled Download URL - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     download

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        VDO      Download URL

Add Media Item 014
    [Documentation]     Not Filled Embeded Code - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO     embed

Add Media Item 015
    [Documentation]     Filled All Information - VDO
    [Tags]              MediaItem   VDO
    Add Media Item Except     VDO

Add Media Item 016
    [Documentation]     Not Filled Slug - PDF
    [Tags]              MediaItem   PDF
    Add Media Item Except     PDF     slug
    
    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        PDF      Slug

Add Media Item 017
    [Documentation]     Not Filled Title - PDF
    [Tags]              MediaItem   PDF
    Add Media Item Except     PDF     title

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        PDF      Title

Add Media Item 018
    [Documentation]     Not Filled Description - PDF
    [Tags]              MediaItem   PDF
    Add Media Item Except     PDF     des

Add Media Item 019
    [Documentation]     Not Filled SeoDescription - PDF
    [Tags]              MediaItem   PDF
    Add Media Item Except     PDF     seo

Add Media Item 020
    [Documentation]     Not Filled Subject - PDF
    [Tags]              MediaItem   PDF
    Add Media Item Except     PDF     sub

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        PDF      Subject

Add Media Item 021
    [Documentation]     Not Filled Education Level - PDF
    [Tags]              MediaItem   PDF
    Add Media Item Except     PDF     edLV

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        PDF      Education Level

Add Media Item 022
    [Documentation]     Not Filled Category - PDF
    [Tags]              MediaItem   PDF
    Add Media Item Except     PDF     cat

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        PDF      Category

Add Media Item 023
    [Documentation]     Not Filled Cover Image - PDF
    [Tags]              MediaItem   PDF
    Add Media Item Except     PDF     img

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        PDF      Cover Image

Add Media Item 024
    [Documentation]     Not Filled Metadata - PDF
    [Tags]              MediaItem   PDF
    Add Media Item Except     PDF     meta

Add Media Item 025
    [Documentation]     Not Filled Preview Type - PDF
    [Tags]              MediaItem   PDF
    Add Media Item Except     PDF     preType

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        PDF      Preview Type

Add Media Item 026
    [Documentation]     Not Filled Preview URL - PDF
    [Tags]              MediaItem   PDF
    Add Media Item Except     PDF     preURL

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        PDF      Preview URL

Add Media Item 027
    [Documentation]     Not Filled Download URL - PDF
    [Tags]              MediaItem   PDF
    Add Media Item Except     PDF     download

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        PDF      Download URL

Add Media Item 028
    [Documentation]     Not Filled Embeded Code - PDF
    [Tags]              MediaItem   PDF
    Add Media Item Except     PDF     embed

Add Media Item 029
    [Documentation]     Filled All Information - EXERCISE
    [Tags]              MediaItem   EXERCISE
    Add Media Item Except     EXERCISE

Add Media Item 030
    [Documentation]     Not Filled Slug - EXERCISE
    [Tags]              MediaItem   EXERCISE
    Add Media Item Except     EXERCISE     slug
    
    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        EXERCISE      Slug

Add Media Item 031
    [Documentation]     Not Filled Title - EXERCISE
    [Tags]              MediaItem   EXERCISE
    Add Media Item Except     EXERCISE     title

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        EXERCISE      Title

Add Media Item 032
    [Documentation]     Not Filled Description - EXERCISE
    [Tags]              MediaItem   EXERCISE
    Add Media Item Except     EXERCISE     des

Add Media Item 033
    [Documentation]     Not Filled SeoDescription - EXERCISE
    [Tags]              MediaItem   EXERCISE
    Add Media Item Except     EXERCISE     seo

Add Media Item 034
    [Documentation]     Not Filled Subject - EXERCISE
    [Tags]              MediaItem   EXERCISE
    Add Media Item Except     EXERCISE     sub

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        EXERCISE      Subject

Add Media Item 035
    [Documentation]     Not Filled Education Level - EXERCISE
    [Tags]              MediaItem   EXERCISE
    Add Media Item Except     EXERCISE     edLV

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        EXERCISE      Education Level

Add Media Item 036
    [Documentation]     Not Filled Category - EXERCISE
    [Tags]              MediaItem   EXERCISE
    Add Media Item Except     EXERCISE     cat

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        EXERCISE      Category

Add Media Item 037
    [Documentation]     Not Filled Cover Image - EXERCISE
    [Tags]              MediaItem   EXERCISE
    Add Media Item Except     EXERCISE     img

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        EXERCISE      Cover Image

Add Media Item 038
    [Documentation]     Not Filled Metadata - EXERCISE
    [Tags]              MediaItem   EXERCISE
    Add Media Item Except     EXERCISE     meta

Add Media Item 039
    [Documentation]     Not Filled Preview Type - EXERCISE
    [Tags]              MediaItem   EXERCISE
    Add Media Item Except     EXERCISE     preType

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        EXERCISE      Preview Type

Add Media Item 040
    [Documentation]     Not Filled Preview URL - EXERCISE
    [Tags]              MediaItem   EXERCISE
    Add Media Item Except     EXERCISE     preURL

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        EXERCISE      Preview URL

Add Media Item 041
    [Documentation]     Not Filled Download URL - EXERCISE
    [Tags]              MediaItem   EXERCISE
    Add Media Item Except     EXERCISE     download

    [Teardown]  Run Keyword If Test Failed      Teardown For Failed        EXERCISE      Download URL

Add Media Item 042
    [Documentation]     Not Filled Embeded Code - EXERCISE
    [Tags]              MediaItem   EXERCISE
    Add Media Item Except     EXERCISE     embed
    