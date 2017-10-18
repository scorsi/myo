package myoai;

import myoai.characters.Character;
import myoai.characters.Enemy;
import myoai.characters.Player;
import myoai.spells.Spell;
import myoai.weapons.Weapon;
import myoai.ActionType;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;


/**
 * ...
 * @author Sylvain Corsini
 */
@:final
class Engine 
{

	private var main : Main; // Reference for creating UI
	
	private var initialized : Bool = false;
	private var isUiInitialized : Bool = false;
	
	static private var player : Player;
	static private var enemy : Enemy;
	private var playerAction : ActionType;
	private var enemyAction : ActionType;
	
	private var stage : Int;
	private var isStageStarted : Bool;
	private var isPlayerTurn : Bool;
	
	private var playerTitleText : TextField;
	private var playerInfoText : TextField;
	private var playerActionText : TextField;
	private var enemyTitleText : TextField;
	private var enemyInfoText : TextField;
	private var enemyActionText : TextField;
	private var stageText : TextField;
	
	//////
	// Methods
	
	public function new(main:Main) 
	{
		this.main = main;
		
		Manager.initialize();
		
		Engine.player = new Player();
		Engine.enemy = new Enemy();
	} // new
	
	public function update() : Bool
	{
		
		if (!this.isStageStarted)
			this.nextStage();
		
		this.updateUI();
		
		if (this.isPlayerTurn)
		{
			if (Engine.player.isAlive())
			{
				this.playerAction = Engine.player.playTurn();
				this.handleAction(this.playerAction, Engine.player, Engine.enemy);
				this.displayAction(this.playerAction, this.playerActionText);
			}
			else
			{
				this.endStage();
				return false;
			}
			
			this.isPlayerTurn = false;
		}
		else
		{
			if (Engine.enemy.isAlive())
			{
				this.enemyAction = Engine.enemy.playTurn();
				this.handleAction(this.enemyAction, Engine.enemy, Engine.player);
				this.displayAction(this.enemyAction, this.enemyActionText);
			}
			else
			{
				this.endStage();
				return true;
			}
			
			this.isPlayerTurn = true;
		}
		
		return true;
		
	} // update
	
	private function handleAction(action:ActionType, caster:Character, target:Character)
	{
		caster.stopDefending();
		switch (action) 
		{
			case ActionType.Wait :
				if (caster.getIsCasting() && caster.isCastFinished())
				{
					var spell:Spell = caster.getCastingSpell();
					var target:Character = caster.getCastTarget();
					target.reduceHealth(spell.getDamage());
					caster.stopCasting();
				}
			case ActionType.Attack :
				target.reduceHealth(caster.getActualDamage());
				caster.decreaseNbrOfStrongAttack();
			case ActionType.Defend :
				caster.startDefending();
			case ActionType.Cast(spell, target) :
				caster.startCasting(spell, target);
			case ActionType.Equip(rightWeapon, leftWeapon) :
				caster.equipWeapons(rightWeapon, leftWeapon);
		}
	} // handleAction
	
	private function displayAction(action:ActionType, textField:TextField)
	{
		switch (action) 
		{
			case ActionType.Wait :
				textField.text = "...";
			case ActionType.Attack :
				textField.text = "Attacks";
			case ActionType.Defend :
				textField.text = "Defends";
			case ActionType.Cast(spell, target) :
				textField.text = 'Casts ${spell.getName()} to ${target.getName()}';
			case ActionType.Equip(rightWeapon, leftWeapon) :
				if (leftWeapon != null)
					textField.text = 'Equips ${rightWeapon.getName()} and ${leftWeapon.getName()}';
				else
					textField.text = 'Equips ${rightWeapon.getName()}';
		}
		textField.alpha = 1;
	}
	
	private function endStage() : Void
	{
		this.isStageStarted = false;
	} // endStage
	
	private function nextStage() : Void
	{
		this.isPlayerTurn = true;
		this.stage++;
		this.stageText.text = 'Stage: ${this.stage}';
		Engine.player.beginStage(this.stage);
		Engine.enemy.beginStage(this.stage);
		this.isStageStarted = true;
	} // startStage
	
	private function updateUI() : Void
	{
		inline function updateCharacterUI(infoText:TextField, character:Character) : Void
		{
			infoText.text =
				'Health: ${character.getHealth()} / ${character.getMaxHealth()}\n' +
				'Mana: ${character.getMana()} / ${character.getMaxMana()}\n' +
				'Damage: ${character.getActualDamage()}\n';
			if (character.getRightEquipedWeapon() != null)
				infoText.text += 'Right Weapon: ${character.getRightEquipedWeapon().getName()}\n';
			if (character.getLeftEquipedWeapon() != null)
				infoText.text += 'Left Weapon: ${character.getLeftEquipedWeapon().getName()}\n';
		}
		
		updateCharacterUI(this.playerInfoText, Engine.player);
		updateCharacterUI(this.enemyInfoText, Engine.enemy);
		this.playerActionText.alpha = 0;
		this.enemyActionText.alpha = 0;
	} // updateUI
	
	public function initialize() : Bool
	{
		this.stage = -1;
		this.isStageStarted = false;
		this.isPlayerTurn = true;
		
		if (!Engine.player.initialize() || !Engine.enemy.initialize())
			return false;
		
		if (!this.isUiInitialized)
			if (!this.initializeUI())
				return false;
			
		return this.initialized = true;
	} // initialize
	
	private function initializeUI() : Bool
	{
		inline function createTextField(textField:TextField, font:String, fontSize:Int, color:Int)
		{
			var textFormat:TextFormat = new TextFormat(font, fontSize, color, true);
			textFormat.align = TextFormatAlign.CENTER;
			
			this.main.addChild(textField);
			textField.width = 400;
			textField.height = 400;
			textField.y = 0;
			textField.defaultTextFormat = textFormat;
			textField.selectable = false;
		}
		
		// Stage
		this.stageText = new TextField();
		createTextField(this.stageText, "Verdana", 32, 0xeeeeee);
		this.stageText.x = 200;
		
		// Player title
		this.playerTitleText = new TextField();
		createTextField(this.playerTitleText, "Verdana", 32, 0xeeeeee);
		this.playerTitleText.y = 30;
		this.playerTitleText.text = "YOU";
		
		// Enemy Title
		this.enemyTitleText = new TextField();
		createTextField(this.enemyTitleText, "Verdana", 32, 0xeeeeee);
		this.enemyTitleText.y = 30;
		this.enemyTitleText.x = 400;
		this.enemyTitleText.text = "ENEMY";
		
		// Player info
		this.playerInfoText = new TextField();
		createTextField(this.playerInfoText, "Verdana", 24, 0xdddddd);
		this.playerInfoText.x = 0;
		this.playerInfoText.y = 80;
		
		// Enemy info
		this.enemyInfoText = new TextField();
		createTextField(this.enemyInfoText, "Verdana", 24, 0xdddddd);
		this.enemyInfoText.x = 400;
		this.enemyInfoText.y = 80;
		
		// Player action
		this.playerActionText = new TextField();
		createTextField(this.playerActionText, "Verdana", 32, 0xeeeeee);
		this.playerActionText.y = 300;
		
		// Enemy action
		this.enemyActionText = new TextField();
		createTextField(this.enemyActionText, "Verdana", 32, 0xeeeeee);
		this.enemyActionText.y = 300;
		this.enemyActionText.x = 400;
		
		return (this.isUiInitialized = true);
	} // initializeUI
	
	public function shutdown() : Bool
	{
		return !(this.initialized = false);
	} // shutdown
	
	//////
	// Getters
	
	static public function getEnemy() : Character					{ return Engine.enemy; }
	static public function getPlayer() : Character					{ return Engine.player; }
	
}