*** Settings ***
Documentation  Form components

*** Variables ***
${user}
${homepage_address}    https://upskilling2023:2k23%5Et4ur@release-team-1.d2llxmc59vnghi.amplifyapp.com
${field_gu}            xpath://select[@id="unit-select"]
${field_project}       xpath://select[@id="project-select"]
${field_sprint}        xpath://select[@id="sprint-select"]
${field_story}         xpath://div[@id="story-list"]
${field_data_from}     xpath://div[@id="sprint-date-from"]
${field_data_unitl}    xpath://div[@id="sprint-date-until"]
${field_search}        xpath://div[@id="story-search"]


#//div[contains(text(),'AFXW-10085')]


@{list_growth_unit}    Select a Growth Unit    Alpha Tauri    Argo    Centelha    Colorado    Delta    Diamond    Everest    
...    Hadar    Harmony    Iguazu    Jupiter    Kappa    Kilimanjaro    Lovelace    Lumiere    Matilda
...    Olympus    Proxima    Pyxis    Ruby    São Francisco    Sapphire    Saturn    Sena    Theta
...    Tigris    Topaz    Zeta Tauri


${gu_test}        Alpha Tauri
${projet_test}    J&J Project
${sprint_test}    Sprint 1
${story_test}     //div[contains(@data-story-id,'AFXW-10085')]
