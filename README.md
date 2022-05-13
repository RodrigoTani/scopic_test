# Automação

## Dependencies

* Ruby 2.6.6

## Installation Instructions

### Recommendations

* Use RVM to handle rubies and gemsets

* See installation instructions here (https://rvm.io/rvm/install)

* Install bundler

        $ gem install bundler

* Project Installation

        $ git clone https://github.com/RodrigoTani/automation_test.git
        $ bundle install

## Instalação do Ruby - (https://www.ruby-lang.org/pt/documentation/installation/)
* Windows: https://rubyinstaller.org/downloads/
* Linux: 
        $ sudo apt-get install ruby-full
* macOS: 
        brew install ruby

Após a instalação baixar o ChromeDriver referente a mesma versão de seu Chrome
* Chromedriver: https://chromedriver.chromium.org/downloads

Após o download do Chomedriver extrair  o arquivo .rar e adicionar o arquivo 'chromedriver.exe' na pasta C:\Ruby26-x64\bin

Abrir o Terminal (cmd, powershell, etc...)
Ir na raiz da pasta do projeto da automação

* Executar o seguinte comando no terminal: 
        $ cucumber -t '@teste_completo'

