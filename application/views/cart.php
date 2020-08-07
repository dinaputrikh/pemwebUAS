<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Welcome to CodeIgniter</title>
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
	<style type="text/css">

	::selection { background-color: #E13300; color: white; }
	::-moz-selection { background-color: #E13300; color: white; }

	body {
		background-color: #fff;
		margin: 40px;
		font: 13px/20px normal Helvetica, Arial, sans-serif;
		color: #4F5155;
	}

	a {
		color: #003399;
		background-color: transparent;
		font-weight: normal;
	}

	h1 {
		color: #444;
		background-color: transparent;
		border-bottom: 1px solid #D0D0D0;
		font-size: 19px;
		font-weight: normal;
		margin: 0 0 14px 0;
		padding: 14px 15px 10px 15px;
	}

	code {
		font-family: Consolas, Monaco, Courier New, Courier, monospace;
		font-size: 12px;
		background-color: #f9f9f9;
		border: 1px solid #D0D0D0;
		color: #002166;
		display: block;
		margin: 14px 0 14px 0;
		padding: 12px 10px 12px 10px;
	}

	#body {
		margin: 0 15px 0 15px;
	}

	p.footer {
		text-align: right;
		font-size: 11px;
		border-top: 1px solid #D0D0D0;
		line-height: 32px;
		padding: 0 10px 0 10px;
		margin: 20px 0 0 0;
	}

	#container {
		margin: 10px;
		border: 1px solid #D0D0D0;
		box-shadow: 0 0 8px #D0D0D0;
	}
	</style>
</head>
<body>
	<div id="container">
		<h1>Tolong atur cart</h1>

		<div id="body">
			<p>The page you are looking at is being generated dynamically by CodeIgniter.</p>
		<form method="post" action="<?php echo base_url()?>Cart/form_validation">
		<table>
			<tr>
				<th>uid</th>
				<th>pid</th>
				<th>qty</th>
			</tr>
			
			<?php 
				if($fetch_data->num_rows() > 0){
				// }
			?>

			<tr v-for="item in list">
				<td>{{item.uid}}</td>
				<td>{{item.pid}}</td>
				<td>{{item.qty}}</td>
			</tr>

		</table>

		</form>
		<table>
			<tr>
				<th>uid</th>
				<th>pid</th>
				<th>qty</th>
			</tr>
			
			<?php 
				if($fetch_data->num_rows() > 0){
					foreach ($fetch_data->result() as $row) {
			?>
			<tr v-for="item in list">
				<td>{{item.uid}}</td>
				<td>{{item.pid}}</td>
				<td>{{item.qty}}</td>
			</tr>
			<?php
					}
				}
				else{
			?>
				<tr>
					<td colspan="3">No Data Found</td>
				</tr>
			<?php
				}
			?>

		</table>
		<button @click="add(200000)"> tambah 1 item 200000</button>
		<button @click="add(200001)"> tambah 1 item 200001</button>
		<button @click="add(200002)">  tambah 1 item 200002</button>
		<button @click="add(200003)"> tambah 1 item 200003</button>
		<br>
		<button @click="take(200000)"> kurangi 1 item 200000</button>
		<button @click="take(200001)"> kurangi 1 item 200001</button>
		<button @click="take(200002)"> kurangi 1 item 200002</button>
		<button @click="take(200003)"> kurangi 1 item 200003</button>

		<p> keterangan : tombol tambah akan ngelink ke application/controllers/Cart.php di method add_item</p>
		<p> keterangan : tombol kurangi akan ngelink ke application/controllers/Cart.php di method decrease_item<p>
		<p> VALUES sudah disediakan berupa $uid, $pid, $qty (sesuai dgn tabel db 'cart') di method CI diatas
		<p> create schema dulu bernama segar dan import segar.sql</p>
		<p> konfigurasi db connection ada di application/config/database.php
		<p class="footer">Page rendered in <strong>{elapsed_time}</strong> seconds. <?php echo  (ENVIRONMENT === 'development') ?  'CodeIgniter Version <strong>' . CI_VERSION . '</strong>' : '' ?></p>
	</div>

</body>

<script>
var vm = new Vue({
	el: '#container',
	data:{
		uid: '100000',
		list: 'null'
	},
	beforeMount :function(){
		this.reload()
	},
	methods:{
		reload: function(){
			axios({
			url: '<?echo base_url()?>'+'cart/get_all_cart_items',
			method: 'get',
			data: {
				uid: this.uid
			}
			})
			.then(response => {
				this.list=response.data
				console.log(this.list)
			})
		},
		add:function(id){
			axios({
			url: '<?echo base_url()?>'+'cart/add_item',
			method: 'get',
			params: {
				uid: '100000',
				pid: id,
				qty: 1
			}
			})
			.then(response => {
				this.reload();
			})

		},
		take:function(id){
			axios({
			url: '<?echo base_url()?>'+'cart/decrease_item',
			method: 'get',
			params: {
				uid: '100000',
				pid: id,
				qty: 1
			}
			})
			.then(response => {
				this.reload();
			})
		}
	}
})
</script>
</html>
