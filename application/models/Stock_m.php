<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Stock_m extends CI_Model
{
    public function get_stock($id = null)
    {
        $this->db->select('*');
        $this->db->from('stokbarang');
        if ($id != null) {
            $this->db->where('stock_id', $id);
        }
        $query = $this->db->get();
        return $query;
    }

    public function get($id = null)
    {
        $this->db->select('stokbarang.*, barang.barcode, barang.gambar, barang.name as item_name');
        $this->db->from('stokbarang');
        $this->db->join('barang', 'barang.item_id=stokbarang.item_id');
        if ($id != null) {
            $this->db->where('stock_id', $id);
        }
        $query = $this->db->get();
        return $query;
    }

    public function get_stock_out()
    {
        $this->db->select('stokbarang.*,barang.barcode, barang.gambar, barang.name as item_name');
        $this->db->from('stokbarang');
        $this->db->join('barang', 'barang.item_id=stokbarang.item_id');
        $this->db->where('type', 'out', 'stokbarang.stock_id');
        $query = $this->db->get();
        return $query;
    }

    public function add_stock_in($post)
    {
        $data = [
            'item_id' => $post['item_id'],
            'type' => 'in',
            'detail' => $post['detail'],
            'qty' => $post['qty'],
            'date' => $post['date'],
            'user_id' => $this->session->userdata('userid')
        ];

        $this->db->insert('stokbarang', $data);
    }

    public function add_stock_out($post)
    {
        $data = [
            'item_id' => $post['item_id'],
            'type' => 'out',
            'detail' => $post['detail'],
            'qty' => $post['qty'],
            'date' => $post['date'],
            'user_id' => $this->session->userdata('userid')
        ];

        $this->db->insert('stokbarang', $data);
    }

    public function del($id)
    {
        $this->db->where('stock_id', $id);
        $this->db->delete('stokbarang');
    }
}
