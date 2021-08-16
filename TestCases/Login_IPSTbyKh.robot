*** Settings ***

Resource    ${EXECDIR}${/}Resources${/}Keywords${/}Pages${/}Common.resource
Variables   ${EXECDIR}${/}TestData${/}environment.yaml
Variables   ../TestData/environment.yaml
Variables   ../TestData/data.yaml
Resource    ../Resources/Keywords/Pages/Common.resource
Resource    ../Resources/Keywords/Pages/Login_IPST.resource
Resource    ../Resources/Locator/Pages/Login_IPST.resource
# Test Teardown   Common.Close Browser


*** Test Cases ***
# Open Chrome Success
#     Open Chrome Browser  ${URL_IPST}

Open Browser
    Open Browser And Go To URL  Chrome      ${URL_IPST}     WIN
    Open Browser And Go To URL  Firefox     ${URL_IPST}     WIN
    Open Browser And Go To URL  Edge        ${URL_IPST}     WIN
    Open Browser And Go To URL  Safari      ${URL_IPST}     WIN



