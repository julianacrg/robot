*** Settings ***      
Documentation     Upskilling program test features

Resource    ../keywords/form_keywords.robot
Resource    ../resources/variables.robot


Test Teardown        Close Browser

*** Test Cases ***
Scenario 1: List the Projects in a growth unit 
    [Tags]    taur224
    Given That the ${user} accesses the ${homepage_address}
    When The Growth Unit dropdown is visible
    Then The user will be able to select ${gu_test} in the ${field_gu} field

Scenario 2: List the Projects in a growth unit
    [Tags]    taur227
    Given That the user has already selected a Growth Unit ${gu_test}
    When The Project checkbox is enabled
    Then The user will be able to select ${projet_test} in the ${field_project} field

Scenario 3: Growth unit and/or a project can be accessed directly via URL
    [Tags]    taur212
    Try to access all urls in the "${ALL_GROWTH_UNITS}" of field ${field_gu}
    FOR  ${association}  IN  @{PROJECT_ASSOCIATION}
        Try to access all urls in the "${association['projects_data']}" of field ${field_project}
    END

Scenario 4: List of Sprints within a Project 
    [Tags]    taur500
    Given That the user has already selected a project ${projet_test}
    When The Sprint checkbox is enabled
    Then The user will be able to select ${sprint_test} in the ${field_sprint} field

Scenario 5: List of Stories within a Project/Sprint
    #TAUR-996 refactoring TAUR-516
    [Tags]    taur516
    Given That the user has already selected a sprint ${sprint_test}
    When The Story checkbox is enabled
    Then You can see the ${story_test} highlighted option on hover

Scenario 6: Sprint can be accessed directly via URL   
    [Tags]    taur546
    FOR  ${project}  IN  @{SPRINTS_ASSOCIATION}
        Try to access all urls in the "${project['sprints_data']}" of field ${field_sprint}
    END

Scenario 7: Create “Sprint Date” functionality  
    [Tags]    taur990
    Given That the user has already selected a sprint ${sprint_test}
    When The field "${field_data_from}" is visible
    Then The field "${field_data_unitl}" is visible

Scenario 8: Create “Search” field functionality  
    [Tags]    taur980
    Given The is visible ${field_search} is visible
    When The Story checkbox is enabled