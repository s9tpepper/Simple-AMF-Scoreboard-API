package scoreboard.model.vo
{
	[RemoteClass(alias="ScoreboardVO")]
	public class ScoreboardVO
	{
		/**
		 * The amount of scores in the scoreboard.
		 */		
		public var size:Number = 20;
		/**
		 * Array of ScoreVO objects, in order with top score at 0.
		 */		
		public var scores:Array;
		/**
		 * Indicates which page of scores to get.  By default goes to
		 * page 1 to get the very top scores.
		 */
		public var page:Number = 1;
		/**
		 * This number is returned from the scoreboard service after asking
		 * for any page, the size property is used to calculate the total pages.
		 */		
		public var totalPages:Number;
		/**
		* AMF class mapping variable, this value should equate
		* to the value of the AS3 class' [RemoteClassAlias(alias="ScoreboardVO")]
		* meta data in the AS3 class this PHP class should map to.
		* This value is only in the AS3 class to prevent warnings 
		* when the PHP object is encoded as an AS3 object, otherwise
		* warnings will appear to notify that this property is
		* missing from this class.
		*/
		public var _explicitType:String;
		
		/**
		* @Constructor
		*/
		public function ScoreboardVO()
		{
		}
	}
}