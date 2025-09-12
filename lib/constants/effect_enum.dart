enum EffectEnum {
  alchemy('Reduces cooldown by -X% when a character harvest a plant.', negativeIsBetter: true),
  antipoison(
      'At the beginning of the turn, if the character has at least one poison on him, removes x poison damage.'),
  attack_air('Adds X Air Attack to its stats when equipped.'),
  attack_earth('Adds X Earth Attack to its stats when equipped.'),
  attack_fire('Adds X Fire Attack to its stats when equipped.'),
  attack_water('Adds X Water Attack to its stats when equipped.'),
  boost_dmg_air('Gives X Air Damage at the start of fight.'),
  boost_dmg_earth('Gives X Earth Damage at the start of fight.'),
  boost_dmg_fire('Gives X Fire Damage at the start of fight.'),
  boost_dmg_water('Gives X Water Damage at the start of fight.'),
  boost_hp('Gives X HP at the start of fight.'),
  boost_res_air('Gives X Air Resistance at the start of fight.'),
  boost_res_earth('Gives X Earth Resistance at the start of fight.'),
  boost_res_fire('Gives X Fire Resistance at the start of fight.'),
  boost_res_water('Gives X Water Resistance at the start of fight.'),
  burn(
      'On his first turn, apply a burn effect of x% of your attack of all elements. The damage is applied each turn and decreases by 10% each time.'),
  corrupted(
      'After every time the bearer of this effect is attacked, their resistance to the attack\'s element is reduced by x%, and can go negative.'),
  critical_strike(
      'Adds X% Critical Strike to its stats when equipped. Critical strikes adds 50% extra damage to an attack (1.5x).'),
  dmg('Adds X% Damage to its stats when equipped.'),
  dmg_air('Adds X% Air Damage to its stats when equipped.'),
  dmg_earth('Adds X% Earth Damage to its stats when equipped.'),
  dmg_fire('Adds X% Fire Damage to its stats when equipped.'),
  dmg_water('Adds X% Water Damage to its stats when equipped.'),
  fishing('Reduces cooldown by -X% when a character is fishing.', negativeIsBetter: true),
  gold('Adds X gold in your inventory.'),
  haste('Adds X Haste to its stats when equipped. The haste reduces the cooldown of a fight.'),
  heal('Heal X HP when the item is used.'),
  healing('Every 3 played turns, restores x% of HP at the start of the turn.'),
  hp('Adds X HP to its stats when equipped.'),
  inventory_space(
      'Adds X to the maximum number of items in the inventory when equipped.'),
  lifesteal(
      'Restores x% of the total attack of all elements in HP after a critical strike.'),
  mining('Reduces cooldown by -X% when a character mines a resource.', negativeIsBetter: true),
  poison(
      'At the start of its first turn, applies a x poison to its opponent. Loses x HP per turn.'),
  reconstitution('At the beginning of the turn x, restores all HP.'),
  res_air('Adds X Air Resistance to its stats when equipped.'),
  res_earth('Adds X Earth Resistance to its stats when equipped.'),
  res_fire('Adds X Fire Resistance to its stats when equipped.'),
  res_water('Adds X Water Resistance to its stats when equipped.'),
  restore('Heals X HP when the player has lost 50% of their life.'),
  wisdom(
      'Adds X Wisdom to its stats when equipped. Each point of wisdom increases your xp in combat and with skills. (1% extra per 10 wisdom)'),
  woodcutting('Reduces cooldown by -X% when a character logs a tree.', negativeIsBetter: true),
  ;

  const EffectEnum(this.description, {this.negativeIsBetter = false});

  final String description;
  final bool negativeIsBetter;
}
