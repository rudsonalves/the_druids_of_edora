# 02 — Regras de sorteio das cartas

## Regra 1 — Limitar “Conectar 2 dolmens” nas primeiras nove rodadas

Nos nove primeiros sorteios de uma partida, a carta **Conectar 2 dolmens** pode aparecer no máximo duas vezes. Cada ocorrência pode consumir até quatro dados.

Para esta regra, uma rodada corresponde à apresentação de uma nova carta. Configurar o par, reabrir o diálogo ou colocar dados enquanto a mesma carta está ativa não avança essa contagem. A partir do décimo sorteio, este limite deixa de se aplicar.

## Implementação

- [x] Contar os sorteios efetivos e as ocorrências de `AutomaCard.connectDolmens` desde o início da partida. Manter a contagem ao reembaralhar e zerá-la ao iniciar uma nova partida.
- [x] Após a segunda ocorrência, impedir que essa carta seja apresentada do terceiro ao nono sorteio. Se ela for a próxima candidata, sortear entre as cartas elegíveis e manter a carta adiada para um sorteio futuro. Prever como reabastecer o baralho se restarem apenas cartas inelegíveis.
- [x] Manter o fluxo atual da carta ativa, inclusive a escolha de até quatro dados, limitada pelos dados disponíveis.

## Critérios de aceite

- Se a segunda ocorrência acontecer antes da nona rodada, a carta não aparece novamente até o décimo sorteio, mesmo após reembaralhar.
- A segunda ocorrência pode acontecer na nona rodada. A partir da décima, a carta volta a ser elegível pelas regras do baralho.
- Colocar os dados de uma conexão em etapas não aumenta a contagem de sorteios nem a de ocorrências da carta.
- Uma nova partida começa com as duas contagens zeradas.

## Regra 2 — Selecionar e acompanhar os pares de dolmens

Na carta **Conectar 2 dolmens**, substituir o campo de texto da cor por um seletor visual. Cada opção representa um par da mesma cor e usa a imagem correspondente em `assets/dolmens/`, com o nome da cor localizado. Mostrar apenas os pares ainda disponíveis na partida.

- [x] Registrar a conclusão de cada par por cor, seja pelo autômato ou pelo jogador. Remover o par das próximas seleções e limpar esse registro ao iniciar outra partida.
- [x] Depois que o jogador escolher o par, mostrar na própria carta a imagem do dolmen da cor selecionada, usando o PNG de `assets/dolmens/`. Manter a imagem visível enquanto a conexão estiver em andamento.
- [x] Enquanto a carta estiver ativa, oferecer a ação **Jogador conectou este par**. Ao acioná-la, registrar a conclusão, encerrar o objetivo e avançar para o sorteio de outra carta conforme as regras do baralho. Preservar os dados já consumidos e não gastar dado adicional pela interrupção.
- [x] Se todos os pares estiverem conectados, considerar a carta inelegível para novos sorteios.

### Critérios de aceite

- O seletor mostra as imagens e os nomes das cores disponíveis. Um par concluído pelo jogador ou pelo autômato não volta a aparecer na mesma partida.
- Após a seleção, a carta exibe a imagem da cor escolhida durante todas as colocações de dados, até a conclusão ou interrupção da conexão.
- Se o jogador concluir o par antes do autômato, a carta é interrompida e o fluxo avança para outra carta quando houver dados disponíveis. Somente a apresentação da nova carta conta como outro sorteio.
- Uma nova partida volta a oferecer todos os pares.

### Decisão em aberto

Definir se o jogador poderá registrar a conexão de um par fora do fluxo desta carta, para removê-lo do seletor antes de um novo sorteio.
