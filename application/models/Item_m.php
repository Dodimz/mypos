<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Item_m extends CI_Model
{

    public function get($id = null)
    {
        $this->db->select('barang.*, barang.stock,  category.name as name_category, table_unit.name as name_unit');
        $this->db->from('barang');
        $this->db->join('category', 'barang.category_id = category.category_id');
        $this->db->join('table_unit', 'barang.unit_id = table_unit.unit_id');
        if ($id != null) {
            $this->db->where('item_id', $id);
        }
        $this->db->order_by('barcode', 'ASC');
        $query = $this->db->get();
        return $query;
    }

    public function save($post)
    {
        $data = [
            'barcode' => $post['barcode'],
            'name' => $post['nama_produk'],
            'category_id' => $post['category'],
            'unit_id' => $post['unit'],
            'price' => $post['price'],
            'gambar' => $post['gambar']
        ];

        $this->db->insert('barang', $data);
    }

    public function update($post)
    {
        $data = [
            'barcode' => $post['barcode'],
            'name' => $post['nama_produk'],
            'category_id' => $post['category'],
            'unit_id' => $post['unit'],
            'price' => $post['price'],
            'gambar' => $post['gambar'],
            'updated' => date('Y-m-d H:i:s')
        ];

        $this->db->where('item_id', $this->input->post('item_id'));
        $this->db->update('barang', $data);
    }

    public function cek_data($barcode)
    {
        $this->db->select();
        $this->db->from('barang');
        $this->db->where('barcode', $barcode);
        $query = $this->db->get();
        return $query;
    }

    public function delete($id)
    {
        $this->db->where('item_id', $id);
        $this->db->delete('barang');
    }

    public function update_stock_in($data)
    {
        $qty = $data['qty'];
        $id = $data['item_id'];
        $sql = "UPDATE barang SET stock = stock + '$qty' WHERE item_id = '$id'";
        $this->db->query($sql);
    }

    public function update_stock_out($data)
    {
        $qty = $data['qty'];
        $id = $data['item_id'];
        $sql = "UPDATE barang SET stock = stock - '$qty' WHERE item_id = '$id'";
        $this->db->query($sql);
    }
}
