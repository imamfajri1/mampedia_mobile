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
</details>