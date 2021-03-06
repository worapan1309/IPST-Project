*** Settings ***
Library           SeleniumLibrary    # https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
Library           Collections        # https://robotframework.org/robotframework/latest/libraries/Collections.html

*** Variables ***
${CHROME_DRIVER_PATH_MAC}      ${EXECDIR}${/}drivers${/}chrome${/}mac${/}chromedriver_92
${MS_EDGE_DRIVER_PATH_MAC}     ${EXECDIR}${/}drivers${/}microsoft_edge${/}msedgedriver_92
${FIREFOX_DRIVER_PATH_MAC}     ${EXECDIR}${/}drivers${/}firefox${/}mac${/}geckodriver_0_29_0

${CHROME_DRIVER_PATH_WIN}      ${EXECDIR}${/}drivers${/}chrome${/}window${/}chromedriver_92
${MS_EDGE_DRIVER_PATH_WIN}     ${EXECDIR}${/}drivers${/}microsoft_edge${/}window${/}MicrosoftWebDriver_92
${FIREFOX_DRIVER_PATH_WIN}     ${EXECDIR}${/}drivers${/}firefox${/}window${/}geckodriver_91
${OS}                          WIN

*** Keywords ***
Open Browser And Login: Strapi
    [Arguments]     ${browser}
    Open Browser And Go To URL      ${browser}      ${URL_STRAPI}
    Login: Strapi Website    ${LOGIN_EMAIL_STRAPI}  ${LOGIN_PASSWORD_STRAPI}

Open Safari Browser
    [Arguments]    ${url}
    [Documentation]    How to setup Browser Safari
    ...    1. เปิด Safari ขึ้นมา
    ...    2. ไปที่ Menu Safari > Preference > Tab Advance > Click Checkbox "Show Develop menu in menu bar"
    ...    3. ไปที่ Menu Develop > Click "Allow Remote Automation"
    Run Keyword IF  '${OS}'=='WIN'  Fail    msg=Window don't have Safari Browser
    Open Browser    browser=Safari    url=${url}
    Set Selenium Speed  0.2s
    Maximize Browser Window

Open Chrome Browser
    [Arguments]    ${url}   ${os}
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_experimental_option    useAutomationExtension    ${False}
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    ${options}=     Call Method     ${chrome_options}    to_capabilities
    ${kwargs}=    BuiltIn.Create Dictionary    executable_path=${CHROME_DRIVER_PATH_${os}} 
    log  ${chrome_options}
    Create Webdriver    Chrome    chrome_options=${chrome_options}    kwargs=${kwargs}
    Set Selenium Speed  0.05s
    Maximize Browser Window
    Go To      ${url}

Open Microsoft Edge Browser
    [Documentation]  ถ้าเป็น Microsoft Edge Ver. 81 ขึ้นไป จะต้อง Upgrade pacakage selenium version 4.0.0b2 ถึงจะสามารถใช้งานได้
    ...     pip install -U -pre selenium==4.0.0b2
    [Arguments]    ${url}   ${os}
    ${ms_edge_option} =    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
    Create Webdriver    Edge    executable_path=${MS_EDGE_DRIVER_PATH_${os}} 
    Set Selenium Speed  0.05s
    Maximize Browser Window
    Go To    ${url}

Open Firefox Browser
    [Arguments]    ${url}   ${os}
    ${firefox_options} =     Evaluate    sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys, selenium.webdriver
    Create Webdriver    Firefox    capabilities=${firefox_options}    executable_path=${FIREFOX_DRIVER_PATH_${os}} 
    Set Selenium Speed  0.05s
    Maximize Browser Window
    Go To      ${url}

Close Browser
    SeleniumLibrary.Close All Browsers

Open Browser And Go To URL
    [Arguments]    ${browser}    ${url}     
    Run Keyword If    '${browser}'=='Safari'    Run Keyword      Open Safari Browser    ${url}
    ...    ELSE IF    '${browser}'=='Chrome'    Run Keyword      Open Chrome Browser    ${url}     ${OS} 
    ...    ELSE IF    '${browser}'=='Microsoft Edge' or '${browser}'=='Edge'    Run Keyword      Open Microsoft Edge Browser    ${url}      ${OS}
    ...    ELSE IF    '${browser}'=='Firefox'   Run Keyword      Open Firefox Browser   ${url}     ${OS}
    ...    ELSE       Run Keyword    Fail   ${browser} is not support

Wait And Click Element
    [Arguments]     ${element}
    Wait Until Element Is Visible   ${element}      20s
    Set Focus To Element    ${element}
    Click Element   ${element}

Wait And Fill Text
    [Arguments]     ${locator}      ${text}         
    Wait Until Element Is Visible   ${locator}      20s
    Set Focus To Element    ${locator}
    Input Text      ${locator}   ${text}

Select Dropdown Custom
    [Arguments]     ${loactor_dropdown}    ${value}
    Wait And Fill Text          ${loactor_dropdown}     ${value}
    Wait And Click Element           xpath=//div[@title="${value}"]  