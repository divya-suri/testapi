*** Setting ***
Library  RequestsLibrary
Library  Collections
Library  String

*** Variables ***

${TOKEN}=   'Token token= "688da6924c4745154fdd01eab1ae56f2911968539c34dd811bb0e754e21d"
#@{token and phone access} =  688da6924c4745154fdd01eab1ae56f2911968539c34dd811bb0e754e21d  RzJewIQtrI9X-tPJqeuwH6Jel-9W0TEe6s15L_kLhO1UgfD84ORpcA

*** Test Cases ***
tc-1 signup
    [Tags]  signup
    Create Session  testcase1  https://stagapi.1mgdoctors.com
    ${phone}  Set Variable  ${9870456122}
    ${body}=  create dictionary  name=prachi  mobile_number=${phone}  activation_code=wgw32  password=Testingg  email=prachi@gmail.com
    ${header}=  create dictionary  Content-Type=application/json  authorization=${TOKEN}
    ${response}=  Post Request  testcase1  /api/iip/doctor/signup  headers=${header}   data=${body}
    log to console  ${response.status_code}
    Should Be Equal As Strings  ${response.status_code}  200
    log to console  ${response.content}


tc-2 get dcp quota
     [Tags]  dcp
     Create Session  testcase1  https://stagapi.1mgdoctors.com/api
     ${token} =  Set Variable  688da6924c4745154fdd01eab1ae56f2911968539c34dd811bb0e754e21d
     ${phone_access token} =  Set Variable  RzJewIQtrI9X-tPJqeuwH6Jel-9W0TEe6s15L_kLhO1UgfD84ORpcA
     ${header}=  create dictionary  Content-Type=application/json  authorization=${token}  ${phone_access token}
     ${response}=  Get Request  testcase1  /iip/doctor/dcp-quota  headers=${header}
     log to console  ${response.status_code}
     Should Be Equal As Strings  ${response.status_code}  200
     log to console  ${response.content}
