* TODO [2015-01-03 Sat] peri2doc: peri-doc: Support more pod2html options
* IDEA [2014-07-16 Wed] peri2doc: document Mo* classes [#D]

  perhaps put it inside attribute:
  
   has foo => (
       summary => ...,
   );
  
  untuk sementara patch agar kita bisa baca 'has'. atau bisa juga lewat:
  
   $SPEC{':attr:foo'} = { ... }
  

* TODO [2014-07-02 Wed] peri2doc: 2pod: di tiap fungsi, kasih keterangan fungsi ini diekspor atau tidak

  karena gak semua fungsi diekspor (contoh di Complete::Bash). kita harus lihat
  dari @EXPORT_OK, @EXPORT (kalau pakai Exporter). support juga utk exporter lain
  ke depannya.

* TODO [2014-06-02 Sen] peri2doc: pod: belum show valid values (`in` clause) seperti di --help --verbose
* TODO [2014-12-24 Wed] peri2doc: result: 'any' diubah jadi lihat of, mis: ['any' => of => ['str*', ['array*' => of=>'str'*]]] jadi 'str|array'
* TODO [2014-07-28 Sen] peri2doc: pod: generate =head1 SUBCOMMANDS section for pericmd script

  - to do this, we can install a temporary patch for Perinci::CmdLine,
  - when script runs $cmd->run(), instead of running, dump the object.

* TODO [2014-06-23 Mon] pericmd/peri2doc: tambah keterangan gimana cara mengaktifkan tab completion di generated script's POD
* TODO [2014-05-28 Wed] peri2doc: POD/text: gak usah generate section result jika tidak ada summary

  di POD, schema result sudah terlihat dari teks 'func(%args) -> int' misalnya.

* TODO [2014-05-17 Sab] peri2doc: wording saat menjelaskan func result

  jika tidak result_naked:
  

      enveloped (lalu jelaskan apa itu enveloped)
      actual result (3rd element)
  
  jika result_naked, langsung jelaskan resultnya.

* IDEA [2014-05-17 Sab] peri2doc: template di summary/description

  {{func}} (atau {{me}}?) direplace jadi function/program/script tergantung apakah
  dokumentasi adalah utk cmdline script atau fungsi (POD) {{arg:x_y}} diganti
  dengan `option --x-y` jika cmd, `x_y argument` for POD, dan link `x_y` untuk
  dokumentasi HTML/web.

* TODO [2014-04-11 Fri] peri2doc: refactor: common routines taruh di Perinci::To::Doc::Util

  - contoh rutin: utk mengubah schema jadi "int", atau "int (default: 0)", utk
  mengubah nama argumen ke getopt::long style, utk format (wrap + trim)
  description.
  
  - yang perlu dibuat:
    + (BELUM) generate POD utk cli no subcommand (utk diembed ke source)
    + (BELUM) generate POD utk cli with subcommands (utk diembed ke source)
    + generate POD utk module (utk diembed ke source)
    + generate text help utk Riap package (utk pelengkap aja sih)
    + generate text help utk Riap function (utk pelengkap aja sih)
    + generate cli usage utk Riap function (utk dipake di cmd --help)
      - (BELUM) opsi utk exclude showing some options or aliases (utk dipake di
        dux, di mana --in and --out gak usah ditampilkan).
    + generate cli usage utk Riap function (utk dipake di cmd --help --verbose)
    + (BELUM) generate HTML cantik utk api documentation (utk dipake di proyek gudangapi)
      + ada form utk nyoba
      + bisa dicollapse
    + (BELUM, IDEA) generate org documentation utk Riap function
      + ingin dapet collapsing ability-nya aja sih
    + (BELUM, IDEA) generate org documentation utk Riap package
      + ingin dapet collapsing ability-nya aja sih
    + (BELUM, IDEA) generate org documentation utk seluruh Riap tree/rekursif
      + ingin dapet collapsing ability-nya aja sih
  - rutin2x dan fitur2xnya:

* TODO [2014-04-11 Fri] peri2doc: bikin POD utk cli programs

  misalnya gw lagi malas bikin dan pengen diautomate aja, jika belum ada POD
  section OPTIONS diisi otomatis. utk single command dulu aja.
