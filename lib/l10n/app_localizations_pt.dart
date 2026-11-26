// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get malfurionCards => 'Cartas do Malfurion';

  @override
  String get reshuffleDeck =>
      'Na próxima solicitação, o baralho será embaralhado novamente.';

  @override
  String get drawCard => 'Sortear carta';

  @override
  String get setDolmens => 'Definir dolmens';

  @override
  String get placeNextDie => 'Colocar dado';

  @override
  String get nextCard => 'Próxima carta';

  @override
  String availableDice(int count) {
    return 'Dados disponíveis: $count';
  }

  @override
  String get allDiceUsed => 'Todos os dados foram usados.';

  @override
  String get connectDolmensTitle => 'Conectar 2 dolmens';

  @override
  String get dolmenInstructions =>
      'Escolha o par de dolmens e quantos dados ainda precisam ser colocados.';

  @override
  String get dolmenPair => 'Par de dolmens';

  @override
  String get requiredDice => 'Dados necessários';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get targetLabel => 'Alvo';

  @override
  String get chosenDolmens => 'Dolmens';

  @override
  String get connectingDolmens => 'Conectando os dois dolmens';

  @override
  String get waitingForDolmens =>
      'Aguardando a definição do par e da quantidade de dados.';

  @override
  String get movementMaximum => 'Máx.';

  @override
  String get movementLabel => 'Movimento';

  @override
  String get dieLabel => 'Dado';

  @override
  String get actionLabel => 'Ação';

  @override
  String get tieBreakLabel => 'Desempate';

  @override
  String dolmenProgress(int placed, int required) {
    return '$placed/$required';
  }

  @override
  String get purple => 'Roxo';

  @override
  String get yellow => 'Amarelo';

  @override
  String get mint => 'Verde-água';

  @override
  String get red => 'Vermelho';

  @override
  String get language => 'Idioma';

  @override
  String get prepareMalfurion => 'Prepare o Malfurion';

  @override
  String get unofficialSetup => 'Autômato não oficial • preparação inicial';

  @override
  String get chooseColor => '1. Escolha a cor do autômato';

  @override
  String get prepareComponents => '2. Prepare os componentes';

  @override
  String get playerCount =>
      'Prepare o jogo para 2, 3 ou 4 jogadores conforme a quantidade de Malfurions.';

  @override
  String get setupPieces =>
      'Separe os 13 dados, o druida, o marcador de conhecimento, 6 pedras eretas e 6 pedras rúnicas da cor escolhida.';

  @override
  String get unusedPieces =>
      'Malfurion não usa provisões, tabuleiro individual, tábuas, amuleto ou poções.';

  @override
  String get startingShrine =>
      'Você joga por último: escolha seu santuário inicial primeiro. Depois, escolha aleatoriamente um santuário inicial para Malfurion.';

  @override
  String get restartSetup => 'Reiniciar';

  @override
  String get rollDice => 'Rolar dados';

  @override
  String dieSemantics(int index, int value) {
    return 'Dado $index: $value';
  }

  @override
  String get malfurionDice => 'Dados do Malfurion';

  @override
  String get rollingDice => 'Rolando os 13 dados…';

  @override
  String get sortedDice => '13 dados ordenados do menor para o maior.';

  @override
  String get automaticDice =>
      'Estes dados serão usados automaticamente pelas cartas durante a partida.';

  @override
  String get continueToCards => 'Iniciar a partida';

  @override
  String get cardCompetitionTitle => 'Competição';

  @override
  String get cardSurroundFireTitle => 'Cercar uma fogueira';

  @override
  String get cardStandingStoneTitle => 'Pedra ereta ou pedra rúnica';

  @override
  String get cardSickleAmuletTitle => 'Foice ou amuleto';

  @override
  String get cardTabletMistletoeTitle => 'Tábua ou visco';

  @override
  String get cardKnowledgeProvisionTitle => 'Conhecimento ou provisões';

  @override
  String get cardCompetitionTarget =>
      'O santuário mais próximo com um dado menor que o dado mais forte de Malfurion.';

  @override
  String get cardConnectDolmensTarget =>
      'Se Malfurion já estiver conectado a um dolmen e faltarem menos de 5 santuários para chegar ao dolmen da mesma cor, esse é o alvo. Caso contrário, solicite outra carta.';

  @override
  String get cardSurroundFireTarget =>
      'Uma fogueira que precise de apenas mais um santuário de Malfurion e que possa ser alcançada por até 6 provisões. Caso contrário, solicite outra carta.';

  @override
  String get cardStandingStoneTarget =>
      'O santuário mais próximo com ação de pedra ereta ou pedra rúnica.';

  @override
  String get cardSickleAmuletTarget =>
      'O santuário mais próximo com ação de foice ou amuleto.';

  @override
  String get cardTabletMistletoeTarget =>
      'O santuário mais próximo com ação de tábua ou visco.';

  @override
  String get cardKnowledgeProvisionTarget =>
      'O santuário mais próximo com ação de conhecimento ou provisões.';

  @override
  String get cardConnectDolmensMovement =>
      'A cada turno, avance para um santuário no caminho até o dolmen alvo. Mantenha este objetivo até concluí-lo.';

  @override
  String get cardCompetitionMovement => 'Até 6 provisões de distância.';

  @override
  String get cardDefaultMovement => 'Até 5 provisões de distância.';

  @override
  String get cardCompetitionDie => 'Dado mais forte.';

  @override
  String get cardKnowledgeProvisionDie => 'Dado mais fraco.';

  @override
  String get cardDefaultDie =>
      'Valor mais frequente; em caso de empate, sorteie entre os valores empatados.';

  @override
  String get cardSickleAmuletAction => 'Foice ou amuleto do santuário alvo.';

  @override
  String get chooseShrineAction =>
      'Escolha o caminho menos caro. Depois, dê preferência a um santuário vazio. Se ainda houver mais de uma opção, o jogador escolhe.';

  @override
  String get cardKnowledgeProvisionAction =>
      'Conhecimento ou provisões do santuário alvo.';

  @override
  String get cardDefaultAction =>
      'Conte as ações a partir da superior esquerda, no sentido horário, pelo valor do dado escolhido.';

  @override
  String get cardStandingStoneTieBreak =>
      'Empate entre alvos: caminho menos caro, depois santuário vazio e, por fim, escolha do jogador.';

  @override
  String get dolmenPink => 'Rosa';

  @override
  String get dolmenOrange => 'Laranja';

  @override
  String get dolmenBlue => 'Azul';

  @override
  String get dolmenGreen => 'Verde';

  @override
  String get dolmenBrown => 'Marrom';

  @override
  String get dolmenBlack => 'Preto';

  @override
  String get playerConnectedDolmens => 'Já conectado';

  @override
  String get chooseAutomaForm => 'Forma de Malfurion';

  @override
  String get druidForm => 'Forma Druida';

  @override
  String get bearForm => 'Forma Urso';

  @override
  String get automaFormHint =>
      'A forma determina quais ações aparecem mais vezes no baralho de 10 cartas.';

  @override
  String get chooseSupplyAction => 'Selecione uma das ações:';

  @override
  String get chooseTablet => 'Escolher tábua';

  @override
  String get choosePotion => 'Escolher poção';

  @override
  String get noSupplyAvailable => 'Nenhum item disponível para esta ação.';

  @override
  String get tabletQueueHelp =>
      'Selecione a primeira tábua disponível na ordem exibida. Ao confirmar, descontamos uma cópia da tábua escolhida e uma de cada tábua anterior. Cada tábua começa com duas cópias.';

  @override
  String get potionQueueHelp =>
      'Selecione a primeira poção disponível na ordem exibida. Ao confirmar, a poção escolhida e todas as anteriores saem dos próximos sorteios.';

  @override
  String tabletOption(int id) {
    return 'Tábua $id';
  }

  @override
  String potionOption(int cost, int variant) {
    return 'Poção de custo $cost, variante $variant';
  }

  @override
  String get chooseStandingStone => 'Erguer pedra ereta';

  @override
  String get chooseRunestone => 'Erguer pedra rúnica';

  @override
  String stonesAvailable(int count) {
    return '$count/6';
  }

  @override
  String get tabletInventory => 'Tábuas';

  @override
  String get potionInventory => 'Poções';

  @override
  String get stoneInventory => 'Pedras';

  @override
  String potionCostHeading(int cost) {
    return 'Custo de visgo $cost';
  }

  @override
  String get removeInventoryPiece => 'Descontar uma peça';

  @override
  String get restoreInventoryPiece => 'Restaurar uma peça';

  @override
  String get closeInventory => 'Fechar';

  @override
  String get finishGame => 'Encerrar partida';

  @override
  String get advanceSickle => 'Avançar a foice';

  @override
  String get chooseAmulet => 'Escolher espaço do amuleto';

  @override
  String get amuletSlotHelp =>
      'Selecione um espaço livre na posição ao alcance.';

  @override
  String get amuletUseSickle => 'Posição II ocupada: usar a foice';

  @override
  String sickleProgress(int value) {
    return 'Foice: $value/13';
  }

  @override
  String get sickleLimitHelp => 'A foice chegou a 13. Escolha o amuleto.';

  @override
  String get setupColorTitle => 'Selecione a cor de Malfurion';

  @override
  String get bearFormDifficulty => 'A Forma Urso é a mais difícil.';

  @override
  String get chooseProvisions => 'Provisões';

  @override
  String get advanceKnowledge => 'Avançar conhecimento';

  @override
  String knowledgeProgress(int value, int max) {
    return 'Conhecimento: $value/$max';
  }

  @override
  String get setupPlayersTitle => 'Número de jogadores';

  @override
  String setupPlayersSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jogadores',
      one: '1 jogador',
    );
    return '$_temp0';
  }

  @override
  String get auxiliaryPlacement =>
      'Use esta carta para definir onde colocar o dado e escolher a ação.';

  @override
  String get noAuxiliaryAction => 'Nenhuma ação disponível';

  @override
  String get executeShrineAction => 'Executar ação';

  @override
  String get shrineActionTitle => 'Ações do santuário';

  @override
  String shrineActionHelp(int limit) {
    return 'Localize o santuário indicado e marque até $limit ações disponíveis nele.';
  }

  @override
  String get drawShrineAction => 'Sortear ação';

  @override
  String setupPlayersShort(int count) {
    return '$count jgs';
  }
}
