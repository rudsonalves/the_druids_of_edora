# 01 — Tarefas de internacionalização

Planejamento de referência: [01-internacionalizacao.md](01-internacionalizacao.md). Execute na ordem abaixo e marque cada tarefa após verificar seu critério de aceite.

## 01.1 — Configurar a geração das traduções

- [x] Habilitar a geração no `pubspec.yaml`, configurar `l10n.yaml` e criar os catálogos em `lib/l10n/` para `pt_BR` e `en`.
- [x] Ligar os delegates e idiomas de `AppLocalizations` ao `MaterialApp` em `lib/app/edora_app.dart`. Manter português brasileiro como padrão e preservar o seletor manual.

**Aceite.** `flutter gen-l10n` gera o código em `lib/l10n/` e o app abre em português.

## 01.2 — Migrar preparação e rolagem

- [x] Migrar instruções, nomes de cores, navegação e tooltip do seletor em `setup_page.dart`.
- [x] Migrar títulos, instruções e estados de rolagem em `dice_page.dart`.
- [x] Localizar o rótulo de acessibilidade em `die_face.dart` com parâmetros para índice e valor. Atualizar os pontos de uso.

**Aceite.** O fluxo da preparação até a rolagem usa o idioma escolhido, inclusive na leitura dos dados por tecnologias assistivas.

## 01.3 — Migrar a tela de cartas e o diálogo

- [x] Migrar botões, estados do baralho e contagem em `cards_page.dart`, e campos e ações em `dolmen_setup_dialog.dart`.
- [x] Em `automa_instruction_card.dart`, localizar os rótulos e o progresso dos dolmens com parâmetros para o par, a quantidade colocada e o total. Identificar a seção de dado por um valor estável em vez de comparar o título exibido.

**Aceite.** Ambos os idiomas exibem o progresso e os dados escolhidos. O nome do par digitado pelo jogador aparece como informado.

## 01.4 — Migrar as sete cartas

- [x] Transferir títulos, alvo, movimento, dado, ação e desempates aplicáveis de `automa_card.dart` para os ARB. Conferir a terminologia com as referências em `docs/`.
- [x] Resolver os textos na apresentação a partir da identidade da carta. Retirar os parâmetros booleanos de idioma e manter as regras de sorteio e de consumo dos dados.

**Aceite.** As sete cartas apresentam as instruções nos dois idiomas e conservam o comportamento de jogo.

## 01.5 — Validar a migração

- [x] Verificar chaves ausentes e buscar usos restantes de `isPortuguese`, `label(pt, en)` e textos de interface embutidos.
- [x] Cobrir a troca de idioma e as mensagens parametrizadas nos testes de widgets. Conferir a regressão do sorteio e do fluxo de dolmens.
- [x] Executar `flutter gen-l10n` e `make check`. Revisar visualmente os títulos de duas linhas, a faixa de dados e o diálogo em português e inglês.

**Aceite.** Geração, análise e testes passam. Os fluxos são legíveis nos dois idiomas e a tradução não interfere no estado da partida.

Persistir a escolha e seguir o idioma do sistema ficam para uma decisão posterior, conforme o planejamento.
