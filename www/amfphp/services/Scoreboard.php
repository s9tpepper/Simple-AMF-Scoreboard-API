<?php
require_once("vo/AMFResponse.php");
require_once("vo/ScoreVO.php");
require_once("vo/ScoreboardVO.php");
/**
* The Scoreboard class provides the two methods required to
* interface with the scoreboard.
*/
class Scoreboard
{
	/**
	* Reference to the database connection.
	*/
	var $connection;
	/**
	* Reference to the database.
	*/
	var $database;
	
	/**
	* @Constructor
	*/
	public function __construct()
	{
		$this->_init();
	}
	/**
	* Initialize the database connection.
	*/
	private function _init()
	{
		$this->connection	= mysql_connect("yoursqlserver.com", "database_user_name", "database_user_password");
		$this->database		= mysql_select_db("database_name", $this->connection);
	}
	/**
	* Adds a score to the list of high-scores.
	* 
	* @param scoreVO ScoreVO
	*/
	public function addScore(ScoreVO $scoreVO)
	{
		$sql = "INSERT INTO tbl_scores (score, name, device) VALUES (%d, '%s', '%s')";
		$sql = sprintf($sql, $this->_cleanUp($scoreVO->score), $this->_cleanUp($scoreVO->name), $this->_cleanUp($scoreVO->device));
		$result = mysql_query($sql);
		
		$amfResponse = new AMFResponse();
		if (mysql_affected_rows() > 0)
		{
			$scoreVO->id			= mysql_insert_id();
			$amfResponse->success	= true;
			$amfResponse->data		= $scoreVO;
		}
		else
		{
			$amfResponse->success	= false;
			$amfResponse->data		= $sql;
			$amfResponse->message	= "Error inserting score. " . mysql_error();
		}
		
		return $amfResponse;
	}
	/**
	* Returns a list of top scores.
	*
	* @param scoreboardVO ScoreboardVO
	*/
	public function getTopScores(ScoreboardVO $scoreboardVO)
	{
		$limit = $scoreboardVO->size;
		$offset = ($scoreboardVO->page - 1) * $limit;
		$sql = "SELECT * FROM tbl_scores ORDER BY score DESC LIMIT %d,%d";
		$sql = sprintf($sql, $offset, $limit);
		$result = mysql_query($sql);
		
		$amfResponse = new AMFResponse();
		if (count($result) > 0)
		{
			while ($row = mysql_fetch_object($result))
			{
				$data[] = $row;
			}
			
			// Get page count
			$sql = "SELECT COUNT(id) as totalScores FROM tbl_scores";
			$result = mysql_query($sql);
			$result = mysql_fetch_object($result);
			$scoreboardVO->totalPages = ceil($result->totalScores/$limit);
			
			// Strong type data if there is any
			$scores = (count($data) > 0) ? $this->_strongType($data, "ScoreVO") : array();
			
			$scoreboardVO->scores	= $scores;
			$amfResponse->success	= true;
			$amfResponse->data		= $scoreboardVO;
		}
		else
		{
			$amfResponse->success	= false;
			$amfResponse->message	= "There are no high scores.";
		}
		
		return $amfResponse;
	}
	
	/**
	 * Turns raw PHP objects in an array to a specific type of AMFPHP/AS3 VO data class
	 * 
	 * @param $itemsArray An array of plain PHP objects to convert to a VO class
	 * @param $voClassName A string name of a valid VO class
	 */
	private function _strongType( $itemsArray, $voClassName )
	{
		$voClassDeflector = new ReflectionClass( $voClassName );
		
		$voProperties = $voClassDeflector->getProperties();
		
		$voItems = array();
		foreach ($itemsArray as $item)
		{
			$vo = $voClassDeflector->newInstance();
			
			foreach ($voProperties as $reflectionProperty)
			{
				$vo->{$reflectionProperty->getName()} = $item->{$reflectionProperty->getName()};
			}
			
			array_push( $voItems, $vo );
		}
		
		return $voItems;
	}
	
	/**
	 * Cleans general user input
	 */
	private function _cleanUp( $string )
	{
		// Remove html tags, trim whitespace, add slashes to chars
		$string = trim(strip_tags(addslashes($string)));
		
		// Is it enabled?
		if (get_magic_quotes_gpc()) {
			$string = stripslashes($string);
		}
		
		// Mysql injection protection
		$string = mysql_real_escape_string($string);
		return $string;
	}
}