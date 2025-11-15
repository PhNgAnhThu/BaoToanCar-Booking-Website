<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SachController extends Controller
{
    // Hiển thị 8 cuốn sách giá rẻ nhất
    public function index()
    {
        $data = DB::select("SELECT * FROM sach ORDER BY gia_ban ASC LIMIT 10");
        return view("vidusach.index", compact("data"));
    }

    // Hiển thị sách theo thể loại
    public function theloai($id)
    {
        $data = DB::select("SELECT * FROM sach WHERE id_the_loai = ?", [$id]);
        return view("vidusach.index", compact("data"));
    }

    public function chitiet($id)
    {
        $sach = DB::table('sach')->where('id', $id)->first();
        return view("vidusach.chitiet", compact("sach"));
    }
    
}
