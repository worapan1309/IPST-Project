*** Settings ***
Variables         ${EXECDIR}${/}TestData${/}environment.yaml

*** Variables ***
${MEDIAITEM_DETAIL.MEDIAITEM.MENU}  xPath=//span[@class="sc-hYAvag jfgTmU" and contains(text(), 'MediaItems')]
${MEDIAITEM_DETAIL.ADDMEDIA.BTN}  xPath=//button[@class="sc-dlfnbm loMFwz"]
${MEDIAITEM_DETAIL.SLUG.FIELD}    xPath=//input[@name="slug"]
${MEDIAITEM_DETAIL.TITLE.FIELD}    xPath=//input[@name="title"]
${MEDIAITEM_DETAIL.DESCRIPTION.FIELD}    xPath=//input[@class="editorInput"]
${MEDIAITEM_DETAIL.SEO_DESCRIPTION.FIELD}    xPath=//textarea[@name="seoDescription"]
${MEDIAITEM_DETAIL.SUBJECT.DROPDOWN}    xPath=//select[@name="subject"]
${MEDIAITEM_DETAIL.EDUCATION_LEVEL.DROPDOWN}    xPath=//select[@name="educationLevel"]
${MEDIAITEM_DETAIL.CATEGORY.DROPDOWN}    xPath=//select[@name="category"]
${MEDIAITEM_DETAIL.COVERIMAGE.SELECT}   xPath=//div[@class="sc-cZHnwi jxfNpE"]
${MEDIAITEM_DETAIL.SELECTED.IMG}   xPath=(//div[@class="sc-ksSWxP hBuYJf"])[1]
${MEDIAITEM_DETAIL.FINISH.BTN}    xPath=//button[@class="sc-dlfnbm cDlQQu" and @type="button"]
${MEDIAITEM_DETAIL.METADATA.FIELD}    xPath=//input[@name="metadata"]
${MEDIAITEM_DETAIL.PREVIEW_TYPE.DROPDOWN}    xPath=//select[@name="previewType"]
${MEDIAITEM_DETAIL.PREVIEW_URL.FIELD}    xPath=//input[@name="previewURL"]
${MEDIAITEM_DETAIL.DOWNLOAD_URL.FIELD}    xPath=//input[@name="downloadURL"]
${MEDIAITEM_DETAIL.EMBEDED_CODE.FIELD}    xPath=//textarea[@name="embeddedCode"]
${MEDIAITEM_DETAIL.SAVE.BTN}  xPath=//button[@class="sc-dlfnbm cDlQQu" and @type="submit"]
${MEDIAITEM_DETAIL.PUBLISH.BTN}    xPath=//button[contains(text(),"Publish")]  
${MEDIAITEM_DETAIL.BACK.BTN}    xPath=//div[@class="sc-laRPJI eNpfYQ"]
${MEDIAITEM_DETAIL.ID.SORT}    xPath=(//span[@class="sortable"])[1]

${MEDIAITEM_DETAIL.LASTESTITEM_VDO.ITEM}    xPath=//p[@class="sc-jMlkEa fmBJFo"]//span[contains(text(),"${TITLE_MEDIA_VDO}")]
${MEDIAITEM_DETAIL.LASTESTITEM_PDF.ITEM}    xPath=//p[@class="sc-jMlkEa fmBJFo"]//span[contains(text(),"${TITLE_MEDIA_PDF}")]
${MEDIAITEM_DETAIL.LASTESTITEM_EXERCISE.ITEM}    xPath=//p[@class="sc-jMlkEa fmBJFo"]//span[contains(text(),"${TITLE_MEDIA_EXERCISE}")]

${MEDIAITEM_DETAIL.LASTESTITEM_VDO_FIND_SLUG.ITEM}    xPath=//p[@class="sc-jMlkEa fmBJFo"]//span[contains(text(),"${SLUG_MEDIA_VDO}")]
${MEDIAITEM_DETAIL.LASTESTITEM_PDF_FIND_SLUG.ITEM}    xPath=//p[@class="sc-jMlkEa fmBJFo"]//span[contains(text(),"${SLUG_MEDIA_PDF}")]
${MEDIAITEM_DETAIL.LASTESTITEM_EXERCISE_FIND_SLUG.ITEM}    xPath=//p[@class="sc-jMlkEa fmBJFo"]//span[contains(text(),"${SLUG_MEDIA_EXERCISE}")]

${MEDIAITEM_DETAIL.DELETE.BTN}      xPath=//div[@class="sc-lcTPrS sc-lnnytw damQna bCARSy"]
${MEDIAITEM_DETAIL.CONFIRM_DELETE.BTN}      xPath=//button[@class="sc-dlfnbm cMRVOr"]

${MEDIAITEM_DETAIL.ERROR_SLUG.MSG}  xPath=//p[@class="sc-kEjbxe jbJDWL" and @id="error-slug"]
${MEDIAITEM_DETAIL.ERROR_TITLE.MSG}  xPath=//p[@class="sc-kEjbxe jbJDWL" and @id="error-title"]
${MEDIAITEM_DETAIL.ERROR_SEO.MSG}  xPath=//p[@class="sc-kEjbxe jbJDWL" and @id="error-seoDescription"]
${MEDIAITEM_DETAIL.ERROR_SUB.MSG}  xPath=//p[@class="sc-kEjbxe jbJDWL" and @id="error-subject"]
${MEDIAITEM_DETAIL.ERROR_EDLV.MSG}  xPath=//p[@class="sc-kEjbxe jbJDWL" and @id="error-educationLevel"]
${MEDIAITEM_DETAIL.ERROR_CAT.MSG}  xPath=//p[@class="sc-kEjbxe jbJDWL" and @id="error-category"]
${MEDIAITEM_DETAIL.ERROR_IMG.MSG}  xPath=//p[@class="sc-kEjbxe jbJDWL" and @id="error-coverImage"]
${MEDIAITEM_DETAIL.ERROR_META.MSG}  xPath=//p[@class="sc-kEjbxe jbJDWL" and @id="error-metadata"]
${MEDIAITEM_DETAIL.ERROR_PRETYPE.MSG}  xPath=//p[@class="sc-kEjbxe jbJDWL" and @id="error-previewType"]
${MEDIAITEM_DETAIL.ERROR_PREURL.MSG}  xPath=//p[@class="sc-kEjbxe jbJDWL" and @id="error-previewURL"]
${MEDIAITEM_DETAIL.ERROR_DOWNLOAD.MSG}  xPath=//p[@class="sc-kEjbxe jbJDWL" and @id="error-downloadURL"]

${MEDIAITEM_DETAIL.BASKETS.DROPDOWN}    xPath=//*[@id="react-select-2-input"]