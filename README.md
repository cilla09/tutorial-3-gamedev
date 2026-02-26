# Tutorial 3 Game Development
### Priscilla Natanael Surjanto/2306152153

Fitur yang saya implementasi:
- Crouch
- Dash
- Animated Sprite

Saya memulai mengimplementasi sprite karakter sehingga sesuai dengan pergerakan yang dilakukannya. Proses ini diawali dengan riset bagaimana cara implementasi ini, yang saya pelajari lewat Youtube (@godot_guru). Video mengajarkan penggunaan AnimatedSprite2D untuk membuat animasi sprite. Lewat video, saya juga mengetahui website free asset spritesheet (OpenGameArt.org) yang saya gunakan untuk spritesheet karakter saya. Dengan AnimatedSprite2D, saya membuat beberapa animasi dengan pilihan frames yang sudah dislice dari spritesheet.

Setelah itu, saya mulai mengetes animasi. Pertama, untuk walk, saya gunakan hanya satu animasi, namun untuk arah yang berbeda saya flip spritenya lewat script. Untuk script walk+idle+jump, saya menggunakan if conditional yang serupa (disesuaikan untuk masing-masing inputnya) untuk mengatur kecepatan karakter dan animasinya.

Dash yang sedikit tricky, karena kita harus keep track atas input button terakhir supaya tau suatu button di-double click. Jadi saya membuat variabel untuk keep track waktu itu dan memberi toleransi sebesar 0.3 detik antar pencetan. Saya juga membuat func start_dash() khusus untuk dash agar kode mudah direuse.

Di akhir, saya mengetes semuanya kembali sampai sudah sesuai. Sekian proses pengerjaan saya, terima kasih :D
