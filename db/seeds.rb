# Receitas de Família - Seed Data
# Receitas tradicionais brasileiras para popular o banco de dados

puts "Criando receitas..."

# Receita 1: Feijoada
feijoada = Recipe.create!(
  title: "Feijoada Completa da Vovó",
  description: "A tradicional feijoada brasileira feita com amor e tempo. Receita passada por gerações que traz o sabor autêntico da cozinha brasileira.",
  ingredients: "1 kg de feijão preto
500g de carne seca dessalgada
500g de linguiça calabresa
500g de costelinha de porco
500g de paio
300g de bacon
5 folhas de louro
1 cabeça de alho inteira
2 cebolas grandes
Pimenta-do-reino a gosto
Sal a gosto
Laranjas para acompanhar",
  instructions: "Deixe as carnes de molho na véspera, trocando a água algumas vezes.
Cozinhe o feijão em água com as folhas de louro até ficar macio.
Em uma panela separada, refogue o alho e a cebola no bacon.
Adicione as carnes cozidas e o feijão.
Deixe cozinhar em fogo baixo por pelo menos 2 horas.
Ajuste o sal e a pimenta.
Sirva com arroz, couve, laranja e farofa.",
  category: "prato_principal",
  region: "sudeste",
  occasion: "dia_a_dia",
  image_url: "https://images.unsplash.com/photo-1567529854338-812465da79d7?w=800",
  prep_time: 180,
  servings: 10
)

# Comentários na feijoada
feijoada.comments.create!(content: "Melhor feijoada que já fiz! A família adorou.", author_name: "Maria")
feijoada.comments.create!(content: "Fiz para o aniversário do meu pai e foi um sucesso!", author_name: "João Carlos")

# Receita 2: Bolo de Cenoura
bolo = Recipe.create!(
  title: "Bolo de Cenoura da Vovó",
  description: "O clássico bolo de cenoura com cobertura de chocolate cremosa. Macio, úmido e irresistível.",
  ingredients: "3 cenouras médias
4 ovos
1 xícara de óleo
2 xícaras de açúcar
2 xícaras de farinha de trigo
1 colher (sopa) de fermento em pó
1 pitada de sal
Para a cobertura:
1 lata de leite condensado
1 colher (sopa) de manteiga
3 colheres (sopa) de chocolate em pó
1/2 xícara de leite",
  instructions: "Bata no liquidificador as cenouras, ovos e óleo até ficar homogêneo.
Adicione o açúcar e bata mais um pouco.
Em uma tigela, misture a farinha, o fermento e o sal.
Incorpore a mistura do liquidificador aos secos.
Despeje em uma forma untada.
Asse em forno pré-aquecido a 180°C por 40 minutos.
Para a cobertura, leve todos os ingredientes ao fogo médio até engrossar.
Cubra o bolo ainda morno.",
  category: "sobremesa",
  region: "geral",
  occasion: "dia_a_dia",
  image_url: "https://images.unsplash.com/photo-1587668178277-295251f900ce?w=800",
  prep_time: 60,
  servings: 12
)

bolo.comments.create!(content: "Perfeito! A cobertura fica maravilhosa.", author_name: "Ana Paula")

# Receita 3: Moqueca Baiana
moqueca = Recipe.create!(
  title: "Moqueca Baiana de Peixe",
  description: "Moqueca tradicional baiana feita com azeite de dendê e leite de coco. Um pedacinho da Bahia na sua mesa.",
  ingredients: "1 kg de filé de peixe (cação ou robalo)
2 cebolas grandes
4 tomates maduros
1 pimentão verde
1 pimentão amarelo
1 pimentão vermelho
200ml de azeite de dendê
200ml de leite de coco
Coentro fresco a gosto
Sal e pimenta a gosto
Suco de 1 limão",
  instructions: "Tempere o peixe com limão, sal e pimenta e deixe descansar por 20 minutos.
Corte as cebolas, tomates e pimentões em rodelas.
Em uma panela de barro, faça camadas de cebola, tomate, pimentão e peixe.
Repita as camadas até terminar os ingredientes.
Regue com o azeite de dendê.
Leve ao fogo médio por 20 minutos.
Adicione o leite de coco e cozinhe por mais 10 minutos.
Finalize com coentro fresco.
Sirva com arroz branco e pirão.",
  category: "prato_principal",
  region: "nordeste",
  occasion: "dia_a_dia",
  image_url: "https://images.unsplash.com/photo-1626645738196-c2a7c87a8f58?w=800",
  prep_time: 50,
  servings: 6
)

moqueca.comments.create!(content: "Sabor de Bahia! Deliciosa!", author_name: "Carlos")

# Receita 4: Pão de Queijo
pao = Recipe.create!(
  title: "Pão de Queijo Mineiro",
  description: "Pão de queijo tradicional de Minas Gerais. Crocante por fora e macio por dentro.",
  ingredients: "500g de polvilho azedo
250ml de leite
125ml de óleo
2 ovos
200g de queijo minas meia cura ralado
100g de queijo parmesão ralado
Sal a gosto",
  instructions: "Ferva o leite com o óleo e o sal.
Escalde o polvilho com a mistura quente, misturando bem.
Deixe esfriar um pouco.
Adicione os ovos e misture até incorporar.
Acrescente os queijos e sove até obter uma massa homogênea.
Modele bolinhas pequenas com as mãos untadas.
Asse em forno pré-aquecido a 200°C por 30 minutos ou até dourar.",
  category: "acompanhamento",
  region: "sudeste",
  occasion: "dia_a_dia",
  image_url: "https://images.unsplash.com/photo-1617135772770-5d4332b20b38?w=800",
  prep_time: 45,
  servings: 20
)

# Receita 5: Brigadeiro
brigadeiro = Recipe.create!(
  title: "Brigadeiro Tradicional",
  description: "O docinho mais amado do Brasil. Cremoso, chocolatudo e irresistível.",
  ingredients: "1 lata de leite condensado
3 colheres (sopa) de chocolate em pó
1 colher (sopa) de manteiga
1 xícara de chocolate granulado para enrolar",
  instructions: "Em uma panela, misture o leite condensado, o chocolate em pó e a manteiga.
Leve ao fogo baixo, mexendo sempre até desgrudar do fundo da panela (aproximadamente 10 minutos).
Deixe esfriar completamente.
Com as mãos untadas, modele bolinhas.
Passe no chocolate granulado.
Sirva em forminhas de papel.",
  category: "sobremesa",
  region: "geral",
  occasion: "aniversario",
  image_url: "https://images.unsplash.com/photo-1612203985729-70726954388c?w=800",
  prep_time: 30,
  servings: 20
)

# Receita 6: Canjica
 Recipe.create!(
  title: "Canjica Cremosa",
  description: "Canjica cremosa, perfeita para os dias frios e festas juninas.",
  ingredients: "500g de canjica branca (milho branco para canjica)
1 litro de leite
1 lata de leite condensado
200ml de leite de coco
Canela em pau
Cravo-da-índia
Açúcar a gosto
Canela em pó para polvilhar",
  instructions: "Deixe a canjica de molho por 24 horas.
Cozinhe a canjica na panela de pressão com água e sal por 40 minutos.
Escorra e coloque em uma panela grande.
Adicione o leite, leite condensado, leite de coco, canela e cravo.
Cozinhe em fogo baixo por 30 minutos, mexendo ocasionalmente.
Ajuste o açúcar se necessário.
Sirva quente com canela em pó por cima.",
  category: "sobremesa",
  region: "sudeste",
  occasion: "festa_junina",
  image_url: "https://images.unsplash.com/photo-1511914678378-2906b1f69dcf?w=800",
  prep_time: 120,
  servings: 8
)

# Receita 7: Tapioca
tapioca = Recipe.create!(
  title: "Tapioca Recheada",
  description: "Tapioca tradicional nordestina, versátil e deliciosa. Pode ser feita com diversos recheios.",
  ingredients: "500g de goma de tapioca hidratada
200g de queijo coalho em fatias
Manteiga para untar
Sal a gosto",
  instructions: "Peneire a goma de tapioca para remover gruminhos.
Aqueça uma frigideira antiaderente e unte levemente com manteiga.
Coloque a goma peneirada de forma uniforme na frigideira.
Cozinhe até firmar e virar.
Adicione o recheio de sua preferência.
Dobre ao meio e sirva quente.",
  category: "entrada",
  region: "nordeste",
  occasion: "dia_a_dia",
  image_url: "https://images.unsplash.com/photo-1568728931976-788cfc1c24f6?w=800",
  prep_time: 15,
  servings: 4
)

tapioca.comments.create!(content: "Simples e deliciosa! Meu café da manhã favorito.", author_name: "Fernanda")

# Receita 8: Rabanada
 Recipe.create!(
  title: "Rabanada de Natal",
  description: "Tradicional rabanada de Natal, crocante por fora e macia por dentro. Perfeita para a ceia.",
  ingredients: "1 pão francês de véspera
2 xícaras de leite
3 ovos
1 colher (chá) de essência de baunilha
Açúcar e canela para polvilhar
Óleo para fritar",
  instructions: "Corte o pão em fatias de 2cm de espessura.
Misture o leite, ovos e baunilha.
Mergulhe as fatias de pão na mistura, deixando absorver bem.
Aqueça o óleo em uma frigideira.
Frite as rabanadas até dourarem dos dois lados.
Escorra em papel toalha.
Passe em açúcar misturado com canela.
Sirva quente ou fria.",
  category: "sobremesa",
  region: "geral",
  occasion: "natal",
  image_url: "https://images.unsplash.com/photo-1609126979288-47c5a50b0992?w=800",
  prep_time: 30,
  servings: 8
)

# Receita 9: Vinho Quente
vinho = Recipe.create!(
  title: "Vinho Quente Especial",
  description: "Vinho quente aromático com especiarias. Ideal para aquecer nos dias frios.",
  ingredients: "1 garrafa de vinho tinto seco
1 xícara de água
1/2 xícara de açúcar
2 paus de canela
4 cravos-da-índia
2 estrelas de anis
1 laranja em rodelas
Gengibre em lascas a gosto",
  instructions: "Em uma panela, aqueça a água com o açúcar e as especiarias.
Deixe ferver por 5 minutos para aromatizar.
Adicione o vinho e as rodelas de laranja.
Aqueça em fogo baixo por 10 minutos (não deixe ferver).
Coe e sirva quente.
Decore com um pau de canela.",
  category: "bebida",
  region: "sul",
  occasion: "dia_a_dia",
  image_url: "https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=800",
  prep_time: 20,
  servings: 6
)

vinho.comments.create!(content: "Perfeito para o inverno! Adoro o aroma das especiarias.", author_name: "Paulo")

# Receita 10: Barreado
barreado = Recipe.create!(
  title: "Barreado do Paraná",
  description: "Prato tradicional do litoral paranaense. Carne cozida por horas até desfiar, servida com bananas e farinha.",
  ingredients: "1 kg de coxão duro
200g de bacon
3 cebolas grandes
8 dentes de alho
2 colheres (sopa) de colorau
Sal e pimenta a gosto
Folhas de louro
Bananas para acompanhar
Farinha de mandioca",
  instructions: "Corte a carne em cubos grandes.
Tempere com sal, pimenta, alho e colorau.
Em uma panela de pressão, refogue o bacon e a cebola.
Adicione a carne e doure bem.
Cubra com água e adicione o louro.
Cozinhe na panela de pressão por 1 hora.
Desligue e deixe a pressão sair naturalmente.
Abra a panela e cozinhe em fogo baixo até o caldo engrossar e a carne desfiar.
Sirva com bananas e farinha.",
  category: "prato_principal",
  region: "sul",
  occasion: "dia_a_dia",
  image_url: "https://images.unsplash.com/photo-1544025162-d76694265947?w=800",
  prep_time: 120,
  servings: 6
)

puts "Criadas #{Recipe.count} receitas e #{Comment.count} comentários!"
puts "Seed finalizado com sucesso!"
