# myo
Make your own AI.

Myo is a game for developpers. You have to create your own AI (in source/AI.hx) and defeat the maximum of enemies !

## Example of AI script
Here's an example of AI implementation and how to use the Engine and Manager.
```haxe
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
			return ActionType.Equip(Manager.getWeapon(WeaponType.Sword), Manager.getWeapon(WeaponType.Sword));
		}
		if (Engine.getPlayer().getHealth() < Engine.getPlayer().getMaxHealth() / 4)
		{
			if (Engine.getPlayer().canUseSpell(Manager.getSpell(SpellType.Heal)))
				return ActionType.Cast(Manager.getSpell(SpellType.Heal), Engine.getPlayer());
		}
		return ActionType.Attack;
	}
	
}
```
