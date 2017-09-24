competition =
  Api::Competition.create(name: 'Jogos Olímpicos Rio-2016', slug: 'rio-2016',
                          place: 'Estádio Nilton Santos (Engenhão)')

running =
  Api::Modality.create(name: '100m Rasos', slug: '100m-rasos',
                       measure: 'seconds', competition: competition)
javelin_throw =
  Api::Modality.create(name: 'Lançamento de Dardo', slug: 'lancamento-de-dardo',
                       measure: 'meters', competition: competition)

Api::Stage.create(name: 'eliminatórias', allowed_batteries: 7,
                  modality: running)
Api::Stage.create(name: 'semifinais', allowed_batteries: 3,
                  modality: running)
Api::Stage.create(name: 'final', allowed_batteries: 1,
                  modality: running)

Api::Stage.create(name: 'eliminatórias', allowed_batteries: 1,
                  modality: javelin_throw)
Api::Stage.create(name: 'final', allowed_batteries: 1,
                  modality: javelin_throw)
