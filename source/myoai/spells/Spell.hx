package myoai.spells;

import myoai.characters.Character;

/**
 * ...
 * @author Sylvain Corsini
 */
@:allow(myoai.Engine)
class Spell 
{
	
	private var name : String;
	
	private var manaCost : Int;
	private var damage : Int;
	private var turnWait : Int;
	
	public function new(name:String = "spell")
	{
		this.name = name;
		
		this.manaCost = 0;
		this.damage = 0;
		this.turnWait = 0;
	}
	
	//////
	// Setters
	private function setManaCost(manaCost:Int) : Void			{ this.manaCost = manaCost; }
	private function setDamage(damage:Int) : Void				{ this.damage = damage; }
	private function setTurnWait(turnWait:Int) : Void			{ this.turnWait = turnWait; }
	
	//////
	// Getters
	
	public function getName() : String							{ return this.name; }
	public function getManaCost() : Int							{ return this.manaCost; }
	public function getDamage() : Int							{ return this.damage; }
	public function getTurnWait() : Int							{ return this.turnWait; }
	
}