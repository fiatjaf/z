---
date: 2018-09-23T10:14
---

# O que é Bitcoin?

Todo guia infeliz sobre Bitcoin começa com esta pergunta manjada, e normalmente já vai respondendo que é uma "moeda virtual"[^moeda_virtual], um conceito estúpido que não esclarece nada.

Esqueça esse papo. Bitcoin não é uma moeda. Bitcoin é um protocolo[^protocolo].

Por que então dizem que é uma moeda? Porque essas pessoas muito apressadinhas gostam de dizer que tudo que é facilmente divisível e transferível, e cujas várias unidades são idênticas umas às outras, é uma moeda. Então, nesse sentido, Bitcoin é uma moeda, mas ignore esse papo de moeda.

O protocolo Bitcoin diz que existem "créditos" (ou "pontos", ou "unidades") que podem ser transferidas entre os participantes, e vários computadores, cada um operando independentemente do outro, desde que sigam o protocolo (ou seja: que estejam todos rodando o mesmo programa, ou programas compatíveis), estarão sempre em acordo a respeito de quem gastou cada crédito e como gastou.

É basicamente essa a idéia: um monte de "pontos virtuais" que são transferidos de uns para outros, sem que exista uma entidade organizadora, "o dono do Bitcoin", "o chefe supremo do Bitcoin", que controle nada, coordene nada, ou tenha poder sobre essas transferências.

## Como funciona

Imagine vários computadores rodando o mesmo programa (ou programas compatíveis). Agora imagine que esses programas se comunicam entre si através da internet: eles enviam mensagens uns para os outros e esperam respostas. De vez em quando a resposta não vem, ou vem num formato que o programa não entende, isso significa que o outro computador saiu do ar, ou está rodando uma versão incompatível do programa, e aí todos os outros vão ignorá-lo. Mas em geral a resposta vem certinha e todos conseguem falar com todos.

Agora que você imaginou isso, fica fácil imaginar, por exemplo, que cada um desses computadores mantém uma lista de todos os bitcoins existentes e quem tem cada um. Eles pegam a lista dos outros computadores na rede e depois a vão atualizando à medida que novas transações vão sendo feitas. Toda vez que alguém quer fazer alguma transação, ele deve fazê-la por meio de um desses computadores, a pessoa chega no computador que está rodando o programa e diz: "sou fulano, tenho x bitcoins, e quero enviá-los para tal lugar", o programa vai lá e envia essa mensagem para os outros computadores, que atualizam a sua lista. Fim.

Essa seria uma versão ingênua do protocolo, que funcionaria se todos os participantes fossem muito honestos e ninguém jamais tentasse gastar os bitcoins que não têm.

Pra uma coisa dessas funcionar no mundo real teve de entrar a grande invenção do Bitcoin, o insight genial do Satoshi Nakamoto, que é a tal cadeia de blocos, conhecida por aí como _blockchain_.

Funciona assim: ao invés de cada computador manter uma lista de onde está cada bitcoin, cada computador mantém a tal cadeia de blocos. Um "bloco" é só um nome bonitinho para um conjunto de dados. Cada bloco é composto por uma referência ao bloco anterior e uma lista de transações. Como eles contém uma referência ao anterior, existe uma seqüência, uma fila indiana, e o computador pode ficar tranqüilo sabendo a ordem das transações (as transações que aconteceram no terceiro bloco são posteriores às que aconteceram no segundo bloco, por exemplo) e saber que os mesmos bitcoins não foram gastos duas vezes seguidas pela mesma pessoa, o que seria inválido. Quando aparece um novo bloco, é só todos os computadores conferirem se não existe nenhuma transação inválida ali e, caso exista, rejeitarem aquele bloco por inteiro e esperarem que o próximo descarte aquela transação inválida e venha certinho.

## Quem faz os blocos

Em tese, qualquer um dos computadores pode fazer o próximo bloco. A idéia é que cada pessoa que queira fazer uma transação vai lá e usa um computador da rede para enviar a sua proposta de transação ("quero transferir bitcoins para tal lugar e tal") para todos os demais, e que, quando alguém for fazer um bloco, pegue todas essas propostas de transação que forem válidas e as coloque no bloco que então será aceito por todos os outros computadores e incluído na cadeia global de blocos. Essa cadeia global tem que ser exatamente igual em todos os computadores.

Na prática, existe uma regra que faz com que nem todos consigam fazer blocos: é que o _hash_ dos dados do bloco + um número mágico deve ser menor do que um valor muito pequeno `x`. O número mágico é um número qualquer que o computador que está tentando fazer o bloco pode ajustar, por tentativa e erro, para que o _hash_ saia de um jeito que ele queira. O `x` pode ser maior ou menor de acordo com a freqüência dos últimos blocos produzidos. Quanto menor for `x`, mais estatisticamente difícil é encontrar um número mágico que, junto com os dados do bloco, tenha um _hash_ menor do que `x`.

Ou seja: para fazer um bloco, muitos números mágicos diferentes devem ser tentados até que seja encontrado algum que satisfaça as condições.

**O que é um _hash_?** Um hash é uma função matemática que é fácil fazer para um lado e difícil de fazer para o outro. A multiplicação, por exemplo, é fácil de fazer e fácil de fazer, e sua operação contrária, a divisão, também (tanto é que qualquer um com papel e caneta consegue, tem aquela coisa de ir passando os números pra baixo e subtraindo e tal). Já uma operação de exponenciação -- um número elevado a 1000, por exemplo -- é fácil de fazer, mas pra desfazer só com tentativa e erro (e é por tentativa e erro que o computador ou a calculadora fazem).

No caso do Bitcoin, o computador que está tentando produzir um bloco tem que achar um número tal que `(esse número mágico + fatores predeterminados do bloco) elevados a 50` resultem num valor menor do que `fator de dificuldade`, um outro fator predeterminado pelo estado geral da cadeia de blocos.

Suponha que um computador acha um número `1798465042647412146620280340569649349251249`, por exemplo, e ele é menor do que o `fator de dificuldade`. Ele então diz para os outros: "aqui está meu bloco, o hash do meu bloco é `1798465042647412146620280340569649349251249`, os fatores `predeterminados do bloco` são `4` (esses fatores todo mundo pode conferir), e meu número mágico é `3`. `(4 + 3) elevado a 50` é `1798465042647412146620280340569649349251249`, como todos podem conferir, então meu bloco é válido". Então todos aceitam aquele bloco como válido e começam a tentar achar o número mágico para o próximo bloco (e desta vez os fatores do bloco são diferentes, já que um novo bloco foi adicionado à cadeia e fez com que tudo mudasse).

As regras para a definição de `x` fazem com que na média cada novo bloco fique pronto em 10 minutos. Logo, se há apenas um computador tentando produzir blocos, o protocolo dirá que `x` seja relativamente alto, de modo que esse computador conseguirá, em 10 minutos, na média, encontrar um número mágico. Se, porém, milhares de computadores superpotentes estiverem tentando produzir blocos, `x` será ajustado para um valor muito mais baixo, de modo que o esforço de todos esses computadores fazendo milhares de tentativas-e-erros por segundo só conseguirá encontrar um número mágico a cada 10 minutos.

Hoje existem computadores feitos especialmente para procurar números mágicos que conseguem calcular hashes muito mais rápido do que o seu computador caseiro, o que torna inviável que qualquer pessoa não especializada tente produzir blocos, veja este gráfico da evolução da quantidade de hashes que são tentados a cada segundo.

Por algum motivo convencionou-se chamar os computadores que se empenham em fazer novos blocos de "mineradores".

## Se dois computadores da rede fizerem blocos ao mesmo tempo, qual dos dois vale?

Se você já sabe quem faz os blocos fica fácil imaginar que isso é um pouco improvável. Mas mesmo assim pode acontecer. Mesmo que os blocos não fiquem prontos exatamente no mesmo instante, problemas podem acontecer porque os outros computadores da rede receberão os dois novos blocos em ordens diferentes, e aí não vai dar pra determinar qual vale ou qual deixa de valer assim, pela ordem.

Os computadores então ficam num estado de indeterminação acerca das duas cadeias de blocos possíveis, A e B, digamos, ambas idênticas até o bloco de número 723, mas diferentes no que diz respeito ao bloco 724, para o qual há duas alternativas. O protocolo determina que a cadeia que tenha mais trabalho realizado é a que vale, mas durante algum tempo podemos ter um estado em que alguns computadores da rede só sabem da existência do bloco A, enquanto outros só sabem da existência do bloco B, o que é uma grande confusão que só pode ser resolvida pelo advento do próximo bloco, o 725.

Como cada bloco se refere a um bloco anterior, é necessário que um desses dois blocos 724 seja escolhido pelos mineradores para ser o "pai" do bloco 725 quando o número mágico for encontrado e ele for feito. Mesmo que cada minerador escolha um pai diferente, desse processo sairá provavelmente apenas um bloco 725, e quando ele for espalhado ele determinará, pela sua ascendência, qual foi o bloco 724 que ficou valendo. Caso dois ou mais blocos 725 sejam produzidos ao mesmo tempo, o sistema continua nesse estado de indecisão até o 726, e assim por diante.

Por este motivo não se deve confiar que uma transação está concretizada pra valer mesmo só porque ela foi incluída num bloco. Você não tem como saber se existe um outro bloco alternativo que será preferido ao seu até que pelo menos mais alguns blocos tenham sido adicionados.

# Transações

Muitas pessoas acreditam que existem endereços e que esses endereços têm um dono e ele é o dono dos bitcoins. Esta crença errônea é resultado de uma analogia com bancos tradicionais e contas bancárias (as contas são endereços que têm um dono e guardam dinheiro).

Na verdade assim que as transações são incluídas num bloco elas não "ficam em um endereço", mas vagando num grande limbo de transações. Deste limbo elas podem ser retiradas por qualquer pessoa que cumpra as condições que foram previamente especificadas pelo criador da transação.

Uma analogia mais útil do que a analogia das contas bancárias é a analogia do dinheiro: imagine que você tem uma nota de 20 dinheiros e você quer usá-la pra pagar 10 dinheiros a outrem. Você precisa quebrar aquela nota de 20 em duas de 10 e aí uma fica com você e a outra com a outra pessoa, ou, se você tiver duas notas de 5, você pode juntar as duas e dar para a outra pessoa. Todas essas notas que você está gastando têm uma história prévia: elas vieram de algum lugar em algum momento para o seu controle.

Transações com Bitcoin também são assim: você precisa mencionar especificamente uma transação anterior.

Por exemplo,

  1. Carlos paga 10 bitcoins a Dandara, Dandara agora tem uma transação no valor de 10
  2. Elisa paga 17 bitcoins a Dandara, Dandara tem uma transação no valor de 10 e uma no valor de 17
  3. Dandara paga 23 bitcoins a Felipe, ela junta suas duas transações e faz duas novas, uma no valor de 23, que vai para o controle de Felipe, e outra no valor de 4, que volta para o seu controle, Dandara agora tem uma transação no valor de 4, Felipe tem uma transação no valor de 23
  4. Felipe paga 14 bitcoins a Geraldo, ele divide sua transação em duas, uma no valor de 14 e outra no valor de 9, e assim por diante

Uma diferença, porém, é que no Bitcoin ninguém sabe quem é o dono da nota, você apenas sabe que pode gastá-la, caso você realmente possa (se uma transação prévia especifica uma condição que você pode cumprir, você deve cumprir aquela condição no momento em que estiver mencionando a transação prévia). Por isso uma carteira Bitcoin pode dizer que você "tem" um número x de bitcoins: a carteira sabe quais chaves privadas você controla e quais transações, dentre todas as transações não-gastas de toda a blockchain, podem ser gastas usando aquela chave.

Uma forma comum de transação é que especifica a condição `qualquer pessoa que tiver a chave privada capaz de assinar a chave pública cujo hash vai aqui dito pode gastar esta transação`. Outras condições comuns são as que especificam `n` chaves, das quais `m` precisam assinar a transação para que ela seja gasta (por exemplo, entre Fulano, Beltrano e Ciclano, quaisquer dois deles precisam concordar, mas não um só), o famoso _multisig_.

## Canal de pagamento

Um _payment channel_, ou _via de pagamento_, ou _canal de pagamento_ é uma seqüência de promessas de pagamento feitas entre dois usuários de Bitcoin que não precisam ser publicados na blockchain e por isso são instantâneas e grátis.

Antes que você se pergunte o que acontece se alguém descumprir a promessa, devo dizer que "promessa" é um termo ruim, porque promessas de verdade podem ser quebradas, mas estas promessas são auto-cumpríveis, elas são transações assinadas que podem ser resgatadas a qualquer momento pelo destinatário bastando que ele as publique na blockchain.

A idéia é que na maioria das vezes você não vai precisar disso, e pode continuar fazendo transações novas que invalidam as antigas até que você decida publicar a última transação válida. Deste modo seu dinheiro está seguro numa via de pagamento

O grande problema é que caso a outra parte decida roubar e publicar uma transação antiga, você precisa aparecer num espaço de tempo razoável (isto depende do combinado entre os dois usuários, mas acho que o padrão é 24 horas) e publicar a última transação. Existem incentivos para impedir que alguém tente roubar (por exemplo, quem tentar roubar e for pego perde todo o dinheiro que estava naquela via) e outros mecanismos, como as atalaias que vigiam as vias de pagamentos dos outros pra ver se ninguém está roubando.

Exemplo:

  1. Ângela e Bóris decidem criar uma via de pagamento, pois esperam realizar muitos pagamentos de pequeno valor entre eles, tanto de ida quanto de volta, ao longo de vários meses
  2. Ângela cria uma transação para um endereço compartilhado entre ela e Bóris, no valor de 1000 satoshis, e desse endereço ela e Bóris criam uma transação devolvendo os 1000 para Ângela
  3. Ao resolver pagar 200 satoshis para Bóris, eles criam uma nova transação que transfere 800 para Ângela e 200 para Bóris
  4. Agora Bóris quer pagar 17 satoshis para Ângela, eles criam uma nova transação que transfere 817 para Ângela e 173 para Bóris
  5. E assim por diante eles vão criando novas transações que invalidam as anteriores e vão alterando o "saldo" da via de pagamento. Quando qualquer um dos dois quiser sacar o dinheiro que tem no saldo é só publicar a última transação e pronto.

A [rede Relâmpago](5854ec2a) é uma grande rede de canais de pagamento que permite que pessoas façam pagamentos para pessoas não diretamente ligadas a elas por canais diretos, mas através de uma rota que percorre vários canais de outrem e ajusta seus saldos.

# Existem outras criptomoedas além do Bitcoin?

Pra começar, jamais use essa palavra de novo. "criptomoeda" é ainda pior do que "moeda virtual"[^moeda_virtual].

Agora, respondendo: sim, de certo modo existem, são chamadas as "altcoins" ou "shitcoins" ("moedas de cocô", tradução amigável), porque elas são, de fato, grandes porcarias.

De outro modo, pode-se dizer que elas não são comparáveis ao Bitcoin, porque só pode haver uma moeda num livre mercado de moedas, e esse posto já é do Bitcoin, e também porque o Bitcoin é livre, sem donos, sem grandes poderes que o controlam, o que não se pode dizer de nenhuma altcoin.

Depois que o Bitcoin foi inventado e seu _insight_ genial foi assimilado pela comunidade interessada, milhares de pessoas copiaram o protocolo, com pequenas modificações, para criar suas próprias moedas.

Assim surgiram Litecoin, Ethereum e muitas outras. No fundo são apenas cópias do Bitcoin que tentam melhorá-lo de algum modo ou adicionar outras funções.

# Veja também:

* [Aos poucos, e aí tudo de uma vez](/aos-poucos.html), Parker Lewis
* [[[89f3fd5c]]]
* [[[27740316]]]
* [[[75853eb9]]]
* [[[5854ec2a]]]

---

[^protocolo]: Neste contexto, um protocolo é um conjunto de regras (inventadas arbitrariamente ou surgidas dos usos e costumes ao longo do tempo) que permitem que dois computadores diferentes se entendam e saibam que tipo de mensagens e comportamentos esperar dos demais.
[^moeda_virtual]: Virtual? Virtual era pra significar uma coisa que não é ainda "atual", ou seja, que ainda não se concretizou na realidade. Mas como nossos amigos falantes da língüa portuguesa quiseram que isso passasse também a significar qualquer coisa que aconteça em um computador, "moeda virtual" ficou sendo uma moeda que existe no computador. O Bitcoin claramente é uma moeda que existe no computador, mas mesmo assim esse conceito é confuso. Uma transferência bancária tradicional também não é "dinheiro virtual"? Ela acontece no computador, mas você ainda não pegou as notas de papel ali na sua mão, então é virtual. Chamar só o Bitcoin de moeda virtual pode talvez criar a impressão de que é o Bitcoin é um brinquedinho, como por exemplo as moedas virtuais que existem dentro do universo de jogos de simulação, como, sei lá, World of Warcraft.
