---
date: 2016-11-16
---

# A memória humana e as databases

A comparação entre uma database e a memória humana é trivial, todo mundo pensa. Os exemplos das letras de música e dos rostos humanos citados [neste trabalhinho acadêmico boboca][1] fazem muito sentido: de fato a analogia entre index keys e trechos de música ou rostos humanos parece explicar fenômenos que experimentamos.

O que me parece loucura é a simplificação, o reducionismo, que povoa a mente dos [responsáveis por essas analogias][2]. O fato de que uma database tem uma lista de _keys_ enquanto a memória humana tem um mecanismo de busca vago, _context-sensitive_, que opera com dicas soltas e ora funciona ora não funciona -- não é argumento para afirmar que o computador é melhor do que a memória humana.

Claro, todos esses cientistas vão dizer que a memória humana tem uma eficiência enorme, porque ela armazena muito mais dados do que os computadores blablablá, mas em tese ela pode ser reimplementada usando os algoritmos de databases que nós já usamos.

A imagem simplificada da memória humana que se faz é a seguinte: quando vimos uma coisa qualquer, um menino pulando um muro, ela nos lembra de outras coisas relacionadas, uma certa vez em que nós mesmos pulamos um muro, o muro que estamos pensando em construir, umas brincadeiras parecidas com pular muro, os motivos que já levaram outras pessoas a pular muro, um filme que tinha cenas de meninos travessos, a muralha da China, uma imagem de assaltante que não está pulando nenhum muro, uma casa da mesma cor do muro. Simples: nosso cérebro pega os dados dos sentidos e com eles faz uma busca na memória.

A questão toda é: quais "dados dos sentidos"? Como é que o coitado do cérebro sabe que é pra procurar um muro, e não uma parede qualquer, ou os tijolos separados, ou o cimento, o barro de onde são feitos os tijolos? Isto sem contar a distinção, que é outro problema, que fazemos entre a mancha colorida a que chamamos muro e a outra mancha colorida a que chamamos menino, dentre infinitas outras, porque isto é outro problema. Mas a escolha dos dados que vão ser usados na busca que será feita na memória é crucial para o sucesso da operação, e nenhum computador saberia escolher.

Alguém vai argumentar que um mecanismo de _computer vision_ poderia identificar um menino e um muro na cena e encontrar no banco de dados várias coisas relacionadas a meninos e várias coisas relacionadas a muros, mas temos que concordar que não é nada nem próximo disto que a mente humana faz. O assaltante, por exemplo, só seria encontrado se, no ato de indexá-lo, já colocássemos lá "atravessar obstáculos" e, putz, como tirar esta mesma frase de uma imagem de um menino perto de um muro? Mesmo que a _computer vision_ seja ótima e consiga, como decidir entre a query "atravessar obstáculos" e "correr risco físico", "desafiar-se a si mesmo", "chegar mais alto", "invadir propriedade privada", "brincar", "tentar impressionar as meninas", "lutar para ser aceito entre seus pares", "mostrar que sabe", "chegar primeiro" e infinitos outros sentimentos, motivações, expectativas e processos que podem estar em curso naquela subida de muro?

Não é nada disso que a mente humana faz, eu dizia, porque a _computer vision_ pode identificar o muro e o menino e o ato do menino de subir o muro, mas e quando a atenção humana foca no material que constitui o muro, a cor do muro ou a planta que está nascendo no meio do muro? Ou no reboque malfeito do muro, a casa que imagina haver atrás do muro? Cada foco destes, cuja causa também não vem ao caso aqui, deveria produzir _queries_ bem diferentes.

Há vários outros pontos que poderiam ser levantados aqui contra o reducionismo e a simplificação da analogia entre a memória humana e uma database simples, e o erro que é igualá-las, mas me perdi, e acho que se você entendeu os pontos que levantei acima saberá encontrar vários outros exemplos nos quais o funcionamento da memória humana ultrapassa em complexidade qualquer algoritmo infinitamente -- e uso aqui "infinitamente" em sentido estritamente literal.

[1]: http://www.iosrjournals.org/iosr-jce/papers/Vol15-issue2/G01525053.pdf?id=8449
[2]: https://www.edge.org/response-detail/11799
