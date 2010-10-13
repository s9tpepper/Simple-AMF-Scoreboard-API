package almerblank.amf.utils
{
	import flash.net.NetConnection;
	import flash.net.ObjectEncoding;
	
	/**
	 * AbstractAMFNetConnection class contains the base functionality for communicating
	 * with an AMF server.
	 * 
	 * @author Omar Gonzalez
	 */	
	public class AbstractAMFNetConnection
	{
		/**
		 * The AMF gateway URL.
		 */		
		static public var connection:String = "http://plugrman.com/example/scoreboard/amfphp/gateway.php";
		
		protected var method:String;
		protected var success:Function;
		protected var failure:Function;
		protected var methodArguments:Array;
		protected var netConnection:NetConnection;
		
		/**
		 * @Constructor
		 * 
		 * @param command The class and method to execute on the server, "MyClass.myMethod".
		 * @param successCallback The method to call on success.  Method signature should be "function successCallback( result:Object )"
		 * @param failureCallback The method to call on failure.  Method signature should be "function failureCallback( fault:Object )"
		 * @param methodArgs An Array of objects to send to the remote method, depending on what the remote method expects.
		 * @param executeNow (Optional) This parameter defaults to true, so that the remote method is invoked immediately.  Must call the invoke() method if set to false.
		 */		
		public function AbstractAMFNetConnection( command:String, successCallback:Function, failureCallback:Function, invokeNow:Boolean = true )
		{
			_init( command, successCallback, failureCallback, invokeNow );
		}
		
		private function _init( command:String, successCallback:Function, failureCallback:Function, invokeNow:Boolean = true ):void
		{
			method				= command;
			success				= successCallback;
			failure				= failureCallback;
			
			initNetConnection();
			
			if (invokeNow)
			{
				invoke();
			}
		}
		
		protected function initNetConnection():void
		{
			netConnection					= new NetConnection();
			netConnection.objectEncoding		= ObjectEncoding.AMF3;
			netConnection.connect( connection );
		}
		
		public function invoke():void
		{
			// Implemented in concrete service class
		}
	}
}