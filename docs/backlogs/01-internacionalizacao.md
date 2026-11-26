# 01 — Internacionalização do app The Druids of Edora

## Objetivo

Centralizar os textos visíveis ao jogador em português brasileiro e inglês usando a geração de localizações do Flutter (`gen-l10n`) e arquivos ARB, preservando a troca manual de idioma e o comportamento das cartas e dos dados.

## Levantamento atual

O código da aplicação está em `/Users/rudsonalves/Projects/solo/the_druids_of_edora`. O `pubspec.yaml` já inclui `flutter_localizations`, e `EdoraApp` declara `pt_BR` e `en`, com `pt_BR` como idioma inicial. A tela de preparação oferece um menu de idiomas. A escolha fica apenas no estado de `EdoraApp`, sem persistência após reiniciar o app.

Os textos estão embutidos em Dart, usando `label(pt, en)`, `isPortuguese ? ... : ...` e métodos de `AutomaCard` que recebem um booleano. Não há arquivos ARB nem `l10n.yaml`. O inventário por área é:

| Área | Arquivos | Conteúdo a migrar |
| --- | --- | --- |
| Aplicação | `lib/app/edora_app.dart` | configuração de locale e delegates; título fixo do app |
| Preparação | `lib/features/setup/setup_page.dart`, `widgets/die_face.dart` | instruções, cores, navegação, menu e descrição acessível dos dados |
| Dados | `lib/features/dice/dice_page.dart` | títulos, instruções, estados da rolagem e navegação |
| Cartas | `lib/features/cards/cards_page.dart`, `automa_card.dart`, `widgets/automa_instruction_card.dart` | sete cartas e suas seções, estados do baralho, botões, contagem de dados |
| Dolmens | `lib/features/cards/widgets/dolmen_setup_dialog.dart` | título, instruções, rótulos e ações do diálogo |

`die_selector.dart` contém uma mensagem de erro interna (`No dice available`), que não é mostrada ao jogador no fluxo atual. Identificadores de testes e chaves de widgets não são traduções.

## Plano de implementação

### 1. Configurar a geração

- Adicionar `flutter: generate: true` ao `pubspec.yaml`.
- Criar `l10n.yaml` com `arb-dir: lib/l10n`, `template-arb-file: app_pt_BR.arb` e `output-localization-file: app_localizations.dart`.
- Criar `lib/l10n/app_pt_BR.arb` e `app_en.arb` com as mesmas chaves e descrições para mensagens cujo contexto não é evidente. Usar nomes por significado, como `availableDiceCount`, e placeholders para valores variáveis.
- Importar a classe gerada do diretório `lib/l10n`, sem usar `package:flutter_gen`.
- Registrar `AppLocalizations.localizationsDelegates` e `AppLocalizations.supportedLocales` em `MaterialApp`.

### 2. Migrar os textos das telas

- Substituir os helpers `label` e os condicionais de idioma nas telas de preparação, dados, cartas e diálogo de dolmens por `AppLocalizations.of(context)!`.
- Usar placeholders ARB para contagem de dados, número e valor do dado e progresso dos dolmens. Manter nomes e valores digitados pelo jogador como dados, sem tradução.
- Preservar os rótulos nativos do menu `Português (BR)` e `English`, pois devem ser reconhecíveis independentemente do idioma selecionado.
- Verificar mensagens de acessibilidade, incluindo `Semantics` em `die_face.dart`.

### 3. Migrar o texto das cartas

- Centralizar títulos, alvo, movimento, dado, ação e desempate das sete cartas nos ARB.
- Manter `AutomaCard` como identidade e regra de jogo; expor as mensagens localizadas na camada de apresentação, ou passar um objeto de localização aos métodos de texto. Evitar que a lógica dependa de `bool isPortuguese`.
- Trocar a comparação de rótulo traduzido usada para identificar a seção de dado em `automa_instruction_card.dart` por um identificador estável (por exemplo, enum ou parâmetro booleano específico).
- Conferir a terminologia das cartas e sua correspondência entre idiomas com o glossário e as regras presentes em `docs/` do app antes de fechar os ARB.

### 4. Definir o comportamento do idioma

- Manter `pt_BR` como padrão inicial nesta migração e a troca manual já existente.
- Tratar como decisão separada a persistência da escolha e a detecção automática do idioma do sistema. Nenhuma das duas é necessária para centralizar as traduções; se forem desejadas, especificar a precedência entre idioma salvo, idioma do sistema e padrão antes de implementar.

### 5. Verificar

- Rodar `flutter gen-l10n`, `flutter analyze` e `flutter test` no diretório do app.
- Atualizar os testes de widgets para cobrir as telas e a troca `pt_BR`/`en`, incluindo textos com placeholders e as sete cartas.
- Fazer conferência visual em ambos os idiomas, especialmente títulos de duas linhas, barra inferior de dados, diálogo de dolmens e textos longos das cartas.
- Procurar no `lib/` por `label(pt, en)`, `isPortuguese`, textos visíveis literais e chaves ARB ausentes. Aceitar somente literais técnicos ou nomes próprios deliberadamente fixos.

## Critérios de conclusão

- Todo texto visível ao jogador e texto de acessibilidade definido pelo app tem entrada correspondente em `pt_BR` e `en`.
- A troca de idioma atualiza preparação, dados, cartas e diálogo sem alterar o estado da partida.
- A lógica de seleção das cartas e consumo dos dados não depende de texto traduzido.
- Geração de localizações, análise estática e testes passam; a revisão visual dos dois idiomas não revela truncamentos relevantes.

## Referência

- [Internationalizing Flutter apps](https://docs.flutter.dev/ui/internationalization)
- [Localized messages are generated into source](https://docs.flutter.dev/release/breaking-changes/flutter-generate-i10n-source)
