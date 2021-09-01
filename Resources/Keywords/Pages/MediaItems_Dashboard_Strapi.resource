*** Settings ***
Library         SeleniumLibrary
Library         String
Variables       ${EXECDIR}${/}TestData${/}environment.yaml
Resource        ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Resource        ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}MediaItem_Detail_Strapi.resource
Resource        ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}MediaItem_Detail_Strapi.resource
Resource        ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}MediaItems_Dashboard_Strapi.resource

*** Keywords ***
Prepare Media Item
    Wait And Click Element  ${MEDIAITEM_DETAIL.MEDIAITEM.MENU}
    Wait And Click Element  ${MEDIAITEM_DETAIL.ADDMEDIA.BTN}

    Wait And Fill Text  ${MEDIAITEM_DETAIL.SLUG.FIELD}  ${SLUG_MEDIA_VDO}
    Wait And Fill Text  ${MEDIAITEM_DETAIL.TITLE.FIELD}  ${TITLE_MEDIA_VDO}
    Wait And Fill Text  ${MEDIAITEM_DETAIL.DESCRIPTION.FIELD}  ${DESCRIPTION_MEDIA_VDO}
    Wait And Fill Text  ${MEDIAITEM_DETAIL.SEO_DESCRIPTION.FIELD}  ${SEO_DESCRIPTION_MEDIA_VDO}
    Select From List By Value     ${MEDIAITEM_DETAIL.SUBJECT.DROPDOWN}    ${SUBJECT_MEDIA_VDO}
    Set Focus To Element          ${MEDIAITEM_DETAIL.EDUCATION_LEVEL.DROPDOWN}  
    Select From List By Value     ${MEDIAITEM_DETAIL.EDUCATION_LEVEL.DROPDOWN}    ${EDUCATION_LEVEL_MEDIA_VDO}
    Select From List By Value     ${MEDIAITEM_DETAIL.CATEGORY.DROPDOWN}    ${CATEGORY_MEDIA_VDO}
    Select Cover Image
    Wait And Fill Text  ${MEDIAITEM_DETAIL.METADATA.FIELD}  ${METADATA_MEDIA_VDO}
    Select From List By Value     ${MEDIAITEM_DETAIL.PREVIEW_TYPE.DROPDOWN}   ${PREVIEW_TYPE_MEDIA_VDO}
    Wait And Fill Text  ${MEDIAITEM_DETAIL.PREVIEW_URL.FIELD}   ${PREVIEW_URL_MEDIA_VDO}
    Wait And Fill Text  ${MEDIAITEM_DETAIL.DOWNLOAD_URL.FIELD}  ${DOWNLOAD_URL_MEDIA_VDO}
    Wait And Fill Text  ${MEDIAITEM_DETAIL.EMBEDED_CODE.FIELD}  ${EMBEDED_CODE_MEDIA_VDO}

    Set Focus To Element    ${MEDIAITEM_DETAIL.SAVE.BTN}
    Press Keys      ${None}     HOME
    Wait And Click Element  ${MEDIAITEM_DETAIL.SAVE.BTN}
    Set Focus To Element    ${MEDIAITEM_DETAIL.PUBLISH.BTN}
    sleep  2s
    Wait And Click Element  ${MEDIAITEM_DETAIL.PUBLISH.BTN}

    Wait And Click Element  ${MEDIAITEM_DETAIL.BACK.BTN}
    Sort By ID: Descending order

Edit Fields
    Wait And Fill Text  ${MEDIAITEM_DETAIL.SLUG.FIELD}  ${SLUG_MEDIA_CRUD}
    Wait And Fill Text  ${MEDIAITEM_DETAIL.TITLE.FIELD}  ${TITLE_MEDIA_CRUD}
    Wait And Fill Text  ${MEDIAITEM_DETAIL.SEO_DESCRIPTION.FIELD}  ${SEO_DESCRIPTION_MEDIA_CRUD}
    Select From List By Value     ${MEDIAITEM_DETAIL.SUBJECT.DROPDOWN}    ${SUBJECT_MEDIA_CRUD}
    Set Focus To Element          ${MEDIAITEM_DETAIL.EDUCATION_LEVEL.DROPDOWN}
    Select From List By Value     ${MEDIAITEM_DETAIL.EDUCATION_LEVEL.DROPDOWN}    ${EDUCATION_LEVEL_MEDIA_CRUD}
    Select From List By Value     ${MEDIAITEM_DETAIL.CATEGORY.DROPDOWN}    ${CATEGORY_MEDIA_CRUD}
    Select From List By Value     ${MEDIAITEM_DETAIL.PREVIEW_TYPE.DROPDOWN}   ${PREVIEW_TYPE_MEDIA_CRUD}
    Wait And Fill Text  ${MEDIAITEM_DETAIL.PREVIEW_URL.FIELD}   ${PREVIEW_URL_MEDIA_CRUD}
    Wait And Fill Text  ${MEDIAITEM_DETAIL.DOWNLOAD_URL.FIELD}  ${DOWNLOAD_URL_MEDIA_CRUD}

    Set Focus To Element    ${MEDIAITEM_DETAIL.SAVE.BTN}
    Press Keys      ${None}     HOME
    Wait And Click Element  ${MEDIAITEM_DETAIL.SAVE.BTN}
    Wait And Click Element  ${MEDIAITEM_DETAIL.PUBLISH.BTN}

Unpublish Media Item
    Wait And Click Element  ${MEDIAITEMS_DASHBOARD.UNPUBLISH.BUTTON}
    Wait And Click Element  ${MEDIAITEMS_DASHBOARD.CONFIRM_UNPUBLISH.BUTTON}
    Sleep   1s

Go Back To Dashboard
    Wait And Click Element  ${MEDIAITEM_DETAIL.BACK.BTN}
    Clear Manual Popup

Remove Media After Edit
    [Arguments]     ${item}
    Sort By ID: Descending order
    Wait And Click Element  ${MEDIAITEMS_DASHBOARD.${item}ITEM.ITEM}
    Wait And Click Element  ${MEDIAITEM_DETAIL.DELETE.BTN}
    Wait And Click Element  ${MEDIAITEM_DETAIL.CONFIRM_DELETE.BTN}