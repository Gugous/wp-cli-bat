@echo off
cls
echo ##################################################################
echo Bem vindo a instalacao do Wordpress no ambiente de desenvolvimento
echo ##################################################################
echo.
echo Informe do site que fica apos a / do localhost

set /p urlsite=Digite o nome:

REM Baixa os arquivos do WordPress
start wp core download --locale=pt_BR
echo Baixando o Wordpress...
pause
echo.
 
REM Cria o wp-config.php
start wp config create --dbhost=localhost --dbname=%urlsite% --dbuser=root --dbpass="" --locale=pt_BR
echo Criando o arquivo wp-config.php...
pause
echo.

REM Criando a base de dados
start wp db create
echo Criando a base de dados...
pause
echo.
 
REM Instala o WordPress
start wp core install --url="http://localhost/%urlsite%" --title="Teste WP-CLI" --admin_user=admin --admin_password=admin --admin_email=teste@dominio.com.br --skip-email
echo Instalando o Wordpress...
pause
echo.
 
REM Baixa os plugins
start wp plugin install contact-form-7 wordpress-seo
echo Bainxando plugins basicos...
pause
echo.
 
REM Baixa a tradução dos plugins
start wp language plugin install pt_BR --all
echo Baixando tradução dos plugins...
pause
echo.
 
REM Ativa os plugins
start wp plugin activate contact-form-7 wordpress-seo
echo Ativando os plugins...
pause
echo.
 
REM Baixa tema ASTRA
start wp theme install Astra
echo Baixando o tema ASTRA...
pause
echo.
 
REM Ativa o ASTRA
start wp theme activate Astra
echo Ativando o tema ASTRA...
pause
echo.
 
echo Pronto. Finalizado! Nem doeu...
pause > nul