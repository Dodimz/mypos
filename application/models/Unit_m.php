<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Unit_m extends CI_Model
{

    public function get($id = null)
    {
        $this->db->select();
        $this->db->from('table_unit');
        if ($id != null) {
            $this->db->where('unit_id', $id);
        }
        $query = $this->db->get();
        return $query;
    }

    public function save($post)
    {
        $data['name'] = $this->input->post('name');

        $this->db->insert('table_unit', $data);
    }

    public function update($post)
    {
        $data = [
            'name' => $this->input->post('name'),
            'updated' => date('Y-m-d H:i:s')
        ];

        $this->db->where('unit_id', $this->input->post('unit_id'));
        $this->db->update('table_unit', $data);
    }

    public function cek_data($name)
    {
        $this->db->select();
        $this->db->from('table_unit');
        $this->db->where('name', $name);
        $query = $this->db->get();
        return $query;
    }

    public function delete($id)
    {
        $this->db->where('unit_id', $id);
        $this->db->delete('table_unit');
    }
}
