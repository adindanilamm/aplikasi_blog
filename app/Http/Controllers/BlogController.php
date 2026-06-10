<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Artikel;
use App\Models\KategoriArtikel;

class BlogController extends Controller
{
    // Jumlah artikel terbaru yang ditampilkan di halaman utama
    private const AWAL = 5;
    // Jumlah tambahan setiap klik "Tampilkan lebih banyak" (opsional)
    private const TAMBAH = 10;

    /**
     * Halaman utama pengunjung: lima artikel terbaru + widget kategori.
     */
    public function index(Request $request)
    {
        $tampil = (int) $request->query('tampil', self::AWAL);
        if ($tampil < self::AWAL) {
            $tampil = self::AWAL;
        }

        $artikel = Artikel::with('penulis', 'kategori')
            ->orderBy('id', 'desc')
            ->take($tampil)
            ->get();

        $total = Artikel::count();

        return view('blog.index', [
            'artikel'        => $artikel,
            'total'          => $total,
            'tampil'         => $tampil,
            'tambah'         => self::TAMBAH,
            'judulHalaman'   => 'Artikel Terbaru',
            'modeKategori'   => false,
            'kategoriWidget' => $this->widgetKategori(),
            'totalSemua'     => $total,
            'kategoriAktif'  => null,
        ]);
    }

    /**
     * Menyaring artikel berdasarkan kategori.
     */
    public function kategori(string $id)
    {
        $kategori = KategoriArtikel::findOrFail($id);

        $artikel = Artikel::with('penulis', 'kategori')
            ->where('id_kategori', $id)
            ->orderBy('id', 'desc')
            ->get();

        return view('blog.index', [
            'artikel'        => $artikel,
            'total'          => $artikel->count(),
            'tampil'         => $artikel->count(),
            'tambah'         => self::TAMBAH,
            'judulHalaman'   => 'Kategori: ' . $kategori->nama_kategori,
            'modeKategori'   => true,
            'kategoriWidget' => $this->widgetKategori(),
            'totalSemua'     => Artikel::count(),
            'kategoriAktif'  => (int) $id,
        ]);
    }

    /**
     * Halaman detail artikel + lima artikel terkait dari kategori yang sama.
     */
    public function show(string $id)
    {
        $artikel = Artikel::with('penulis', 'kategori')->findOrFail($id);

        $artikelTerkait = Artikel::where('id_kategori', $artikel->id_kategori)
            ->where('id', '!=', $artikel->id)
            ->orderBy('id', 'desc')
            ->take(5)
            ->get();

        return view('blog.show', compact('artikel', 'artikelTerkait'));
    }

    /**
     * Data widget kategori (nama + jumlah artikel).
     */
    private function widgetKategori()
    {
        return KategoriArtikel::withCount('artikel')
            ->orderBy('nama_kategori')
            ->get();
    }
}
