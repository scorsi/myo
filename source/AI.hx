package;

import myoai.Manager;
import myoai.Engine;

import myoai.ActionType;
import myoai.SpellType;
import myoai.WeaponType;
import myoai.spells.Spell;
import myoai.weapons.Weapon;

/**
 * The user AI implementation.
 */
class AI 
{
	
	var equiped : Bool;
	
	public function new()
	{
		// Do something at first stage
		this.equiped = false;
	}
	
	public function beginStage(stage:Int) : Void
	{
		// Do something at each stage begin
	}
	
	public function playTurn() : ActionType
	{
		if (Engine.getPlayer().getIsCasting())
		{
			return ActionType.Wait;
		}
		if (!equiped)
		{
			this.equiped = true;
			return ActionType.Equip(Manager.getWeapon(WeaponType.Axe), null);
		}
		if (Engine.getPlayer().getHealth() < Engine.getPlayer().getMaxHealth() / 4)
		{
			if (Engine.getPlayer().canUseSpell(Manager.getSpell(SpellType.Heal)))
				return ActionType.Cast(Manager.getSpell(SpellType.Heal), Engine.getPlayer());
		}
		return ActionType.Attack;
	}
	
}