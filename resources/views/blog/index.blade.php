@extends('layouts.publik')

@section('title', $judulHalaman)

@section('main')
<div class="pub-hero fade-up">
    <div class="kicker">{{ $modeKategori ? 'Kategori' : 'Jurnal' }}</div>
    <h1>{{ $modeKategori ? \Illuminate\Support\Str::after($judulHalaman, 'Kategori: ') : 'Artikel Terbaru' }}</h1>
    <div class="rule"></div>
</div>

<div id="daftar" class="mt-4">
@forelse($artikel as $item)
    @php
        $isiBersih = strip_tags($item->isi);
        $separuh   = \Illuminate\Support\Str::limit($isiBersih, (int) ceil(mb_strlen($isiBersih) / 2));
    @endphp
    <article class="post-card fade-up mb-4">
        <img src="{{ asset('storage/gambar/' . $item->gambar) }}" alt="{{ $item->judul }}"
             style="width:100%; height:220px; object-fit:cover;">
        <div class="p-4">
            <span class="badge-soft mb-2 d-inline-block">{{ $item->kategori->nama_kategori }}</span>
            <a href="{{ route('blog.show', $item->id) }}" class="post-title d-block mb-2">{{ $item->judul }}</a>
            <div class="d-flex align-items-center mb-3">
                <img src="{{ asset('storage/foto/' . $item->penulis->foto) }}"
                     onerror="this.src='{{ asset('storage/foto/default.png') }}'" alt="Penulis" class="post-avatar me-2"
                     style="width:34px; height:34px;">
                <div class="post-meta">
                    {{ $item->penulis->nama_depan }} {{ $item->penulis->nama_belakang }} &middot; {{ $item->hari_tanggal }}
                </div>
            </div>
            <p class="post-excerpt mb-3">{{ $separuh }}</p>
            <a href="{{ route('blog.show', $item->id) }}" class="btn btn-emerald btn-sm px-3">Baca Selengkapnya →</a>
        </div>
    </article>
@empty
    <div class="post-card p-4 text-center" style="color:var(--muted); font-style:italic;">
        Belum ada artikel untuk ditampilkan.
    </div>
@endforelse
</div>

@if(!$modeKategori && $total > $tampil)
    <div class="text-center mt-4 fade-up">
        <a href="{{ route('blog.index', ['tampil' => $tampil + $tambah]) }}#daftar" class="btn btn-emerald btn-pill px-4 py-2">
            Tampilkan {{ min($tambah, $total - $tampil) }} artikel lagi
        </a>
    </div>
@endif
@endsection

@section('sidebar')
<div class="side-card fade-up d1 p-4">
    <div class="side-card-title mb-2">Kategori Artikel</div>
    <a href="{{ route('blog.index') }}" class="side-row {{ is_null($kategoriAktif) ? 'active' : '' }}">
        <span>Semua Artikel</span>
        <span class="side-count">{{ $totalSemua }}</span>
    </a>
    @foreach($kategoriWidget as $kat)
        <a href="{{ route('blog.kategori', $kat->id) }}" class="side-row {{ $kategoriAktif == $kat->id ? 'active' : '' }}">
            <span>{{ $kat->nama_kategori }}</span>
            <span class="side-count">{{ $kat->artikel_count }}</span>
        </a>
    @endforeach
</div>
@endsection
