<?php
class DBConnection1
{
	function __construct()
	{
		$conn=mysqli_connect("localhost","root","","issue_tracker");
		if(!$conn)
		{
			echo "Connection is not Successfully";
		}
	}
// 	function __destruct(){
// 		$this->close();
//    }
}
?>
