*** Settings ***
Documentation    Set of variables wich describes the growth units.
Variables        ./data_source/growth_units.yaml
Variables        ./data_source/projects.yaml
Variables        ./data_source/sprints.yaml

*** Variables ***
# Project assigments
@{PROJECT_ASSOCIATION}
...    &{ALPHA_TAURI_PROJECTS}
...    &{COLORADO_PROJECTS}
...    &{HADAR_PROJECTS}
...    &{RUBY_PROJECTS}
...    &{SAO_FRANCISCO_PROJECTS}
...    &{TIGRIS_PROJECTS}

# Sprint assigments
@{SPRINTS_ASSOCIATION}
...    &{JJ_PROJECT_SPRINTS}
...    &{FORD_PROJECT_SPRINTS}
...    &{IFOOD_PROJECT_SPRINTS}
...    &{FOOT_LOCKER_PROJECT_SPRINTS}
...    &{SOUNDHOUND_PROJECT_SPRINTS}
...    &{BRADESCO_PROJECT_SPRINTS}
...    &{BRASKEM_PROJECT_SPRINTS}

# Examples for testing
&{homepage}     url=${EMPTY}
&{alpha_tauri_gu}  name=Alpha Tauri    url=alpha-tauri
&{argo_tauri_gu}   name=Argo    url=argo

&{jj_sprint1}    name=Sprint 1    url=alpha-tauri/jj-project/sprint-1
