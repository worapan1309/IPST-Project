*** Settings ***
Variables         ${EXECDIR}${/}TestData${/}environment.yaml
Variables         ${EXECDIR}${/}TestData${/}data.yaml
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Login_Strapi.resource
Resource          ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}MediaItems_Dashboard_Strapi.resource
Resource          ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}MediaItems_Dashboard_Strapi.resource

Test Setup      Open Browser And Login: Strapi      Safari
Test Teardown   Close Browser

*** Test Cases ***
Copy Media Item
    [Documentation]     Copy The Exist Media Item
    [Tags]              MediaItem   CRUD
    Prepare Media Item
    Wait And Click Element  ${MEDIAITEMS_DASHBOARD.COPY.BUTTON}
    Edit Fields
    Go Back To Dashboard
    Remove Media After Edit     LASTEST
    Remove Media After Edit     ORIGIN

Edit Media Item
    [Documentation]     Edit The Exist Media Item
    [Tags]              MediaItem   CRUD
    Prepare Media Item
    Wait And Click Element  ${MEDIAITEMS_DASHBOARD.EDIT.BUTTON}
    Unpublish Media Item
    Edit Fields
    Go Back To Dashboard
    Remove Media After Edit     LASTEST

Delete Media Item
    [Documentation]     Delete The Exist Media Item
    [Tags]              MediaItem   CRUD
    Prepare Media Item
    Wait And Click Element  ${MEDIAITEMS_DASHBOARD.DELETE.BUTTON}
    Wait And Click Element  ${MEDIAITEMS_DASHBOARD.CONFIRM_DELETE.BUTTON}