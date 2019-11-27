## Todo

=======

**Todo** é uma aplicação feita como teste para vaga de Dev.

## Setup do Projeto

### 
Pré requisitos

 - Ter [Ruby](https://www.ruby-lang.org) versão 2.6.3 previamente instalado na máquina
 - Ou Ter [Docker] na maquina


### Configurando e executando testes

 - `bin/setup`
 - `bundle exec rspec`

#### Configurando via Docker
 - `docker-compose build`
 - `docker-compose run --rm app bin/setup`
 - `docker-compose run --rm --service-ports app bash`
 - `bundle exec rspec`

### Executando a aplicação 'nativo' 

Após os passos de configuração executar o comando `rails server` e acessar pela
url [http://localhost:3000/](http://localhost:3000/).

#### Executando via Docker
 - `docker-compose build`
 - `docker-compose run --rm app bin/setup`
 - `docker-compose run --rm app rails assets:precompile`
 - `docker-compose up`


### Principais contribuidores
 
[mavmaso](https://github.com/mavmaso)
