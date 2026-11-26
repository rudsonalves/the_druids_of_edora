import 'dart:math';

enum AutomaCard {
  competition,
  connectDolmens,
  surroundFire,
  standingStone,
  sickleAmulet,
  tabletMistletoe,
  knowledgeProvision;

  String title(bool pt) => switch (this) {
    competition => pt ? 'Competição' : 'Competition',
    connectDolmens => pt ? 'Conectar 2 dolmens' : 'Connect 2 dolmens',
    surroundFire => pt ? 'Cercar uma fogueira' : 'Surround a fire',
    standingStone =>
      pt ? 'Pedra ereta ou pedra rúnica' : 'Standing stone or runestone',
    sickleAmulet => pt ? 'Foice ou amuleto' : 'Sickle or amulet',
    tabletMistletoe => pt ? 'Tábua ou visco' : 'Tablet or mistletoe',
    knowledgeProvision =>
      pt ? 'Conhecimento ou provisões' : 'Knowledge or provisions',
  };

  String target(bool pt) => switch (this) {
    competition =>
      pt
          ? 'O santuário mais próximo com um dado menor que o dado mais forte de Malfurion.'
          : 'The nearest shrine with a die weaker than Malfurion’s strongest die.',
    connectDolmens =>
      pt
          ? 'Se Malfurion já estiver conectado a um dolmen e faltarem menos de 5 santuários para chegar ao dolmen da mesma cor, esse é o alvo. Caso contrário, solicite outra carta.'
          : 'If Malfurion is connected to a dolmen and fewer than 5 shrines remain to reach its matching dolmen, target that dolmen. Otherwise, draw another card.',
    surroundFire =>
      pt
          ? 'Uma fogueira que precise de apenas mais um santuário de Malfurion e que possa ser alcançada por até 6 provisões. Caso contrário, solicite outra carta.'
          : 'A fire needing just one more of Malfurion’s shrines, reachable for 6 provisions or less. Otherwise, draw another card.',
    standingStone =>
      pt
          ? 'O santuário mais próximo com ação de pedra ereta ou pedra rúnica.'
          : 'The nearest shrine with a standing stone or runestone action.',
    sickleAmulet =>
      pt
          ? 'O santuário mais próximo com ação de foice ou amuleto.'
          : 'The nearest shrine with a sickle or amulet action.',
    tabletMistletoe =>
      pt
          ? 'O santuário mais próximo com ação de tábua ou visco.'
          : 'The nearest shrine with a tablet or mistletoe action.',
    knowledgeProvision =>
      pt
          ? 'O santuário mais próximo com ação de conhecimento ou provisões.'
          : 'The nearest shrine with a knowledge or provision action.',
  };

  String movement(bool pt) => switch (this) {
    connectDolmens =>
      pt
          ? 'A cada turno, avance para um santuário no caminho até o dolmen alvo. Mantenha este objetivo até concluí-lo.'
          : 'Each turn, move to one shrine along the path to the target dolmen. Keep this objective until it is complete.',
    competition || surroundFire =>
      pt ? 'Até 6 provisões de distância.' : 'Up to 6 provisions away.',
    _ => pt ? 'Até 5 provisões de distância.' : 'Up to 5 provisions away.',
  };

  String die(bool pt) => switch (this) {
    competition || standingStone => pt ? 'Dado mais forte.' : 'Strongest die.',
    knowledgeProvision => pt ? 'Dado mais fraco.' : 'Weakest die.',
    _ =>
      pt
          ? 'Valor mais frequente; em caso de empate, sorteie entre os valores empatados.'
          : 'Most frequent value; on a tie, randomly choose among tied values.',
  };

  String action(bool pt) => switch (this) {
    standingStone =>
      pt
          ? 'Pedra ereta ou pedra rúnica do santuário alvo.'
          : 'Standing stone or runestone at the target shrine.',
    sickleAmulet =>
      pt
          ? 'Foice ou amuleto do santuário alvo.'
          : 'Sickle or amulet at the target shrine.',
    tabletMistletoe =>
      pt
          ? 'Tábua ou visco do santuário alvo.'
          : 'Tablet or mistletoe at the target shrine.',
    knowledgeProvision =>
      pt
          ? 'Conhecimento ou provisões do santuário alvo.'
          : 'Knowledge or provisions at the target shrine.',
    _ =>
      pt
          ? 'Conte as ações a partir da superior esquerda, no sentido horário, pelo valor do dado escolhido.'
          : 'Count action spaces clockwise from the top left by the chosen die value.',
  };

  String? tieBreak(bool pt) => switch (this) {
    standingStone || sickleAmulet || tabletMistletoe || knowledgeProvision =>
      pt
          ? 'Empate entre alvos: caminho menos caro, depois santuário vazio e, por fim, escolha do jogador.'
          : 'Target tie: cheapest path, then empty shrine, then player’s choice.',
    _ => null,
  };
}

class AutomaDeck {
  AutomaDeck(this.random);

  final Random random;
  final List<AutomaCard> _remaining = [];

  int get remaining => _remaining.length;
  int get drawnInCycle => AutomaCard.values.length - remaining;

  AutomaCard draw() {
    if (_remaining.isEmpty) {
      _remaining.addAll(AutomaCard.values);
      _remaining.shuffle(random);
    }
    return _remaining.removeLast();
  }
}
