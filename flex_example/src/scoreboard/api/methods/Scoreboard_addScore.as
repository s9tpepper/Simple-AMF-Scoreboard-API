package scoreboard.api.methods
{
	import almerblank.amf.utils.AbstractAMFNetConnection;
	
	import flash.net.Responder;
	
	import scoreboard.model.vo.ScoreVO;
	
	/**
	 * AbstractService class contains the base functionality for communicationg
	 * with an AMF server.
	 * 
	 * @author Omar Gonzalez
	 */	
	public class Scoreboard_addScore extends AbstractAMFNetConnection
	{
		private static const _METHOD:String = "Scoreboard.addScore";
		
		private var _scoreVO:ScoreVO;

		
		/**
		 * @Constructor
		 * 
		 * @param command The class and method to execute on the server, "MyClass.myMethod".
		 * @param successCallback The method to call on success.  Method signature should be "function successCallback( result:Object )"
		 * @param failureCallback The method to call on failure.  Method signature should be "function failureCallback( fault:Object )"
		 * @param methodArgs An Array of objects to send to the remote method, depending on what the remote method expects.
		 * @param executeNow (Optional) This parameter defaults to true, so that the remote method is invoked immediately.  Must call the invoke() method if set to false.
		 */		
		public function Scoreboard_addScore( successCallback:Function, failureCallback:Function, scoreVO:ScoreVO, invokeNow:Boolean = true )
		{
			_scoreVO = scoreVO;

			
			super( _METHOD, successCallback, failureCallback, invokeNow );
		}
		
		override public function invoke():void
		{
			super.invoke(); netConnection.call( method, new Responder(success, failure), _scoreVO );
		}
	}
}