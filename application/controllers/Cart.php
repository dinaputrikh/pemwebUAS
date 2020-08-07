<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cart extends CI_Controller {

	public function __construct(){
		$this->load->model("Cart_model");
		$this->load->library('form_validation');
	}

	public function index()
	{
		$this->load->model("Cart_model");
		$data["fetch_data"] = $this->Cart_model->fetch_data();
		$this->load->view("cart", $data);
	}

	public function form_validation(){
		$this->load->library('form_validation');
		$this->form_validation->set_rules("uid", "User Id", 'required|alpha');
		$this->form_validation->set_rules("pid", "Product Id", 'required|alpha');

		if ($this->form_validation->run) {
			//true
			$this->load->model("Cart_model");
			$data = array(
				"uid" =>this->post("uid"),
				"pid" =>this->post("pid"),
				"uid" =>this->post("uid"), 
		);
		}
		else {
			//false
			$this->index();
		}
	}

	public function add_item(){
		$cart = $this->Cart_model;
		$validation = $this->form_validation;
		$validation->set_rules($cart->rules);

		if ($validation->run()){
			$product->save();
			$this->session->set_flashdata('success', 'Berhasil di input');
		}

		$this->load->view("cart");

		// $data=$this->input->get();
		// $uid=$data['uid'];
		// $pid=$data['pid'];
		// $qty=$data['qty'];
		// $this->db->query("INSERT INTO cart values('$uid','$pid','$qty')");
	}

	public function edit_item($id = null){
		if (!isset($uid)) redirect(cart);

		$cart = $this->Cart_model;
		$validation = $this->form_validation;
		$validation->set_rules($cart->rules());

		if ($validation->run()){
			$product->save();
			$this->session->set_flashdata('success', 'Berhasil di input');
		}
	}
	
	public function decrease_item($uid=null){
		// $array=$this->input->get();
		// $uid=$data['uid'];
		// $pid=$data['pid'];
		// $qty=$data['qty'];

		if (!isset($uid)) show_404(); 
		
		if ($this->Cart_model->delete()) {
			redirect(site_url('cart'));
		}
	}

	public function update_data(){
		$userid = $this->uri->segment(3);
		$this->load->model("Cart_model");
		$data["cart"] = $this->Cart_model->fetch_single_data($userid);
		$data[""]
	}
}
