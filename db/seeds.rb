competition =
  Api::Competition.create(name: 'Jogos Olímpicos Rio-2016', slug: 'rio-2016',
                          place: 'Estádio Nilton Santos (Engenhão)')

Api::Modality.create(name: '100m Rasos', slug: '100m-rasos', measure: 'seconds',
                     competition: competition)
Api::Modality.create(name: 'Lançamento de Dardo', slug: 'lancamento-de-dardo',
                     measure: 'meters', competition: competition)
