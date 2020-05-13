*** Settings ***
Documentation    Suite description
Library             SeleniumLibrary
Library             String


*** Test Cases ***
Headless Chrome - Create Webdriver
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    no-sandbox
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    ${options}=     Call Method     ${chrome_options}    to_capabilities
    Create Webdriver    Remote   command_executor=http://localhost:4444/wd/hub    desired_capabilities=${options}
    Go to     http://cnn.com
    Maximize Browser Window
    Capture Page Screenshot
    Close Browser

Headless Chrome - Open Browser
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    no-sandbox
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    ${options}=     Call Method     ${chrome_options}    to_capabilities
    Open Browser    http://cnn.com    browser=chrome    remote_url=http://localhost:4444/wd/hub     desired_capabilities=${options}
    Maximize Browser Window
    Capture Page Screenshot
    Close Browser
