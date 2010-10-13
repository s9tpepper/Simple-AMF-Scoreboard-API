<?php
/**
* ScoreVO is used when submitting a new score.  The $name,
* $score and $device values are expected by Scoreboard.addScore().
* When requesting a list of scores from Scoreboard.getTopScores(), 
* the AMFResponse instance's data property will contain an array
* of ScoreVO objects.
*
* @author Omar Gonzalez :: omar@almerblank.com
*/
class ScoreVO
{
	/**
	* Unique id for this score entry.
	*/
	var $id;
	/**
	* The user's name.
	*/
	var $name;
	/**
	* The user's game score.
	*/
	var $score;
	/**
	* The device type for this score.
	*/
	var $device;
	/**
	* AMF class mapping variable, this value should equate
	* to the value of the AS3 class' [RemoteClassAlias(alias="ScoreVO")]
	* meta data in the AS3 class this PHP class should map to.
	*/
	var $_explicitType = "ScoreVO";
	
	/**
	* @Constructor
	*/
	public function __construct()
	{
	}
}