<?php defined('BASEPATH') OR exit('No direct script access allowed');

class ClassName extends CI_Model
{
	
	function __construct()
	{
		parent::__construct();
	}

	function findAll(){
		return $this->db->get('product')->result();
	}

	function find($id){
		$this->db->where('pid', $id);
		return $this->db->get('product')->row();
	}
}

?>