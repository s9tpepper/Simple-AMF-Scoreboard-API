<?php
/**
* AMFResponse is used to send a response to an AMF client that
* has requested something from an AMF service.
* 
* @author Omar Gonzalez :: omar@almerblank.com
*/
class AMFResponse
{
	/**
	* Indicates whether the request to the AMF service was 
	* a success with a true or not with a false.
	*/
	var $success;
	/**
	* Will contain any data objects that are expected as a 
	* result of the AMF service request.
	*/
	var $data;
	/**
	* A string message from the AMF service, usually when
	* $success is false, otherwise it will be empty.
	*/
	var $message;
	/**
	* AMF class mapping variable, this value should equate
	* to the value of the AS3 class' [RemoteClassAlias(alias="AMFResponse")]
	* meta data in the AS3 class this PHP class should map to.
	*/
	var $_explicitType = "AMFResponse";
	
	/**
	* @Constructor
	*/
	public function __construct()
	{
	}
}