*** Settings ***
Library         SeleniumLibrary
Library         String
Variables       ${EXECDIR}${/}TestData${/}environment.yaml
Resource        ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Resource        ${EXECDIR}${/}Resources${/}Locator${/}Pages${/}MediaItem_Detail_Strapi.resource

*** Variables ***
@{LIST_FIELDS}=     slug    title   des     seo     sub     edLV    cat     img     meta    preType     preURL      download    embed

*** Keywords ***
Select Dropdown
    [Arguments]     ${locator}  ${select}   
    Wait Until Element Is Visible       ${locator}
    Click Element  ${locator}
    Wait Until Element Is Visible       xPath=//option[contains(text(),"${select}")]
    Click Element    xPath=//option[contains(text(),"${select}")]

Select Cover Image
    Wait And Click Element  ${MEDIAITEM_DETAIL.COVERIMAGE.SELECT}
    Wait And Click Element  ${MEDIAITEM_DETAIL.SELECTED.IMG}
    Wait And Click Element  ${MEDIAITEM_DETAIL.FINISH.BTN} 

Sort By ID: Descending order
    Wait And Click Element  ${MEDIAITEM_DETAIL.ID.SORT}
    Wait And Click Element  ${MEDIAITEM_DETAIL.ID.SORT}

Clear Manual Popup
    Wait And Click Element  xPath=//button[@class="active"]

Add Media Item Except
    [Arguments]     ${type}     ${except}=None
    ${args}=    Copy LIST   ${LIST_FIELDS}
    Remove Values From List     ${args}     ${except}
    ${CHECK_CONDITION}=     Set Variable    '${except}'=='slug' or '${except}'=='title' or '${except}'=='sub' or '${except}'=='edLV' or '${except}'=='cat' or '${except}'=='img' or '${except}'=='preType' or '${except}'=='preURL' or '${except}'=='download'
    Wait And Click Element  ${MEDIAITEM_DETAIL.MEDIAITEM.MENU}
    Wait And Click Element  ${MEDIAITEM_DETAIL.ADDMEDIA.BTN}

    FOR    ${item}    IN    @{args}
        Run Keyword If  '${item}'=='slug'       Wait And Fill Text  ${MEDIAITEM_DETAIL.SLUG.FIELD}  ${SLUG_MEDIA_${type}}
        ...    ELSE IF  '${item}'=='title'      Wait And Fill Text  ${MEDIAITEM_DETAIL.TITLE.FIELD}  ${TITLE_MEDIA_${type}}
        ...    ELSE IF  '${item}'=='des'        Wait And Fill Text  ${MEDIAITEM_DETAIL.DESCRIPTION.FIELD}  ${DESCRIPTION_MEDIA_${type}}
        ...    ELSE IF  '${item}'=='seo'        Wait And Fill Text  ${MEDIAITEM_DETAIL.SEO_DESCRIPTION.FIELD}  ${SEO_DESCRIPTION_MEDIA_${type}}
        ...    ELSE IF  '${item}'=='sub'        Select Dropdown     ${MEDIAITEM_DETAIL.SUBJECT.DROPDOWN}    ${SUBJECT_MEDIA_${type}}
        ...    ELSE IF  '${item}'=='edLV'       Select Dropdown     ${MEDIAITEM_DETAIL.EDUCATION_LEVEL.DROPDOWN}    ${EDUCATION_LEVEL_MEDIA_${type}}
        ...    ELSE IF  '${item}'=='cat'        Select Dropdown     ${MEDIAITEM_DETAIL.CATEGORY.DROPDOWN}    ${CATEGORY_MEDIA_${type}}
        ...    ELSE IF  '${item}'=='img'        Select Cover Image
        ...    ELSE IF  '${item}'=='meta'       Wait And Fill Text  ${MEDIAITEM_DETAIL.METADATA.FIELD}  ${METADATA_MEDIA_${type}}
        ...    ELSE IF  '${item}'=='preType'    Select Dropdown     ${MEDIAITEM_DETAIL.PREVIEW_TYPE.DROPDOWN}   ${PREVIEW_TYPE_MEDIA_${type}}
        ...    ELSE IF  '${item}'=='preURL'     Wait And Fill Text  ${MEDIAITEM_DETAIL.PREVIEW_URL.FIELD}   ${PREVIEW_URL_MEDIA_${type}}
        ...    ELSE IF  '${item}'=='download'   Wait And Fill Text  ${MEDIAITEM_DETAIL.DOWNLOAD_URL.FIELD}  ${DOWNLOAD_URL_MEDIA_${type}}
        ...    ELSE IF  '${item}'=='embed'      Wait And Fill Text  ${MEDIAITEM_DETAIL.EMBEDED_CODE.FIELD}  ${EMBEDED_CODE_MEDIA_${type}}
    END


    Set Focus To Element    ${MEDIAITEM_DETAIL.SAVE.BTN}
    Press Keys      ${None}     HOME
    Select Dropdown Custom  //*[@id="react-select-2-input"]     โลก ดาราศาสตร์ และอวกาศ เล่ม ๓
    Wait And Click Element  ${MEDIAITEM_DETAIL.SAVE.BTN}
    Wait And Click Element  ${MEDIAITEM_DETAIL.PUBLISH.BTN}
    ${var_name}=    Convert To Upper Case       ${except}

    Run Keyword If  ${CHECK_CONDITION}
    ...     Element Should Be Visible   ${MEDIAITEM_DETAIL.ERROR_${var_name}.MSG} 
    
    Remove Media    ${type}

Remove Media
    [Arguments]     ${type}
    Wait And Click Element  ${MEDIAITEM_DETAIL.BACK.BTN}
    Sort By ID: Descending order
    
    ${status}   ${value}=   Run Keyword And Ignore Error    Wait And Click Element  ${MEDIAITEM_DETAIL.LASTESTITEM_${type}.ITEM}
    Run Keyword If  '${status}' == 'FAIL'   Wait And Click Element  ${MEDIAITEM_DETAIL.LASTESTITEM_${type}_FIND_SLUG.ITEM}
    
    Clear Manual Popup
    Wait And Click Element  ${MEDIAITEM_DETAIL.DELETE.BTN}
    Wait And Click Element  ${MEDIAITEM_DETAIL.CONFIRM_DELETE.BTN}

Teardown For Failed
    [Arguments]     ${type}     ${attribute}
    Remove Media    ${type}
    Fail    '${attribute}' field needs to be filled information, but it can be published even the field is empty.
    Close Browser  