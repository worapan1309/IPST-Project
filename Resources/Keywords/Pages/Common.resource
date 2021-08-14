*** Keywords ***
Wait And Click Element
    [Arguments]     ${element}
    Wait Until Element Is Visible   ${element}
    Click Element   ${element}

Wait And Fill Text
    [Arguments]     ${locator}      ${text}
    Wait Until Element Is Visible   ${locator}
    Input Text      ${locator}   ${text}