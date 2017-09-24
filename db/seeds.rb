competition =
  Api::Competition.create(name: 'Jogos Olímpicos Rio-2016', slug: 'rio-2016',
                          place: 'Estádio Nilton Santos (Engenhão)')

running =
  Api::Modality.create(name: '100m Rasos', slug: '100m-rasos',
                       measurement_unity: 'segundos', competition: competition)
javelin_throw =
  Api::Modality.create(name: 'Lançamento de Dardo', slug: 'lancamento-de-dardo',
                       measurement_unity: 'metros', competition: competition)

running_eliminations =
  Api::Stage.create(name: 'eliminatórias', slug: 'eliminatorias',
                    allowed_batteries: 7, modality: running)
running_semifinals =
  Api::Stage.create(name: 'semifinais', slug: 'semifinais',
                    allowed_batteries: 3, modality: running)
running_final =
  Api::Stage.create(name: 'final', slug: 'final',
                    allowed_batteries: 1, modality: running)

javelin_throw_eliminations =
  Api::Stage.create(name: 'eliminatórias', slug: 'eliminatorias',
                    allowed_batteries: 1, modality: javelin_throw)
javelin_throw_final =
  Api::Stage.create(name: 'final', slug: 'final',
                    allowed_batteries: 1, modality: javelin_throw)

(1..running_eliminations.allowed_batteries).each do |battery|
  Api::Battery.create(number: battery, stage: running_eliminations)
end

(1..running_semifinals.allowed_batteries).each do |battery|
  Api::Battery.create(number: battery, stage: running_semifinals)
end

(1..running_final.allowed_batteries).each do |battery|
  Api::Battery.create(number: battery, stage: running_final)
end

(1..javelin_throw_eliminations.allowed_batteries).each do |battery|
  Api::Battery.create(number: battery, stage: javelin_throw_eliminations,
                      max_tries: 3, max_athletes: 40)
end

(1..javelin_throw_final.allowed_batteries).each do |battery|
  Api::Battery.create(number: battery, stage: javelin_throw_final,
                      max_tries: 3, max_athletes: 12)
end
