package scoreboard.model.vo
{
	[RemoteClass(alias="AMFResponse")]
	/**
	* AMFResponse is used to send a response to an AMF client that
	* has requested something from an AMF service.
	* 
	* @author Omar Gonzalez :: omar@almerblank.com
	*/
	public class AMFResponse
	{
		/**
		* Indicates whether the request to the AMF service was 
		* a success with a true or not with a false.
		*/
		public var success:Boolean;
		/**
		* A string message from the AMF service, usually when
		* $success is false, otherwise it will be empty.
		*/
		public var message:String;
		/**
		* Will contain any data objects that are expected as a 
		* result of the AMF service request.
		*/
		public var data:Object;
		/**
		* AMF class mapping variable, this value should equate
		* to the value of the AS3 class' [RemoteClassAlias(alias="AMFResponse")]
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
		public function AMFResponse()
		{
		}
	}
}