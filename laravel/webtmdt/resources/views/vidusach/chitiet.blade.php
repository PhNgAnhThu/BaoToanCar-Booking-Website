<x-book-layout>

<x-slot name='title'>
    Chi tiết Sách
</x-slot>
    <h2 class="mt-3">{{ $sach->tieu_de }}</h2>
    <div class="row">
        <div class="col-md-4">
            <img src="{{ asset('book_image/'.$sach->file_anh_bia) }}" width="100%">
        </div>
        <div class="col-md-8">
            <p><b>Nhà cung cấp:</b> {{ $sach->nha_cung_cap }}</p>
            <p><b>Nhà xuất bản:</b> {{ $sach->nha_xuat_ban }}</p>
            <p><b>Tác giả:</b> {{ $sach->tac_gia }}</p>
            <p><b>Hình thức bìa:</b> {{ $sach->hinh_thuc_bia }}</p>
            <p><b>Giá bán:</b> <i>{{ number_format($sach->gia_ban, 0, ",", ".") }}đ</i></p>
        </div>
    </div>
    <hr>
    <h4>Mô tả:</h4>
    <p>{{ $sach->mo_ta }}</p>
</x-book-layout>
