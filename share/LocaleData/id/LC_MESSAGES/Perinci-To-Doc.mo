��          �      \      �     �  	   �     �       ?     	   O     Y  +   ^  &   �  k   �       �  *     �  p   �  D   M  0   �  �   �     Q     Y  Q  a     �     �  	   �     �  L   �     6     =  5   B  *   x  y   �     	  �  +	  (   �
  �     `   �  9   �  �   %     �     �                                                
                            	                       '*' denotes required arguments Arguments Description Examples For more information on transaction, see L<Rinci::Transaction>. Functions Name Pass -dry_run=>1 to enable simulation mode. Pass -reverse=>1 to reverse operation. Required if you pass -undo_action=>'undo'. For more details on undo protocol, see L<Rinci::function::Undo>. Return value Returns an enveloped result (an array).

First element (status) is an integer containing HTTP status code
(200 means OK, 4xx caller error, 5xx function error). Second element
(msg) is a string containing error message, or 'OK' if status is
200. Third element (result) is optional, the actual result. Fourth
element (meta) is called result metadata and is optional, a hash
that contains extra information. This function dies on error. This function is idempotent (repeated invocations with same arguments has the same effect as single invocation). This function is immutable (returns same result for same arguments). This function is pure (produce no side effects). To undo, pass -undo_action=>'undo' to function. You will also need to pass -undo_data. For more details on undo protocol, see L<Rinci::Undo>. Version default Project-Id-Version: Perinci-Sub-To-Text 0.30
Report-Msgid-Bugs-To: stevenharyanto@gmail.com
POT-Creation-Date: 2013-12-12 16:35+0700
PO-Revision-Date: 2013-12-12 12:31+0700
Last-Translator: Automatically generated
Language-Team: none
Language: id
MIME-Version: 1.0
Content-Type: text/plain; charset=ASCII
Content-Transfer-Encoding: 8bit
 '*' menandakan argumen wajib Argumen Deskripsi Contoh Untuk informasi lebih lanjut tentang transaksi, lihat L<Rinci::Transaction>. Fungsi Nama Berikan -dry_run=>1 untuk menghidupkan mode simulasi. Berikan -reverse=>1 untuk operasi reverse. Diperlukan jika Anda memberikan -undo_action=>'undo'. Untuk detail tentang protokol undo, lihat L<Rinci::function::Undo>. Nilai kembali Mengembalikan hasil terbungkus (larik).

Elemen pertama (status) adalah bilangan bulat berisi kode status HTTP
(200 berarti OK, 4xx kesalahan di pemanggil, 5xx kesalahan di fungsi). Elemen kedua
(msg) adalah string berisi pesan kesalahan, atau 'OK' jika status
200. Elemen ketiga (result) bersifat opsional, berisi hasil yang diinginkan. Elemen keempat
(meta) disebut metadata hasil, bersifat opsional, berupa hash
informasi tambahan. Fungsi ini die() jika menemui kesalahan. Fungsi ini bersifat idempoten (idempotent, pemanggilan berulang kali dengan argumen yang sama efeknya seperti pemanggilan sekali). Fungsi ini bersifat imutabel (immutable, mengembalikan hasil yang sama untuk argumen yang sama). Fungsi ini murni (pure, tidak menghasilkan efek samping). Untuk undo, berikan -undo_action=>'undo' pada fungsi. Anda juga perlu memberikan -undo_data. Untuk detil tentang protokol undo, lihat L<Rinci::Undo>. Versi bawaan 