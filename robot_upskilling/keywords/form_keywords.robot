
*** Settings ***      
Library     SeleniumLibrary
Library     DebugLibrary
Library     Collections
Library     yaml
Library     String
Library     RequestsLibrary
Resource    ../components/form_components.robot

*** Keywords ***
That the ${user} accesses the ${homepage_address}
    Open Browser    ${homepage_address}    chrome

The Growth Unit dropdown is visible
    Wait until element is visible   ${field_gu}

Validate list GU ${field_test}
    #${unselected_option}    
    ${list_field_gu}    Get List Items    ${field_test}
    #Remove Values From List      ${list_field_gu}   ${unselected_option}
    Lists Should Be Equal        ${list_field_gu}   ${list_growth_unit}  ignore_order=False

Validate list project ${field_test}
    No Operation

Validate list sprint ${field_test}
    No Operation

Validate list stories ${field_test}
    No Operation

Validate list ${field_test}
    Run Keyword If    '${field_test}' == '${field_gu}'    Validate list GU ${field_test}
    ...    ELSE IF    '${field_test}' == '${field_project}'    Validate list project ${field_test}
    ...    ELSE IF    '${field_test}' == '${field_sprint}'    Validate list sprint ${field_test}
    ...    ELSE IF    '${field_test}' == '${field_story}'    Validate list stories ${field_test}
    ...    ELSE        log    Unrecognized field.    WARN

The user will be able to select ${option_test} in the ${field_test} field
    Wait until element is visible  ${field_test}
    Scroll Element Into View  ${field_test}
    Validate list ${field_test}
    Select From List By Label  ${field_test}  ${option_test}
    Capture Page Screenshot

That the user has already selected a Growth Unit ${GU}
    That the ${user} accesses the ${homepage_address}
    Scroll Element Into View  ${field_gu}
    Select From List By Label  ${field_gu}  ${GU}

The Project checkbox is enabled
    Element Should Be Enabled  ${field_project} 

That the user has already selected a project ${project}
    That the user has already selected a Growth Unit ${gu_test}
    Select From List By Label    ${field_project}    ${project}

The Sprint checkbox is enabled
    Element Should Be Enabled  ${field_sprint}

The Story checkbox is enabled
    Element Should Be Enabled  ${field_story}

That the user has already selected a sprint ${sprint}
    That the user has already selected a project ${projet_test}
    Select From List By Label    ${field_sprint}    ${sprint}

Get The Url From
    [Arguments]  ${target_data}
    ${url}=    Set Variable    ${homepage_address}/${target_data['url']}
    [Return]    ${url}

The user access the "${page}" url
    ${url}=  Get The Url From    ${page}
    ${response}=          GET    ${url}
    Open Browser    ${url}    chrome
    Set Test Variable            ${url_response}  ${response}

The status shall be "${status_code}"
    Should Be Equal    ${url_response.status_code}  ${status_code}

Try to access all urls in the "${list}" of field ${filed_name}
    FOR  ${item}  IN  @{list}
        Given The user access the "${item}" url
        Then The status shall be "${200}"
        Checks if "${item}" was selected in field ${filed_name}
    END

Checks if "${item}" was selected in field ${filed_name}
    ${selected}  Get Selected List Label  ${filed_name}
    Should be equal  ${selected}  ${item['name']}
    Close Browser

You can see the ${chosen_option} highlighted option on hover    
    Wait Until Element Is Visible    ${chosen_option}
    Mouse down    ${chosen_option}
    Capture Page Screenshot

The field "${field_name}" is visible
    Element Should Be Visible    ${field_name}
