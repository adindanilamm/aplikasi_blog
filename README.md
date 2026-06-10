# Sistem Manajemen Blog (CMS) + Halaman Pengunjung — aplikasi-blog

> Lengkapi bagian **[ISI ...]** di bawah sebelum dikumpulkan.

## Identitas
- **Nama Lengkap:** [ISI NAMA LENGKAP]
- **NIM:** [ISI NIM]

## Deskripsi Singkat
Aplikasi **Sistem Manajemen Blog (CMS)** berbasis **Laravel** dengan database `db_blog`.
Terdiri dari dua bagian:
1. **Halaman Administrator (CMS)** — login penulis, lalu mengelola (CRUD) artikel, penulis,
   dan kategori artikel. Dilindungi middleware `auth`.
2. **Halaman Pengunjung (publik, tanpa login):**
   - **Halaman utama** menampilkan lima artikel terbaru beserta widget kategori di samping.
     Pengunjung dapat menyaring artikel dengan mengklik kategori pada widget.
   - **Halaman detail artikel** menampilkan isi lengkap artikel beserta widget
     "Artikel Terkait" (lima artikel dari kategori yang sama).

Arsitektur MVC: Controller pengunjung (`BlogController`) terpisah dari Controller CMS,
seluruh route di `routes/web.php`, dan layout pengunjung (`layouts/publik`) terpisah
dari layout CMS (`layouts/app`). Route halaman pengunjung tidak dilindungi middleware `auth`.

## Teknologi
Laravel 10 · PHP 8.1+ · MySQL (`db_blog`) · Blade · Bootstrap 5 · CSS kustom.

## Cara Menjalankan Aplikasi Secara Lokal
1. **Siapkan server lokal** (Laragon/XAMPP), jalankan Apache & MySQL.
2. **Buat database** `db_blog`, lalu impor `database/db_blog.sql` (struktur + data)
   melalui phpMyAdmin/HeidiSQL.
3. **Clone repositori** ini ke folder web server, mis. `C:\laragon\www\aplikasi-blog`.
4. **Install dependensi:**
   ```bash
   composer install
   ```
5. **Siapkan file environment:**
   ```bash
   copy .env.example .env
   php artisan key:generate
   ```
   Lalu sesuaikan `.env`:
   ```
   APP_TIMEZONE=Asia/Jakarta
   DB_DATABASE=db_blog
   DB_USERNAME=root
   DB_PASSWORD=
   SESSION_DRIVER=file
   ```
6. **Buat symbolic link storage** (agar gambar tampil):
   ```bash
   php artisan storage:link
   ```
   Pastikan folder `storage/app/public/foto` dan `storage/app/public/gambar` berisi
   file gambar, serta ada `storage/app/public/foto/default.png`.
7. **Bersihkan cache & jalankan:**
   ```bash
   php artisan optimize:clear
   php artisan serve
   ```
8. **Akses di browser:**
   - **Halaman pengunjung (publik, tanpa login):** `http://localhost:8000/blog`
   - **Halaman admin / CMS (perlu login):** `http://localhost:8000/login`

   > Catatan: membuka `http://localhost:8000` juga otomatis diarahkan ke
   > halaman pengunjung. Halaman pengunjung dapat dibuka siapa saja tanpa login
   > (route-nya tidak memakai middleware `auth`).

## Akun Login (CMS)
- **Username:** `ninakusuma_`
- **Password:** `password123`

> Jika ingin mengganti password, gunakan `php artisan tinker`:
> ```php
> $p = App\Models\Penulis::where('user_name','ninakusuma_')->first();
> $p->password = bcrypt('passwordbaru');
> $p->save();
> ```

## Struktur Halaman & Route
| Halaman | URL | Akses |
|--------|-----|-------|
| Halaman utama pengunjung | `/blog` | Publik |
| Detail artikel | `/blog/{id}` | Publik |
| Filter per kategori | `/blog/kategori/{id}` | Publik |
| Login | `/login` | Publik |
| Dashboard | `/dashboard` | Login |
| Kelola Artikel | `/artikel` | Login |
| Kelola Penulis | `/penulis` | Login |
| Kelola Kategori | `/kategori` | Login |

## Video Demonstrasi
- **YouTube:** [ISI TAUTAN VIDEO YOUTUBE]

---
Dibuat untuk UAS Pemrograman Web — Semester Genap 2025/2026.
