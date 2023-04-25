*** Settings ***
Library   SeleniumLibrary 

*** Variables ***

${URL}         http://www.amazon.com.br/
${MENU_ELETRONICOS}       //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELOTRONICOS}     //h1[contains(.,'Eletrônicos e Tecnologia')]   
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia        
${PESQUISA}                    field-keywords

*** Keywords ***

Abrir o navegador                        
    Open Browser           browser=chrome
    Maximize Browser Window    

Fechar o navegador
    Capture Page Screenshot
    Close Browser        

Acessar a home page do site Amazon.com.br
    Go To             url=${URL}  
    Wait Until Element Is Visible        locator=${MENU_ELETRONICOS}      timeout=7s

Entrar no menu "Eletrônicos"
    Click Element   locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains      text=${TEXTO_HEADER_ELETRONICOS}     
    Wait Until Element Is Visible   locator=${HEADER_ELOTRONICOS}      

Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Title Should Be    title=Eletrônicos e Tecnologia | Amazon.com.br

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible        locator=//img[contains(@alt,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text        locator=${PESQUISA}   text=${PRODUTO}

Clicar no botão pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
     Wait Until Element Is Visible        locator=(//span[contains(.,'${PRODUTO}')])[2]    timeout=10