package scoreboard.model.vo
{
	[RemoteClass(alias="ScoreVO")]
	/**
	* AMFResponse is used to send a response to an AMF client that
	* has requested something from an AMF service.
	* 
	* @author Omar Gonzalez :: omar@almerblank.com
	*/
	public class ScoreVO
	{
		/**
		* A unique identifier for the score entry
		*/
		public var id:int;
		/**
		* The user's name.
		*/
		public var name:String;
		/**
		* The user's game score.
		*/
		public var score:Number;
		/**
		* The device type for this score.
		*/
		public var device:String;
		/**
		* AMF class mapping variable, this value should equate
		* to the value of the AS3 class' [RemoteClassAlias(alias="ScoreVO")]
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
		public function ScoreVO()
		{
		}
	}
}