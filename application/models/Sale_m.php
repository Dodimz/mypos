<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Sale_m extends CI_Model
{
    public function invoice_no()
    {
        $sql = "SELECT MAX(MID(invoice,9,4)) AS invoice_no FROM penjualan WHERE MID(invoice,3,6) = DATE_FORMAT(CURRENT_DATE(), '%y%m%d')";
        $query = $this->db->query($sql);
        if ($query->num_rows() > 0) {
            $row = $query->row();
            $n = ((int)$row->invoice_no) + 1;
            $no = sprintf("%'.04d", $n);
        } else {
            $no = "0001";
        }
        $invoice = "MP" . date('ymd') . $no;
        return $invoice;
    }

    public function get_cart($params = null)
    {
        $this->db->select('*,barang.barcode, barang.name as item_name, keranjang.price as cart_price');
        $this->db->from('keranjang');
        $this->db->join('barang', 'keranjang.item_id=barang.item_id');
        if ($params != null) {
            $this->db->where($params);
        }
        $this->db->where('user_id', $this->session->userdata('userid'));
        $this->db->where('status_bayar', 'belum');
        $this->db->where('status_order', 'belum');
        $query = $this->db->get();
        return $query;
    }

    public function get_cart2($invoice = null)
    {
        $this->db->select('*,barang.barcode, barang.name as item_name, keranjang.price as cart_price');
        $this->db->from('keranjang');
        $this->db->join('barang', 'keranjang.item_id=barang.item_id');
        $this->db->where('user_id', $this->session->userdata('userid'));
        $this->db->where('status_bayar', 'belum');
        if ($invoice != null) {
            $this->db->where('invoice', $invoice);
        }
        $query = $this->db->get();
        return $query->result();
    }


    public function add_sale($post)
    {
        $data = [
            'invoice' => $this->invoice_no(),
            'customer_id' => $post['customer_id'] != null ? $post['customer_id'] : null,
            'total_price' => $post['sub_total'],
            'discount' => $post['discount'],
            'final_price' => $post['grand_total'],
            'cash' => $post['cash'],
            'uang_kembalian' => $post['change'],
            'note' => $post['note'],
            'date' => $post['date'],
            'user_id' => $this->session->userdata('userid')
        ];

        $this->db->insert('penjualan', $data);
        return $this->db->insert_id();
    }

    public function add_sale_detail($data)
    {
        $this->db->insert_batch('detail_penjualan', $data);
    }

    public function get($id = null)
    {
        $this->db->select('*,barang.barcode, barang.name as item_name, keranjang.price as cart_price, keranjang.item_id as cart_item');
        $this->db->from('keranjang');
        $this->db->join('barang', 'keranjang.item_id=barang.item_id');
        if ($id != null) {
            $this->db->where('cart_id', $id);
        }
        $this->db->where('user_id', $this->session->userdata('userid'));
        $query = $this->db->get();
        return $query;
    }

    public function add_cart($post)
    {
        $sql = "SELECT MAX(cart_id) AS cart_no FROM keranjang";
        $query = $this->db->query($sql);
        $status_bayar = "belum";
        $status_order = "belum";
        if ($query->num_rows() > 0) {
            $row = $query->row();
            $car_no = ((int)$row->cart_no) + 1;
        } else {
            $car_no = '1';
        }
        $params = [
            'cart_id' => $car_no,
            'item_id' => $post['item_id'],
            'price' => $post['price'],
            'discount_item' => 0,
            'qty' => $post['qty'],
            'invoice' => $this->invoice_no(),
            'total' => ($post['price'] * $post['qty']),
            'user_id' => $this->session->userdata('userid'),
            'status_bayar' => $status_bayar,
            'status_order' => $status_order,
            'id_table' => $post['table'],
        ];

        $this->db->insert('keranjang', $params);
    }

    public function update_cart($post)
    {
        $data = [
            'price' => $post['item_price'],
            'discount_item' => $post['item_discount'],
            'qty' => $post['item_qty'],
            'total' => (($post['item_price'] * $post['item_qty']) - $post['item_discount']),
            'user_id' => $this->session->userdata('userid')
        ];

        $this->db->where('cart_id', $post['cart_id']);
        $this->db->update('keranjang', $data);
    }

    public function update_cart_qty($post)
    {
        $sql = "UPDATE keranjang SET price = '$post[price]', qty = qty + '$post[qty]', total = '$post[price]' * qty WHERE item_id = '$post[item_id]'";
        $this->db->query($sql);
    }

    public function update_stat_order($rowx)
    {
        $sql = "UPDATE keranjang SET status_order = 'finish' WHERE invoice = '$rowx'";
        $this->db->query($sql);
    }

    public function del_cart($params = null)
    {
        if ($params != null) {
            $this->db->where($params);
        }
        $this->db->delete('keranjang');
    }

    public function reset_cart($params = null)
    {
        $invoice = $this->invoice_no();
        if ($params != null) {
            $this->db->where($params);
            $this->db->where('invoice', $invoice);
            
        }
        $this->db->delete('keranjang');
    }

    public function get_sale($id = null)
    {
        $this->db->select('*, customer.name as customer_name, user.name as user_name, penjualan.created as sale_created');
        $this->db->from('penjualan');
        $this->db->join('user', 'penjualan.user_id=user.user_id');
        $this->db->join('customer', 'penjualan.customer_id=customer.customer_id', 'left');
        if ($id != null) {
            $this->db->where('sale_id', $id);
        }
        $this->db->order_by('penjualan.created', 'desc');
        $query = $this->db->get();
        return $query;
    }

    public function get_sale_detail($sale_id = null)
    {
        $this->db->select('*, customer.name as customer_name, barang.name as item_name');
        $this->db->from('detail_penjualan');
        $this->db->join('barang', 'detail_penjualan.item_id=barang.item_id');
        $this->db->join('penjualan', 'detail_penjualan.sale_id=penjualan.sale_id');
        $this->db->join('customer', 'penjualan.customer_id=customer.customer_id', 'left');
        if ($sale_id != null) {
            $this->db->where('detail_penjualan.sale_id', $sale_id);
        }
        $query = $this->db->get();
        return $query;
    }

    public function sale_detail()
    {
        $this->db->select('*, SUM(qty) as qty');
        $this->db->from('detail_penjualan');
        $this->db->join('barang', 'detail_penjualan.item_id=barang.item_id');
        $this->db->group_by('detail_penjualan.item_id');
        $this->db->order_by('detail_penjualan.qty', 'desc');
        $query = $this->db->get();
        return $query;
    }
}
