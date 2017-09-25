API Jogos Olímpicos
---

### Requisitos:
- desenvolvimento api REST
- apenas modalidades `100m Rasos` e `Lançamento de Dardo`
- cadastro de resultados da competição
- finalizar competição
- retornar ranking parcial/final de cada modalidade

### Modelagem*:

- competitions
  - name => varchar(100) not null
  - slug => varchar(100) not null unique
  - place => varchar(100) not null

- modalities
  - name => varchar(100) not null
  - slug => varchar(100) not null unique
  - measurement_unity => varchar(20) not null
  - ended_at => datetime null
  - *competition_id* => foreign key competitions.id

- stages
  - name => varchar(50) not null unique by *modality_id*
  - slug => varchar(50) not null unique by *modality_id*
  - allowed_batteries => integer not null
  - *modality_id* => foreign key modalities.id

- batteries
  - number => integer not null unique by *stage_id*
  - max_tries => integer not null default(1)
  - max_athletes => integer not null default(8)
  - *stage_id* => foreign key stages.id

- results
  - athlete => varchar(100) not null
  - country => varchar(3) not null
  - value => decimal(6,3) not null
  - *battery_id* => foreign key batteries.id

(*) todas as tabelas contém `timestamps` e `surrogate key` **id** como chave primária (PK)

### Rotas*:

```
GET - retorna dados sobre a competição Jogos Olímpicos Rio 2016
/api/competitions
api/competitions#index

GET - retorna todas as modalidades (100m Rasos e Lançamento de Dardo)
/api/competitions/:competition_slug/modalities
api/modalities#index

GET - retorna todas as etapas (ex.: eliminatórias, semifinais, final)
/api/competitions/:competition_slug/modalities/:modality_slug/stages
api/stages#index

GET - retorna todas as baterias
/api/competitions/:competition_slug/modalities/:modality_slug/stages/:stage_slug/batteries
api/batteries#index

POST - cadastra resultados
/api/competitions/:competition_slug/modalities/:modality_slug/stages/:stage_slug/batteries/:battery_number/results
api/results#create

GET - retorna resultado parcial/final
/api/competitions/:competition_slug/modalities/:modality_slug/stages/:stage_slug/batteries/:battery_number/results
api/results#index
```

(*) formato utilizado para retorno das requisições é `JSON`

### Melhorias:

- A validação deve ser feita também à nível de modelo, e não apenas à nível de banco
- Os testes devem aumentar consideravelmente (realizados apenas testes unitários)
- O cadastro de atletas pode ser contemplado no escopo do problema

### Execução:

- importação de dados iniciais
```
bundle install
bundle exec rake db:migrate
bundle exec rake db:seed
```

- servidor
```
bundle exec rails s
```

- testes
```
bundle exec rspec spec
```
