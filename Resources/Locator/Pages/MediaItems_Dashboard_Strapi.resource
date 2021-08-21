*** Settings ***
Variables         ${EXECDIR}${/}TestData${/}environment.yaml

*** Variables ***
${MEDIAITEMS_DASHBOARD.COPY.BUTTON}     xPath=((//div[@class="sc-dIUggk XavQL"])[1]/button)[1]
${MEDIAITEMS_DASHBOARD.EDIT.BUTTON}     xPath=((//div[@class="sc-dIUggk XavQL"])[1]/button)[2] 
${MEDIAITEMS_DASHBOARD.DELETE.BUTTON}   xPath=((//div[@class="sc-dIUggk XavQL"])[1]/button)[3]

${MEDIAITEMS_DASHBOARD.ID.SORT}    xPath=(//span[@class="sortable"])[1]
${MEDIAITEMS_DASHBOARD.ORIGINITEM.ITEM}    xPath=//p[@class="sc-jMlkEa fmBJFo"]//span[contains(text(),"${TITLE_MEDIA_VDO}")]
${MEDIAITEMS_DASHBOARD.LASTESTITEM.ITEM}    xPath=//p[@class="sc-jMlkEa fmBJFo"]//span[contains(text(),"${TITLE_MEDIA_CRUD}")]

${MEDIAITEMS_DASHBOARD.UNPUBLISH.BUTTON}    xPath=//button[@class="sc-dlfnbm loMFwz"]
${MEDIAITEMS_DASHBOARD.CONFIRM_UNPUBLISH.BUTTON}    xPath=//button[@class="sc-dlfnbm cMRVOr"]

${MEDIAITEMS_DASHBOARD.CONFIRM_DELETE.BUTTON}    xPath=//button[@class="sc-dlfnbm cMRVOr"]