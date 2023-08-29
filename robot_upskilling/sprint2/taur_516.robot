*** Settings ***      
Documentation     Scenario: List of Stories within a Project/Sprint

Resource    ../keywords/form_keywords.robot
Resource    ../resources/variables.robot

*** Keywords ***
Get The Url From
    [Arguments]  ${target_data}
    ${url}=    Set Variable    ${homepage_address}/${target_data['url']}
    [Return]    ${url}

The user selects the "${option}" option
    ${url_new}=  Set Variable    ${url}/${option}
    Go To   ${url_new}

The "${field}" field will be enabled and without errors


*** Test Cases ***
 
Test case: Sprint that has history
    Given The ${user} selects the "${ALPHA_TAURI_PROJECTS}" option
    When The
    Then The "${field_stories}" field will be enabled and without errors


