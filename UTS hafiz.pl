% --- Aturan sederhana berdasarkan gejala ---

hama(nematoda_akar) :- tanaman_layu.
hama(ulat_grayak) :- daun_berlubang.
hama(jamur_cercospora) :- bercak_hitam.
hama(aphids) :- daun_menguning.

% --- Mapping nama hama ke deskripsi manusia ---
deskripsi(nematoda_akar, 'Nematoda Akar').
deskripsi(ulat_grayak, 'Ulat Grayak').
deskripsi(jamur_cercospora, 'Jamur Cercospora').
deskripsi(aphids, 'Aphids (Kutu Daun)').

% --- Memasukkan gejala berdasarkan input user ---

mulai :-
    write('Apakah daun menguning? (ya/tidak): '),
    read(Jawaban1),
    (Jawaban1 == ya -> assert(daun_menguning) ; true),

    write('Apakah terdapat bercak hitam? (ya/tidak): '),
    read(Jawaban2),
    (Jawaban2 == ya -> assert(bercak_hitam) ; true),

    write('Apakah daun berlubang? (ya/tidak): '),
    read(Jawaban3),
    (Jawaban3 == ya -> assert(daun_berlubang) ; true),

    write('Apakah tanaman layu? (ya/tidak): '),
    read(Jawaban4),
    (Jawaban4 == ya -> assert(tanaman_layu) ; true),

    cari_hama,
    bersih.

% --- Mencari dan menampilkan hasil hama ---

cari_hama :-
    ( hama(Hama),
      deskripsi(Hama, NamaHama)
    -> format('Jenis hama terdeteksi: ~w~n', [NamaHama])
    ;  write('Tidak ada hama yang cocok dengan gejala tersebut.'), nl
    ).

% --- Bersihkan semua fakta gejala ---

bersih :-
    retractall(daun_menguning),
    retractall(bercak_hitam),
    retractall(daun_berlubang),
    retractall(tanaman_layu).
