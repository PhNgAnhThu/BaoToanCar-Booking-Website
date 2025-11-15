<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;

use App\Models\Book;
use App\Models\Category;

class BookController extends Controller
{
    function laythongtintheloai()
    {
        $the_loai_sach = Category::all();
        return view("qlsach.the_loai",compact("the_loai_sach"));
    }
    function laythongtinsach()
    {
        $sach = Book::select("tieu_de","tac_gia")
                ->where("nha_xuat_ban","Văn Học")
                ->where("gia_ban",">=",50000)
                ->where("gia_ban","<=",90000)->get();
        return view("qlsach.thong_tin_sach",compact("sach"));
    }
    function nhapdulieu()
    {
        return view("qlsach.nhap_du_lieu");
    }
    function luudulieu(Request $request)
    {
        $ids=$request->input("id");
        $ten_the_loai=$request->input("ten_the_loai");
        /*$data = ["id"=>$id,"ten_the_loai"=>$ten_the_loai];
        DB::table("the_loai")->insert($data);
        return "Thêm thành công";*/
        // Thêm dữ liệu vào database
        for ($i = 0; $i < count($ids); $i++) {
        $the_loai = new Category();
        $the_loai->id = $ids[$i];
        $the_loai->ten_the_loai = $ten_the_loai[$i];
        $the_loai->save();}

        // Lấy danh sách thể loại sau khi thêm mới
        $the_loai_sach = Category::all();

        // Chuyển hướng đến trang danh sách thể loại
        return redirect('/qlsach/theloai');
    }
    public function booklist(){
        $data = DB::table("sach")->get();
        return view("vidusach.book_list",compact("data"));
        }
    
    public function bookcreate(){
        $the_loai = DB::table("the_loai")->get();
        $action = "add";
        return view("vidusach.book_form",compact("the_loai","action"));
        }

    public function booksave($action, Request $request)
    {
    $request->validate([
    'tieu_de' => ['required', 'string', 'max:200'],
    'nha_cung_cap' => ['required', 'string', 'max:50'],
    'nha_xuat_ban' => ['required', 'string', 'max:50'],
    'tac_gia' => ['required', 'string', 'max:50'],
    'hinh_thuc_bia' => ['required', 'string', 'max:50'],
    'gia_ban' => ['required', 'numeric'],
    'id_the_loai' => ['required', 'max:3'],
    'file_anh_bia' => ['nullable','image']
    ]);
    $data = $request->except("_token");

    if($action=="edit")
    $data = $request->except("_token", "id");

    if($request->hasFile("file_anh_bia"))
    {
    $fileName = $request->input("tieu_de") ."_".rand(1000000,9999999).'.' . $request->file('file_anh_bia')->extension();
    $request->file('file_anh_bia')->storeAs('public/book_image', $fileName);
    $data['file_anh_bia'] = $fileName;
    }
    $message = "";
    if($action=="add")
    {
    DB::table("sach")->insert($data);
    $message = "Thêm thành công";
    }

    else if($action=="edit")
    {
    $id = $request->id;
    DB::table("sach")->where("id",$id)->update($data);
    $message = "Cập nhật thành công";
    }

    return redirect()->route('booklist')->with('status', $message);
    }

    public function bookedit($id){
        $action = "edit";
        $the_loai = DB::table("the_loai")->get();
        $sach = DB::table("sach")->where("id",$id)->first();
        return view("vidusach.book_form",compact("the_loai","action","sach"));
        }

    public function bookdelete(Request $request)
    {
    $id = $request->id;
    DB::table("sach")->where("id",$id)->delete();
    return redirect()->route('booklist')->with('status', "Xóa thành công");
    }
}