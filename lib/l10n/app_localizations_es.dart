// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get automataName => 'Autómata';

  @override
  String get automataCards => 'Cartas del Autómata';

  @override
  String get reshuffleDeck =>
      'El mazo se barajará de nuevo al robar la siguiente carta.';

  @override
  String get drawCard => 'Robar carta';

  @override
  String get setDolmens => 'Elegir dólmenes';

  @override
  String get placeNextDie => 'Colocar dado';

  @override
  String get nextCard => 'Siguiente carta';

  @override
  String availableDice(int count) {
    return 'Dados disponibles: $count';
  }

  @override
  String get allDiceUsed => 'Se han usado todos los dados.';

  @override
  String get connectDolmensTitle => 'Conectar 2 dólmenes';

  @override
  String get dolmenInstructions =>
      'Elige el par de dólmenes e indica cuántos dados quedan por colocar.';

  @override
  String get dolmenPair => 'Par de dólmenes';

  @override
  String get requiredDice => 'Dados necesarios';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get targetLabel => 'Objetivo';

  @override
  String get chosenDolmens => 'Dólmenes';

  @override
  String get connectingDolmens => 'Conectando los dos dólmenes';

  @override
  String get waitingForDolmens =>
      'Elige el par y la cantidad de dados para continuar.';

  @override
  String get movementMaximum => 'Máx.';

  @override
  String get movementLabel => 'Movimiento';

  @override
  String get dieLabel => 'Dado';

  @override
  String get actionLabel => 'Acción';

  @override
  String get tieBreakLabel => 'Desempate';

  @override
  String dolmenProgress(int placed, int required) {
    return '$placed/$required';
  }

  @override
  String get purple => 'Morado';

  @override
  String get yellow => 'Amarillo';

  @override
  String get mint => 'Verde agua';

  @override
  String get red => 'Rojo';

  @override
  String get language => 'Idioma';

  @override
  String get prepareAutomata => 'Prepara el Autómata';

  @override
  String get unofficialSetup => 'Autómata no oficial • preparación inicial';

  @override
  String get chooseColor => '1. Elige el color del Autómata';

  @override
  String get prepareComponents => '2. Prepara los componentes';

  @override
  String get playerCount =>
      'Prepara una partida para 2, 3 o 4 jugadores según la cantidad de oponentes automatizados.';

  @override
  String get setupPieces =>
      'Separa los 13 dados, el druida, el marcador de conocimiento, 6 menhires y 6 piedras rúnicas del color elegido.';

  @override
  String get unusedPieces =>
      'El Autómata no usa provisiones, tablero individual, tablillas, amuleto ni pociones.';

  @override
  String get startingShrine =>
      'Juegas en último lugar: elige primero tu santuario inicial. Después, elige al azar el santuario inicial del Autómata.';

  @override
  String get restartSetup => 'Reiniciar';

  @override
  String get rollDice => 'Tirar dados';

  @override
  String dieSemantics(int index, int value) {
    return 'Dado $index: $value';
  }

  @override
  String get automataDice => 'Dados del Autómata';

  @override
  String get rollingDice => 'Tirando los 13 dados…';

  @override
  String get sortedDice => '13 dados ordenados de menor a mayor.';

  @override
  String get automaticDice =>
      'Las cartas usarán estos dados automáticamente durante la partida.';

  @override
  String get continueToCards => 'Iniciar la partida';

  @override
  String get cardCompetitionTitle => 'Competición';

  @override
  String get cardSurroundFireTitle => 'Rodear una hoguera';

  @override
  String get cardStandingStoneTitle => 'Menhir o piedra rúnica';

  @override
  String get cardSickleAmuletTitle => 'Hoz o amuleto';

  @override
  String get cardTabletMistletoeTitle => 'Tablilla o muérdago';

  @override
  String get cardKnowledgeProvisionTitle => 'Conocimiento o provisiones';

  @override
  String get cardCompetitionTarget =>
      'El santuario más cercano con un dado de valor inferior al dado más alto del Autómata.';

  @override
  String get cardConnectDolmensTarget =>
      'Si el Autómata ya está conectado a un dolmen y faltan menos de 5 santuarios para llegar al dolmen del mismo color, ese es el objetivo. En caso contrario, roba otra carta.';

  @override
  String get cardSurroundFireTarget =>
      'Una hoguera que necesite solo un santuario más del Autómata y a la que se pueda llegar con un máximo de 6 provisiones. En caso contrario, roba otra carta.';

  @override
  String get cardStandingStoneTarget =>
      'El santuario más cercano con una acción de menhir o piedra rúnica.';

  @override
  String get cardSickleAmuletTarget =>
      'El santuario más cercano con una acción de hoz o amuleto.';

  @override
  String get cardTabletMistletoeTarget =>
      'El santuario más cercano con una acción de tablilla o muérdago.';

  @override
  String get cardKnowledgeProvisionTarget =>
      'El santuario más cercano con una acción de conocimiento o provisiones.';

  @override
  String get cardConnectDolmensMovement =>
      'En cada turno, avanza un santuario por el camino hacia el dolmen objetivo. Mantén este objetivo hasta completar la conexión.';

  @override
  String get cardCompetitionMovement => 'Hasta 6 provisiones de distancia.';

  @override
  String get cardDefaultMovement => 'Hasta 5 provisiones de distancia.';

  @override
  String get cardCompetitionDie => 'Dado de mayor valor.';

  @override
  String get cardKnowledgeProvisionDie => 'Dado de menor valor.';

  @override
  String get cardDefaultDie =>
      'Valor más frecuente. En caso de empate, elige al azar entre los valores empatados.';

  @override
  String get cardSickleAmuletAction => 'Hoz o amuleto del santuario objetivo.';

  @override
  String get chooseShrineAction =>
      'Elige el camino de menor coste. Después, da preferencia a un santuario vacío. Si aún queda más de una opción, el jugador elige.';

  @override
  String get cardKnowledgeProvisionAction =>
      'Conocimiento o provisiones del santuario objetivo.';

  @override
  String get cardDefaultAction => 'Selecciona las acciones disponibles';

  @override
  String get cardStandingStoneTieBreak =>
      'Si hay empate entre objetivos, prioriza el camino de menor coste y luego un santuario vacío. Si persiste el empate, el jugador elige.';

  @override
  String get dolmenPink => 'Rosa';

  @override
  String get dolmenOrange => 'Naranja';

  @override
  String get dolmenBlue => 'Azul';

  @override
  String get dolmenGreen => 'Verde';

  @override
  String get dolmenBrown => 'Marrón';

  @override
  String get dolmenBlack => 'Negro';

  @override
  String get playerConnectedDolmens => 'Ya conectado';

  @override
  String get chooseAutomaForm => 'Forma del Autómata';

  @override
  String get druidForm => 'Forma de druida';

  @override
  String get bearForm => 'Forma de oso';

  @override
  String get automaFormHint =>
      'La forma determina qué acciones aparecen más a menudo en el mazo de 10 cartas.';

  @override
  String get chooseSupplyAction => 'Selecciona una acción:';

  @override
  String get chooseTablet => 'Elegir tablilla';

  @override
  String get choosePotion => 'Elegir poción';

  @override
  String get noSupplyAvailable => 'No hay piezas disponibles para esta acción.';

  @override
  String get tabletQueueHelp =>
      'En el orden mostrado, selecciona la primera tablilla disponible en el tablero. Al confirmar, se descuenta una copia solo de la tablilla elegida.';

  @override
  String get potionQueueHelp =>
      'Selecciona la primera poción disponible en el orden mostrado. Al confirmar, la poción elegida y todas las anteriores se marcarán como usadas.';

  @override
  String tabletOption(int id) {
    return 'Tablilla $id';
  }

  @override
  String potionOption(int cost, int variant) {
    return 'Poción de coste $cost, variante $variant';
  }

  @override
  String get chooseStandingStone => 'Erigir un menhir';

  @override
  String get chooseRunestone => 'Erigir una piedra rúnica';

  @override
  String stonesPlaced(int count) {
    return '$count/6';
  }

  @override
  String get tabletInventory => 'Tablillas';

  @override
  String get potionInventory => 'Pociones';

  @override
  String get stoneInventory => 'Piedras';

  @override
  String potionCostHeading(int cost) {
    return 'Coste de muérdago: $cost';
  }

  @override
  String get removeInventoryPiece => 'Descontar una pieza';

  @override
  String get restoreInventoryPiece => 'Restaurar una pieza';

  @override
  String get closeInventory => 'Cerrar';

  @override
  String get finishGame => 'Terminar la partida';

  @override
  String get advanceSickle => 'Avanzar la hoz';

  @override
  String get chooseAmulet => 'Elegir un espacio del amuleto';

  @override
  String get amuletSlotHelp =>
      'Toca la fila a tu alcance. La gema sorteada ocupa el primer espacio libre desde la izquierda.';

  @override
  String get amuletComplete => 'Medallón completo';

  @override
  String get amuletUseSickle => 'Posición II ocupada: usar la hoz';

  @override
  String sickleProgress(int value) {
    return 'Hoz: $value/13';
  }

  @override
  String get sickleLimitHelp => 'La hoz ha llegado a 13. Elige el amuleto.';

  @override
  String get setupColorTitle => 'Elige el color del Autómata';

  @override
  String get bearFormDifficulty => 'La forma de oso es la más difícil.';

  @override
  String get chooseProvisions => 'Provisiones';

  @override
  String get advanceKnowledge => 'Avanzar el conocimiento';

  @override
  String knowledgeProgress(int value, int max) {
    return 'Conocimiento: $value/$max';
  }

  @override
  String get setupPlayersTitle => 'Número de jugadores';

  @override
  String setupPlayersSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jugadores',
      one: '1 jugador',
    );
    return '$_temp0';
  }

  @override
  String get auxiliaryPlacement =>
      'Usa esta carta para decidir dónde colocar el dado y qué acción realizar.';

  @override
  String get noAuxiliaryAction => 'Ninguna acción disponible';

  @override
  String get executeShrineAction => 'Realizar acción';

  @override
  String get shrineActionTitle => 'Acciones del santuario';

  @override
  String shrineActionHelp(int limit) {
    return 'Localiza el santuario indicado y marca hasta $limit de sus acciones disponibles.';
  }

  @override
  String get drawShrineAction => 'Sortear acción';

  @override
  String setupPlayersShort(int count) {
    return '$count jug.';
  }

  @override
  String get gameSummaryTitle => 'Resumen de la partida';

  @override
  String get viewGameSummary => 'Ver resumen';

  @override
  String get summaryDiceUsed => 'Dados usados';

  @override
  String get summaryDolmenPairs => 'Pares de dólmenes conectados';

  @override
  String get summaryTabletsRemoved => 'Tablillas retiradas';

  @override
  String get summaryPotionsRemoved => 'Pociones retiradas';

  @override
  String get summaryStandingStones => 'Menhires colocados';

  @override
  String get summaryRunestones => 'Piedras rúnicas colocadas';

  @override
  String get summarySickle => 'Hoz';

  @override
  String get summaryKnowledge => 'Conocimiento';

  @override
  String get summaryAmulet => 'Amuleto';

  @override
  String get exitApp => 'Salir de la aplicación';

  @override
  String get closeGameSummary => 'Cerrar resumen';

  @override
  String get aboutTitle => 'Acerca de';

  @override
  String aboutVersion(String version) {
    return 'Versión $version';
  }

  @override
  String get aboutDescription =>
      'Asistente no oficial para partidas en solitario de Druids of Edora con el juego de mesa físico.';

  @override
  String get aboutAcknowledgments => 'Agradecimientos';

  @override
  String get aboutCreatorCredit =>
      'Gracias a Julien (jujuandco), de la comunidad de BoardGameGeek, por crear Malfurion, el autómata original en el que se basa esta aplicación. Esta adaptación ajusta algunas reglas y automatiza partes de la partida.';

  @override
  String get aboutBggProfile => 'Perfil en BoardGameGeek';

  @override
  String get aboutOriginalSolo => 'Modo en solitario original';

  @override
  String get aboutLicense => 'Código fuente y licencia GPL v3';

  @override
  String get aboutPrivacyPolicy => 'Política de privacidad';

  @override
  String get aboutLinkError => 'No se pudo abrir el enlace.';
}
