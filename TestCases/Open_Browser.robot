*** Settings ***
Resource    ../Resources/Keywords/Pages/Common.resource

Test Teardown   Common.Close Browser


*** Test Cases ***
TC001 : Open Safari Browser
    Open Browser And Go To URL    Safari    https://www.google.com/?client=safari

TC002 : Open Chrome Browser
    Open Browser And Go To URL    Chrome    https://www.google.com/

TC003 : Open Microsoft Edge Browser
    Open Browser And Go To URL    Microsoft Edge    https://www.google.com/

TC004 : Open Edge Browser
    Open Browser And Go To URL    Edge    https://www.google.com/

TC005 : Open Firefox Browser
    Open Browser And Go To URL    Firefox    https://www.google.com/