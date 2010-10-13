package scoreboard.api.classes
{
	import scoreboard.api.methods.Scoreboard_addScore;
	import scoreboard.api.methods.Scoreboard_getTopScores;
	import scoreboard.model.vo.ScoreVO;
	import scoreboard.model.vo.ScoreboardVO;
	
	
	public class Scoreboard
	{
		/**
		* @private
		*/
		static private var _Scoreboard_addScore:Scoreboard_addScore;
		/**
		* @private
		*/
		static private var _Scoreboard_getTopScores:Scoreboard_getTopScores;
		
		
		

		/**
		 * Adds a score to the scoreboard.
		 */		
		static public function addScore( successCallback:Function, failureCallback:Function, scoreVO:ScoreVO ):void
		{
			_Scoreboard_addScore = new Scoreboard_addScore( successCallback, failureCallback, scoreVO, true );
		}

		/**
		 * Retrieves a list of scores.
		 */		
		static public function getTopScores( successCallback:Function, failureCallback:Function, scoreboardVO:ScoreboardVO ):void
		{
			_Scoreboard_getTopScores = new Scoreboard_getTopScores( successCallback, failureCallback, scoreboardVO, true );
		}
	}
}