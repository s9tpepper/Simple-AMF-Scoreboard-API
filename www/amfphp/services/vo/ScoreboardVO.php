<?php
/**
* ScoreboardVO class is used to request a set of top scores from the
* API using Scoreboard.getTopScores().  A ScoreboardVO object is in 
* the return of getTopScores() to provide the requested list.
* 
* @author Omar Gonzalez :: omar@almerblank.com
*/
class ScoreboardVO
{
	/**
	* Indicates the amount of scores for the leaderboard.  This is also
	* equal to the size of the page if an implementation is
	* done that displays more than just 1 page of scores.  This value
	* can be customized by changing the value when sending an instance
	* of ScoreboardVO to Scoreboard.getTopScores() to request a page
	* of top scores.
	*/
	var $size = 20;
	/**
	* An array of ScoreVO objects, the total being less than or equal 
	* the value indicated by the ScoreboardVO size property.
	*/
	var $scores;
	/**
	* The page of scores to retrieve from the Scoreboard.getTopScores() 
	* AMF call when this object is used as a request, and the page that
	* this ScoreboardVO represents when the object comes back from the
	* AMF server.
	*/
	var $page = 1;
	/**
	* When a ScoreboardVO is returned from the AMFService this property
	* will be set with the total amount of pages of scores available
	* calculated using the $size property.
	*/
	var $totalPages;
	/**
	* AMF class mapping variable, this value should equate
	* to the value of the AS3 class' [RemoteClassAlias(alias="ScoreboardVO")]
	* meta data in the AS3 class this PHP class should map to.
	*/
	var $_explicitType = "ScoreboardVO";
	
	/**
	* @Constructor
	*/
	public function __construct()
	{
	}
}