<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Cart_model extends CI_Model
{
	function test_main(){
		echo "Model function";
	}

	function insert_data($data){
		$this->db->insert("cart", $cart);
	}

	function fetch_data(){
		$query = $this->db->get("cart");
		return $query;
	}
}
	
?>