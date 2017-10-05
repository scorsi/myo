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
	private var turnRemaining : Int;
	private var target : Character;
	
	public function new(name:String = "spell", target:Character = null)
	{
		this.name = name;
		this.target = target;
		
		this.manaCost = 0;
		this.damage = 0;
		this.turnWait = 0;
		this.turnRemaining = 0;
	}
	
	//////
	// Utils
	
	private function isCastFinished() : Bool					{ return (this.turnRemaining <= 0); }
	private function nextTurn() : Void							{ this.turnRemaining--; }
	
	//////
	// Setters
	private function setManaCost(manaCost:Int) : Void			{ this.manaCost = manaCost; }
	private function setDamage(damage:Int) : Void				{ this.damage = damage; }
	private function setTurnWait(turnWait:Int) : Void			{ this.turnWait = turnWait; this.turnRemaining = turnWait; }
	
	//////
	// Getters
	
	public function getName() : String							{ return this.name; }
	public function getManaCost() : Int							{ return this.manaCost; }
	public function getDamage() : Int							{ return this.damage; }
	public function getTurnWait() : Int							{ return this.turnWait; }
	public function getTarget() : Character						{ return this.target; }
	
}