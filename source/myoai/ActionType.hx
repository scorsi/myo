package myoai;

import myoai.characters.Character;
import myoai.spells.Spell;
import myoai.weapons.Weapon;

/**
 * @author Sylvain Corsini
 */
enum ActionType 
{
	Wait;
	Attack;
	Defend;
	Cast(spell:Spell, target:Character);
	Equip(rightWeapon:Weapon, leftWeapon:Weapon);
}