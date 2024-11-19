# Pemograman Berbasis Platform C
## MamPedia Mobile
### Sebuah proyek Flutter sederhana Tugas Mata Kuliah Pemrograman Berbasis Platform oleh **Imam Fajri 2306165566**.
---
# Penjelasan Tutorial dan menjawab semua jawaban

<details>
<summary>Click for more detail</summary>
<br>

# Tugas 7 Elemen Dasar Flutter

<details>
<summary>Click for more detail</summary>
<br>

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
- Stateless widget merupakan suatu widget yang dimuat secara statis dimana seluruh konfigurasi yang dimuat didalamnya telah diinisiasikan sejak awal widget tersebut dimuat.

- Stateful Widget adalah widget yang mempunyai sifat dinamis. Widget dapat berubah dengan adanya interaksi user maupun variabel dan nilai yang ditemukan.

Perbedaan dari keduanya adalah setelah proses dari Constructor menuju Build. Constructor adalah tahapan awal yang fungsinya untuk membuat setiap state dengan keadaan yang ingin diterapkan, kemudian Build yang merupakan tahap dimana semua widget dan state dibangun ke UI (User Interface).
Pada stateful widget sebelum masuk ke tahapan Build ada namanya Internal State, tahapan ini merupakan tahap untuk proses penambahan state atau perubahan data. Ketika Internal State disebabkan oleh UI, maka sistem akan melakukan re-render tampilan dari widget awal.

## Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

- `MaterialApp` (melakukan konfigurasi tema yang digunakan dalam aplikasi dan ini menjadi tampilan dasar dalam aplikasi)

- `Scaffold` (Membuat struktur dasar halaman dengan AppBar di atas dan body di tengah)

- `AppBar` (Header aplikasi yang menampilkan judul ("MamPedia"))

- `Padding` (Memberikan jarak di sekitar body halaman untuk tampilan yang lebih rapi)

- `Column` (Menyusun widget di dalamnya secara vertikal)

- `Row` (Menyusun widget di dalamnya secara horizontal, digunakan di dalam Column untuk menampilkan InfoCard dalam baris)

- `InfoCard` (Widget custom yang menampilkan informasi dasar (NPM, Nama, Kelas) menggunakan Card untuk tampilannya)

- `SizedBox` (Digunakan untuk memberikan jarak vertikal antara widget di dalam Column)

- `GridView.count` (Menampilkan daftar item (ItemCard) dalam bentuk grid dengan tiga kolom)

- `ItemCard` (Widget custom yang menampilkan ikon dan teks sesuai dengan item, seperti "Tambah Product" atau "Logout". Memiliki efek interaktif menggunakan InkWell yang menampilkan SnackBar saat diklik)

- `Material` (Digunakan di dalam ItemCard untuk efek bayangan dan warna latar belakang pada InkWell)

- `SnackBar` (Ditampilkan ketika InkWell dalam ItemCard diklik, memberikan pesan singkat)

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() berfungsi untuk memberi intruksi kepada flutter bahwa ada terjadinya perubahan pada state kemudian tampilan perlu diperbarui. Variabel yang berdampak dari fungsi tersebut adalah `itemHomepage item` akan berdalam karena jika user menekan salah tiga dari tombol tersebut kemudian flutter akan memperbarui tampilan dan memunculkan SnackBar dan akan memperbarui tampilannya seperti tampilan awal.

## Jelaskan perbedaan antara const dengan final

| No. | Perbedaan                      | `const`                                                                                             | `final`                                                                                                                   |
| --- | -------------------------- | -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| 1   | Waktu Inisialisasi            | Variabel const harus diinisialisasi dengan nilai literal atau nilai yang dihitung saat waktu kompilasi, tidak bisa diinisialisasi dengan nilai yang diperoleh saat runtime.                                     | Variabel final dapat diinisialisasi saat runtime, yang berarti nilai mereka dapat ditentukan oleh hasil dari operasi atau fungsi yang berjalan saat kode dieksekusi.                                                                                      |
| 2   | Memory Allocation     | Jika dua variabel const memiliki nilai yang sama, mereka akan diwakili oleh satu objek di memori (de-duplication).                                                    | Setiap instance variabel final di dalam memori bisa berbeda, dan tidak harus sama walaupun nilainya sama.                                                                                 |
| 3   | Mutability                      | Variabel const harus berisi nilai yang sepenuhnya immutable, termasuk semua anak objeknya (deeply immutable).   | Variabel final bisa berisi koleksi (seperti List, Map, Set) yang isinya bisa berubah, tetapi variabel itu sendiri tidak bisa di-assign dengan objek baru.                                                                     |
| 4   | Class Fields                      | Pengguna dapat menemukan tempat makan halal terdekat dari lokasi pengguna.                                     | Admin dapat menambahkan, mengelola, dan menghapus data lokasi tempat makan halal.                                                    |
| 5   | Food                       | Pengguna dapat menyaring makanan berdasarkan budget                                                            | Admin dapat menambahkan, mengelola, dan menghapus harga   

## Penjelasan implementasi Tugas 7
1. Membuat projek flutter bernama `MamPedia_mobile`
2. Menghapus semua isi dari `class MyHomePage ...`
3. Mengganti warna tema aplikasi menjadi:
```dart
colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.lightGreen,
        )
```
4. Membuat file baru bernama `menu.dart` didalam direktori `lib`
5. Membuat tombol Lihat Daftar Produk, Tambah Produk, dan Logout
```dart
class ItemHomepage {
  final String name;
  final IconData icon;
  ItemHomepage(this.name, this.icon);
}

class MyHomePage extends StatelessWidget {
  final String npm = '23061655'; // NPM
  final String name = 'Imam Fajri'; // Nama
  final String className = 'PBP C'; // Kelas
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.shopping_basket),
    ItemHomepage("Tambah Product", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar adalah bagian atas halaman yang menampilkan judul.
      appBar: AppBar(
        // Judul aplikasi "MamPedia" dengan teks putih dan tebal.
        title: const Text(
          'MamPedia',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // Body halaman dengan padding di sekelilingnya.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Menyusun widget secara vertikal dalam sebuah kolom.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row untuk menampilkan 3 InfoCard secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),

            // Memberikan jarak vertikal 16 unit.
            const SizedBox(height: 16.0),

            // Menempatkan widget berikutnya di tengah halaman.
            Center(
              child: Column(
                // Menyusun teks dan grid item secara vertikal.

                children: [
                  // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Mampedia',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // Agar grid menyesuaikan tinggi kontennya.
                    shrinkWrap: true,

                    // Menampilkan ItemCard untuk setiap item dalam list items.
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
6. Memunculkan snackbar dengan tulisan
```dart
child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text("Kamu telah menekan tombol ${item.name}!"),
            ));
        },
```
</details>

# Tugas 8 Flutter Navigation, Layouts, Forms, and Input Elements

<details>
<summary>Click for more detail</summary>
<br>

## Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
Kata kunci const digunakan ketika nilai variabel diketahui pada saat kompilasi dan tidak pernah berubah. Dengan kata lain, kompilator sudah mengetahui sebelumnya nilai apa yang akan disimpan dalam variabel tersebut.
...
`
## Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

### Column
`Column` adalah widget yang menyusun anak-anaknya secara vertikal dari atas ke bawah. Ini berguna ketika Anda ingin menempatkan beberapa widget dalam satu kolom.

Contoh implementasi `Column`:
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(
      item.icon,
      color: Colors.white,
      size: 30.0,
    ),
    const Padding(padding: EdgeInsets.all(3)),
    Text(
      item.name,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white),
    ),
  ],
),
```

### Row
`Row` adalah widget yang menyusun anak-anaknya secara horizontal dari kiri ke kanan. Ini berguna ketika Anda ingin menempatkan beberapa widget dalam satu baris.

Contoh implementasi `Row`:
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    InfoCard(title: 'NPM', content: npm),
    InfoCard(title: 'Name', content: name),
    InfoCard(title: 'Class', content: className),
  ],
),
```

### Perbandingan
- `Column` menyusun widget secara vertikal, sedangkan `Row` menyusun widget secara horizontal.
- `Column` cocok digunakan untuk tata letak yang memerlukan penumpukan widget dari atas ke bawah, sementara `Row` cocok untuk tata letak yang memerlukan penempatan widget dari kiri ke kanan.
- Keduanya memiliki properti seperti `mainAxisAlignment` dan `crossAxisAlignment` untuk mengatur penyelarasan widget di sepanjang sumbu utama dan sumbu silang.

Dengan memahami perbedaan dan penggunaan `Column` dan `Row`, Anda dapat membuat tata letak yang lebih fleksibel dan responsif dalam aplikasi Flutter Anda.

...
## Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

Pada halaman form yang saya buat, saya menggunakan beberapa elemen input berikut:
- `TextFormField`: Digunakan untuk menerima input teks dari pengguna.


Elemen input Flutter lain yang tidak saya gunakan pada tugas ini antara lain:
- `Slider`: Digunakan untuk menerima input dalam bentuk nilai geser.
- `DatePicker`: Digunakan untuk menerima input tanggal dari pengguna.
- `TimePicker`: Digunakan untuk menerima input waktu dari pengguna.
- `RangeSlider`: Digunakan untuk menerima input dalam bentuk rentang nilai geser.
- `Stepper`: Digunakan untuk menerima input dalam bentuk langkah-langkah bertahap.
- `Switch`: Digunakan untuk menerima input boolean dalam bentuk switch.
- `DropdownButtonFormField`: Digunakan untuk menampilkan daftar pilihan dalam bentuk dropdown.
- `Checkbox`: Digunakan untuk menerima input boolean dari pengguna.

Setiap elemen input memiliki kegunaan dan konteks penggunaan yang berbeda-beda, tergantung pada kebutuhan aplikasi yang sedang dikembangkan.

...

## Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Untuk mengatur tema dalam aplikasi Flutter agar konsisten, saya menggunakan `ThemeData` yang disediakan oleh Flutter. `ThemeData` memungkinkan kita untuk mendefinisikan warna, font, dan gaya visual lainnya yang akan digunakan di seluruh aplikasi. Berikut adalah langkah-langkah yang saya lakukan:

1. **Mendefinisikan Tema Utama**:
  Saya mendefinisikan tema utama aplikasi di dalam `MaterialApp` dengan menggunakan properti `theme`. Contohnya:
  ```dart
  MaterialApp(
    theme: ThemeData(
     primarySwatch: Colors.lightGreen,
     ...
    ),
    home: MyHomePage(),
  );
  ```

2. **Menggunakan Warna dan Gaya yang Konsisten**:
  Saya memastikan untuk menggunakan warna dan gaya yang telah didefinisikan dalam `ThemeData` di seluruh widget aplikasi. Misalnya, menggunakan `Theme.of(context).colorScheme.primary` untuk mengambil warna utama yang telah didefinisikan.

3. **Mengimplementasikan Tema**:
  Ya, saya mengimplementasikan tema pada aplikasi yang saya buat. Contohnya, saya mengganti warna tema aplikasi menjadi warna hijau muda dengan menggunakan `ColorScheme.fromSwatch`:
  ```dart
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.lightGreen,
  )
  ```

Dengan mengatur tema secara konsisten, aplikasi akan memiliki tampilan yang seragam dan profesional, serta memudahkan dalam melakukan perubahan gaya visual di masa depan.


## Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Menggunakan **Navigator** dan **MaterialPageRoute** untuk mengatur perpindahan antar halaman dengan mudah. Dengan **Navigator**, saya dapat menambahkan atau menghapus halaman dari daftar, sehingga memudahkan navigasi. Untuk membuka halaman baru, saya menggunakan **Navigator.push** bersama **MaterialPageRoute**, yang menampilkan halaman dengan animasi bawaan, dan untuk kembali ke halaman sebelumnya, saya menggunakan **Navigator.pop**. Selain itu, saya memakai **Navigator.pushReplacement** untuk mengganti halaman saat ini dengan halaman baru, seperti saat berpindah dari halaman utama ke halaman tambah produk melalui menu drawer.


</details>


# Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter
<details>
<summary>Click for more detail</summary>
<br>

## CheckList
 1. Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
    - Membuat form registrasi yang mengirim data ke server Django untuk membuat akun baru.
 2. Membuat halaman login pada proyek tugas Flutter.
    - Membuat form login yang mengirim data ke server Django untuk autentikasi pengguna.
 3. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
    - Menggunakan cookie untuk mengelola sesi pengguna dan memastikan pengguna tetap login.
 4. Membuat model kustom sesuai dengan proyek aplikasi Django.
    - Membuat model data di Django yang sesuai dengan kebutuhan aplikasi Flutter.
 5. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
    - Mengambil data item dari endpoint JSON dan menampilkannya dalam daftar di Flutter.
    - Tampilkan name, price, dan description dari masing-masing item pada halaman ini.
 6. Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
    - Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
    - Tampilkan seluruh atribut pada model item kamu pada halaman ini.
    - Tambahkan tombol untuk kembali ke halaman daftar item.
 7. Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
    - Menampilkan hanya item yang dimiliki oleh pengguna yang sedang login.

 ## Pertanyaan
 ### Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Membuat model untuk pengambilan atau pengiriman data JSON penting untuk memastikan struktur data yang konsisten dan validasi data. Tanpa model, data yang diterima atau dikirim mungkin tidak sesuai dengan yang diharapkan, yang dapat menyebabkan error atau data yang tidak valid.

### Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library `http` digunakan untuk melakukan permintaan HTTP ke server Django. Ini memungkinkan aplikasi Flutter untuk berkomunikasi dengan backend, seperti mengambil data, mengirim data, dan melakukan autentikasi.

### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` digunakan untuk mengelola sesi dan autentikasi pengguna dengan menyimpan cookie yang diterima dari server Django. Instance `CookieRequest` perlu dibagikan ke semua komponen agar sesi pengguna tetap konsisten di seluruh aplikasi.

### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
1. Pengguna memasukkan data ke dalam form di aplikasi Flutter.
2. Data dikirim ke server Django menggunakan `CookieRequest`.
3. Server Django memproses data dan mengembalikan respons.
4. Aplikasi Flutter menerima respons dan menampilkan data yang relevan kepada pengguna.

### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
1. **Register:**
   - Pengguna memasukkan data registrasi di Flutter.
   - Data dikirim ke Django untuk pembuatan akun.
   - Django mengembalikan respons sukses atau gagal.
   - Flutter menampilkan pesan sesuai respons.

2. **Login:**
   - Pengguna memasukkan data login di Flutter.
   - Data dikirim ke Django untuk autentikasi.
   - Django mengembalikan cookie sesi jika berhasil.
   - Flutter menyimpan cookie dan menavigasi ke halaman utama.

3. **Logout:**
   - Pengguna menekan tombol logout di Flutter.
   - Flutter mengirim permintaan logout ke Django.
   - Django menghapus sesi dan mengembalikan respons.
   - Flutter menghapus cookie dan menavigasi ke halaman login.

</details>
</details>