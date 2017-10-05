package myoai.actions;

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
	Cast(spell:Spell);
	Equip(weapon:Weapon);
}