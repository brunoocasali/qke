# Quake Log Parser!

[![wercker status](https://app.wercker.com/status/fe8cc0e5d4b85d476a540bc32a0c7a95/s/master "wercker status")](https://app.wercker.com/project/byKey/fe8cc0e5d4b85d476a540bc32a0c7a95)
[![Code Climate](https://codeclimate.com/github/brunoocasali/quake_log_parser/badges/gpa.svg)](https://codeclimate.com/github/brunoocasali/quake_log_parser)
[![Test Coverage](https://codeclimate.com/github/brunoocasali/quake_log_parser/badges/coverage.svg)](https://codeclimate.com/github/brunoocasali/quake_log_parser/coverage)
[![Issue Count](https://codeclimate.com/github/brunoocasali/quake_log_parser/badges/issue_count.svg)](https://codeclimate.com/github/brunoocasali/quake_log_parser)

#### Contents:
  - **[WHAT I NEED TO SOLVE? (problem description, PT)](/TEST.md)**
  - [About - PT](#about-solution-pt)
  - [About - EN](#about-solution-en)
  - [To Get Working](#to-get-working)
  - [Run Tests](#run-tests)
  - [Run App](#run-app)
  - [Contribute](#contribute)


### About Solution [PT]:
  
  **Virtudes:**
  
  Para resolver o problema em questão, pensei em deixá-lo da forma mais aberta possível, primando pela criação de novas funcionalidades e possibilitando um baixo acoplamento.
  
  Usei a gem [Yamlet](https://github.com/rbmrclo/yamlet) para criar uma forma extremamente simples de salvar as informações obtidas, (não queria fazer in-memory).
  
  Adotei em sua maioria o pattern [Template Method](https://github.com/nslocum/design-patterns-in-ruby#template-method) para que possibilitasse implementar novas funcionalidades instantâneamente, e o melhor, sem precisar alterar o código legado. É possível analisar essa estrutura ao acessar a classe `Rule`(`rule.rb`).
  
  Para cada linha do log uma regra diferente seria criada, ex: `KillRule` diz respeito as linhas com `Kill:` / `Item:` se quisesse descobrir quais items foram coletados... Enfim, isso possibilita que as outras regras não interfiram.
  
  **Problemas:**
  
  Infelizmente nem tudo são flores, a solução é um tanto quanto lenta, pois o arquivo yml não está preparado para tais acessos de I/O simultâneos, quem sabe algo mais assíncrono caia melhor. Ou uma mudança no formato de armazenamento.

### About Solution [EN]:

  **Virtues:**
  
  To resolve the issue in question, I thought I'd leave it as openly as possible, striving for the creation of new features and enabling a low coupling.
  
  I used the gem [Yamlet] (https://github.com/rbmrclo/yamlet) to create an extremely simple way to save the information obtained, (did not want to do in-memory).
  
  Adopted mostly the pattern [Template Method] (https://github.com/nslocum/design-patterns-in-ruby#template-method) that would enable to implement new features instantly, and the best, without having to change the code legacy. You can analyze this structure to access the `Rule` class (` rule.rb`).
  
  For each log line a different rule would be created, eg `KillRule` concerns lines with` Kill: `/` Item: `if you wanted to find out what items were collected... Anyway, it enables other rules do not interfere.
  
  **Problems:**
  
  Unfortunately not everything is perfect, the solution is somewhat slow because the yml file is not prepared for such access I / O simultaneously, perhaps something more asynchronous fall better. Or a change in storage size.
  
### To Get Working:

- `$ git clone git@github.com:brunoocasali/quake_log_parser.git`
- `$ cd quake_log_parser`
- `$ bundle install`

### Run Tests:

- `$ rspec`

### Run App:

- `$ ruby app.rb`
 

### Contribute:

  See the issues page [/issues](https://github.com/brunoocasali/quake_log_parser/issues)



by: **Bruno Casali**, @brunoocasali
