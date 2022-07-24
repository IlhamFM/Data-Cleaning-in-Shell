## Data Cleansing in Shell

- Tujuan Pengerjaan Project
  Script ini diperuntukkan untuk mempersiapkan (membersihkan dan menghapus data-data yang tidak relevan)
  data agar dapat dilakukan analisa produk penjualan. Dataset diperoleh dari tautan dibawah
  Sumber dataset : https://drive.google.com/file/d/1rKkUQU-sXIDka3rVNBahp6q3wDhrPY-1/view
  
- Deskripsi Fungsi
  * csvstack 2019-Nov-sample.csv 2019-Oct-sample.csv > 2019-Oct-Nov-1.csv
    Perintah ini berfungsi untuk menggabungkan 2 file dataset ke dalam 1 file yang bernama 2019-Oct-Nov-1.csv
  * csvgrep -c "event_type" -m "purchase" 2019-Oct-Nov-1.csv > 2019-Oct-Nov-2.csv
    File yang telah digabungkan tadi kemudian difilter hanya untuk data penjualan saja dan disimpan dalam
    2019-Oct-Nov-1.csv
  * csvcut -c 2,3,4,5,7,8 2019-Oct-Nov-2.csv > 2019-Oct-Nov-3.csv
    Memfilter tabel hanya untuk kolom event_tim, event_type, product_id, category_id, brand dan price dan disimpan  
    dalam file 2019-Oct-Nov-3.csv
  * csvcut -c "category_code" 2019-Oct-Nov-2.csv | awk -F "." '{print $1}' > kategori-1.csv
    Memfilter kolom category_code dan meng-split data dengan koma, bagian-1 dari hasil filter tersebut yang merupakan
    kategori produk disimpan dalam fila kategori-1.csv
  * csvcut -c "category_code" 2019-Oct-Nov-2.csv | awk -F "." '{print $NF}' > kategori-2.csv
    Memfilter kolom category_code dan meng-split data dengan koma, bagian terakhir dari hasil filter tersebut yang
    merupakan jenis produk disimpan dalam fila kategori-2.csv 
  * csvjoin 2019-Oct-Nov-3.csv kategori-1.csv kategori-2.csv > 2019-Oct-Nov-Final.csv
    Menggabungkan kolom kategori-1 dan kategori-2 dengan file 2019-Oct-Nov-3.csv kedalam file 2019-Oct-Nov-Final.csv
  * csvlook 2019-Oct-Nov-Final.csv | head -20
    Menampilkan 20 baris pertama dari data hasil olahan tadi

- Cara menjalankan program
  pada lokasi atau folder tempat file bash berada eksekusi sintaks berikut
  ./data_cleansing.sh

- Saran perbaikan
  Nama pada 2 kolom terakhir belum sesuai dengan eskpektasi program, dimana seharusnya tertulis dengan nama category
  dan product_name tetapi masih tertulis dengan category_code dan category_code2
