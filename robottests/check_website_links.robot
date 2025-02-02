*** Settings ***
Resource      resource.robot

Test Setup    Open Browser    ${BASE_URL}    ${BROWSER}
Test Teardown    Close Browser

*** Test Cases ***
Scrumprimer Links  [Template]  Check Resource Exists In Path
    #PATH#         #ACTION#              #CONTENT#
    \              Check Image Exist     /logo/en_scrumprimer.png
    translations   Check Text Exist      Scrum Primer Translations
    overview       Check Image Exist     /overview/en_overview.png
    anime          Check Image Exist     /overview/anime_scrum_overview_small.png
    about          Check Text Exist      Scrum Primer Creation
    contact        Check Text Exist      Feedback

*** Keywords ***
Check Resource Exists In Path
    [Arguments]  ${path}    ${custom_keyword}    ${text}
    Open Page For Path    ${path}
    Run Keyword    ${custom_keyword}    ${text}

Open Page For Path
    [Arguments]    ${path}
    ${url}=  Catenate  SEPARATOR=  ${BASE_URL}  ${path}
    Go To    ${url}

Check Text Exist
    [Arguments]    ${text}
    Page Should Contain  ${text}

Check Image Exist
    [Arguments]    ${image_file_name}
    Page Should Contain Image    ${image_file_name}
