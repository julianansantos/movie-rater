# MovieRater


#### Descrição:

Este projeto é uma aplicação para avaliação de filmes e foi desenvolvida utilizando o framework Ruby on Rails.

- Desafio:

   - [x] Criar uma rota para importar em massa vários filmes
      -   Você pode criar essa rota para receber um arquivo csv ou um payload json, ou outra forma que ficar mais fácil de integrar
   - [x] Criar uma rota para submeter notas em massa para vários filmes
      -   Você pode criar essa rota para receber um arquivo csv ou um payload json, ou outra forma que ficar mais fácil de integrar
   - [x] As tarefas acima devem ser executadas em segundo plano
      -   Recomendamos usar o Sidekiq para gerenciar as tarefas em segundo plano, mas você pode escolher outra solução

- Pontos Extras:

    - [ ] Criar testes para as rotas da API e models da aplicação
       -  Recomendamos usar o Rspec para os testes, mas você pode escolher outra solução

---------------------------------
### Tutorial para rodar o projeto

Aqui você encontrará o passo a passo para instalar o projeto corretamente em sua máquina local.

#### Requisitos:
**1. Caso utilize Docker**
- docker 
- docker-compose
  
**2. Sem o Docker**
- ruby-3.1.4
- sqlite3
- redis 7.7
---------------------------------
### Instalação:

#### 1. Github

Para instalar o projeto você precisa clonar o repositório na branch main 

Using https:

```sh
$ git clone https://github.com/julianansantos/movie-rater.git
```

or using ssh:

```sh
$ git clone git@github.com:julianansantos/movie-rater.git
```
#### 2. Executando com o Docker
Para rodar a aplicação:

1. Rode o comando: 
```sh
$ docker compose up
```

#### 3. Executando sem o Docker
Instale as dependências do projeto:
```sh
  bundle install
```
Para configurar o banco de dados: 
```sh
  rails db:migrate
  rails db:seed
```

Para iniciar o servidor Rails:
```sh
$ rails server
```

Para executar o Sidekiq:
```sh
$ bundle exec sidekiq
```
