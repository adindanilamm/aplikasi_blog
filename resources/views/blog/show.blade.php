@extends('layouts.publik')

@section('title', $artikel->judul)

@section('main')
<nav class="crumb fade-up">
    <a href="{{ route('blog.index') }}">Beranda</a> /
    <a href="{{ route('blog.kategori', $artikel->kategori->id) }}">{{ $artikel->kategori->nama_kategori }}</a> /
    <span>{{ \Illuminate\Support\Str::limit($artikel->judul, 40) }}</span>
</nav>

<article class="post-card fade-up d1">
    <img src="{{ asset('storage/gambar/' . $artikel->gambar) }}" alt="{{ $artikel->judul }}" class="article-hero">
    <div class="p-4 p-md-5">
        <a href="{{ route('blog.kategori', $artikel->kategori->id) }}" class="badge-soft text-decoration-none d-inline-block mb-3">
            {{ $artikel->kategori->nama_kategori }}
        </a>

        <h1 style="font-size:34px; font-weight:600; letter-spacing:-.02em; line-height:1.15; color:var(--ink);">
            {{ $artikel->judul }}
        </h1>

        <div class="d-flex align-items-center my-4 pb-3" style="border-bottom:1px solid var(--line);">
            <img src="{{ asset('storage/foto/' . $artikel->penulis->foto) }}"
                 onerror="this.src='{{ asset('storage/foto/default.png') }}'" alt="Penulis" class="post-avatar me-2">
            <div>
                <div class="post-author">{{ $artikel->penulis->nama_depan }} {{ $artikel->penulis->nama_belakang }}</div>
                <div class="post-meta">{{ $artikel->hari_tanggal }}</div>
            </div>
        </div>

        <div class="article-body">{!! nl2br(e($artikel->isi)) !!}</div>

        <div class="mt-4 pt-3" style="border-top:1px solid var(--line);">
            <a href="{{ route('blog.index') }}" class="btn btn-soft px-3">← Kembali ke Beranda</a>
        </div>
    </div>
</article>
@endsection

@section('sidebar')
<div class="side-card fade-up d1 p-4">
    <div class="side-card-title mb-3">Artikel Terkait</div>
    @forelse($artikelTerkait as $rel)
        <a href="{{ route('blog.show', $rel->id) }}" class="terkait-row">
            <img src="{{ asset('storage/gambar/' . $rel->gambar) }}" class="terkait-thumb" alt="{{ $rel->judul }}">
            <div>
                <div class="terkait-judul">{{ \Illuminate\Support\Str::limit($rel->judul, 50) }}</div>
                <div class="post-meta">{{ $rel->hari_tanggal }}</div>
            </div>
        </a>
    @empty
        <p class="post-meta mb-0">Belum ada artikel terkait dari kategori ini.</p>
    @endforelse
</div>
@endsection
