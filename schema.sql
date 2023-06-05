-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-06-05 06:12:37.795

-- tables
-- Table: Album
CREATE TABLE Album (
                       id int  NOT NULL,
                       nama varchar(100)  NOT NULL,
                       Penyanyi_id int  NOT NULL,
                       CONSTRAINT Album_pk PRIMARY KEY (id,Penyanyi_id)
);

-- Table: Lagu
CREATE TABLE Lagu (
                      id int  NOT NULL,
                      nama varchar(100)  NOT NULL,
                      composer varchar(100)  NOT NULL,
                      durasi int  NOT NULL,
                      harga int  NOT NULL,
                      Tipe_media_id int  NOT NULL,
                      Album_id int  NOT NULL,
                      Album_Penyanyi_id int  NOT NULL,
                      CONSTRAINT Lagu_pk PRIMARY KEY (id)
);

-- Table: Lagu_Playlist
CREATE TABLE Lagu_Playlist (
                               Lagu_id int  NOT NULL,
                               Playlist_id int  NOT NULL,
                               CONSTRAINT Lagu_Playlist_pk PRIMARY KEY (Lagu_id,Playlist_id)
);

-- Table: Pegawai
CREATE TABLE Pegawai (
                         id int  NOT NULL,
                         Nama_Depan varchar(100)  NOT NULL,
                         Nama_Belakang varchar(100)  NOT NULL,
                         Jabatan varchar(100)  NOT NULL,
                         Alamat varchar(100)  NOT NULL,
                         Kota varchar(50)  NOT NULL,
                         Provinsi varchar(50)  NOT NULL,
                         Negara varchar(50)  NOT NULL,
                         Kode_Pos varchar(10)  NOT NULL,
                         Nomor_Telepon varchar(20)  NOT NULL,
                         Fax varchar(100)  NOT NULL,
                         Email varchar(100)  NOT NULL,
                         Tanggal_Lahir date  NOT NULL,
                         Mulai_Bekerja date  NOT NULL,
                         atasan int  NULL,
                         CONSTRAINT Pegawai_pk PRIMARY KEY (id)
);

-- Table: Pelanggan
CREATE TABLE Pelanggan (
                           id int  NOT NULL,
                           Nama_Depan varchar(100)  NOT NULL,
                           Nama_Belakang varchar(100)  NOT NULL,
                           Perusahaan varchar(100)  NOT NULL,
                           Alamat varchar(100)  NOT NULL,
                           Kota varchar(50)  NOT NULL,
                           Provinsi varchar(50)  NOT NULL,
                           Negara varchar(50)  NOT NULL,
                           Kode_Pos varchar(10)  NOT NULL,
                           Nomor_Telepon varchar(20)  NOT NULL,
                           Fax varchar(100)  NOT NULL,
                           Email varchar(100)  NOT NULL,
                           CONSTRAINT Pelanggan_pk PRIMARY KEY (id)
);

-- Table: Penyanyi
CREATE TABLE Penyanyi (
                          id int  NOT NULL,
                          nama varchar(100)  NOT NULL,
                          CONSTRAINT Penyanyi_pk PRIMARY KEY (id)
);

-- Table: Playlist
CREATE TABLE Playlist (
                          id int  NOT NULL,
                          nama varchar(100)  NOT NULL,
                          CONSTRAINT Playlist_pk PRIMARY KEY (id)
);

-- Table: Tipe_media
CREATE TABLE Tipe_media (
                            id int  NOT NULL,
                            nama varchar(100)  NOT NULL,
                            CONSTRAINT Tipe_media_pk PRIMARY KEY (id)
);

-- Table: Transaksi
CREATE TABLE Transaksi (
                           id int  NOT NULL,
                           Tanggal_transaksi date  NOT NULL,
                           Alamat varchar(100)  NOT NULL,
                           Kota varchar(50)  NOT NULL,
                           Provinsi varchar(50)  NOT NULL,
                           Negara varchar(50)  NOT NULL,
                           Kode_Pos varchar(10)  NOT NULL,
                           Pelanggan_id int  NOT NULL,
                           Pegawai_id int  NOT NULL,
                           CONSTRAINT Transaksi_pk PRIMARY KEY (id,Pelanggan_id)
);

-- Table: detail_transaksi
CREATE TABLE detail_transaksi (
                                  id int  NOT NULL,
                                  harga int  NOT NULL,
                                  jumlah int  NOT NULL,
                                  Transaksi_id int  NOT NULL,
                                  Transaksi_Pelanggan_id int  NOT NULL,
                                  Album_id int  NOT NULL,
                                  Album_Penyanyi_id int  NOT NULL,
                                  metode_pembayaran_id int  NOT NULL,
                                  riwayat_transaksi_id int  NOT NULL,
                                  CONSTRAINT detail_transaksi_pk PRIMARY KEY (id,Album_id,Album_Penyanyi_id,Transaksi_id,metode_pembayaran_id,Transaksi_Pelanggan_id)
);

-- Table: genre
CREATE TABLE genre (
                       id int  NOT NULL,
                       nama varchar(100)  NOT NULL,
                       CONSTRAINT genre_pk PRIMARY KEY (id)
);

-- Table: genre_Lagu
CREATE TABLE genre_Lagu (
                            genre_id int  NOT NULL,
                            Lagu_id int  NOT NULL,
                            CONSTRAINT genre_Lagu_pk PRIMARY KEY (genre_id,Lagu_id)
);

-- Table: metode_pembayaran
CREATE TABLE metode_pembayaran (
                                   id int  NOT NULL,
                                   Method varchar(50)  NOT NULL,
                                   CONSTRAINT metode_pembayaran_pk PRIMARY KEY (id)
);

-- Table: riwayat_transaksi
CREATE TABLE riwayat_transaksi (
                                   id int  NOT NULL,
                                   Status int  NOT NULL,
                                   Created_on timestamp  NOT NULL,
                                   Updated_on timestamp  NOT NULL,
                                   CONSTRAINT riwayat_transaksi_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: Album_Penyanyi (table: Album)
ALTER TABLE Album ADD CONSTRAINT Album_Penyanyi
    FOREIGN KEY (Penyanyi_id)
        REFERENCES Penyanyi (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Lagu_Album (table: Lagu)
ALTER TABLE Lagu ADD CONSTRAINT Lagu_Album
    FOREIGN KEY (Album_id, Album_Penyanyi_id)
        REFERENCES Album (id, Penyanyi_id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Lagu_Playlist_Lagu (table: Lagu_Playlist)
ALTER TABLE Lagu_Playlist ADD CONSTRAINT Lagu_Playlist_Lagu
    FOREIGN KEY (Lagu_id)
        REFERENCES Lagu (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Lagu_Playlist_Playlist (table: Lagu_Playlist)
ALTER TABLE Lagu_Playlist ADD CONSTRAINT Lagu_Playlist_Playlist
    FOREIGN KEY (Playlist_id)
        REFERENCES Playlist (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Lagu_Tipe_media (table: Lagu)
ALTER TABLE Lagu ADD CONSTRAINT Lagu_Tipe_media
    FOREIGN KEY (Tipe_media_id)
        REFERENCES Tipe_media (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Pegawai_Pegawai (table: Pegawai)
ALTER TABLE Pegawai ADD CONSTRAINT Pegawai_Pegawai
    FOREIGN KEY (atasan)
        REFERENCES Pegawai (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Transaksi_Pegawai (table: Transaksi)
ALTER TABLE Transaksi ADD CONSTRAINT Transaksi_Pegawai
    FOREIGN KEY (Pegawai_id)
        REFERENCES Pegawai (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Transaksi_Pelanggan (table: Transaksi)
ALTER TABLE Transaksi ADD CONSTRAINT Transaksi_Pelanggan
    FOREIGN KEY (Pelanggan_id)
        REFERENCES Pelanggan (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: detail_transaksi_Album (table: detail_transaksi)
ALTER TABLE detail_transaksi ADD CONSTRAINT detail_transaksi_Album
    FOREIGN KEY (Album_id, Album_Penyanyi_id)
        REFERENCES Album (id, Penyanyi_id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: detail_transaksi_Transaksi (table: detail_transaksi)
ALTER TABLE detail_transaksi ADD CONSTRAINT detail_transaksi_Transaksi
    FOREIGN KEY (Transaksi_id, Transaksi_Pelanggan_id)
        REFERENCES Transaksi (id, Pelanggan_id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: detail_transaksi_metode_pembayaran (table: detail_transaksi)
ALTER TABLE detail_transaksi ADD CONSTRAINT detail_transaksi_metode_pembayaran
    FOREIGN KEY (metode_pembayaran_id)
        REFERENCES metode_pembayaran (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: genre_Lagu_Lagu (table: genre_Lagu)
ALTER TABLE genre_Lagu ADD CONSTRAINT genre_Lagu_Lagu
    FOREIGN KEY (Lagu_id)
        REFERENCES Lagu (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: genre_Lagu_genre (table: genre_Lagu)
ALTER TABLE genre_Lagu ADD CONSTRAINT genre_Lagu_genre
    FOREIGN KEY (genre_id)
        REFERENCES genre (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: riwayat_transaksi_detail_transaksi (table: detail_transaksi)
ALTER TABLE detail_transaksi ADD CONSTRAINT riwayat_transaksi_detail_transaksi
    FOREIGN KEY (riwayat_transaksi_id)
        REFERENCES riwayat_transaksi (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- sequences
-- Sequence: Lagu_seq
CREATE SEQUENCE Lagu_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- Sequence: Pegawai_seq
CREATE SEQUENCE Pegawai_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- Sequence: Pelanggan_seq
CREATE SEQUENCE Pelanggan_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- Sequence: Penyanyi_seq
CREATE SEQUENCE Penyanyi_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- Sequence: Playlist_seq
CREATE SEQUENCE Playlist_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- Sequence: Tipe_media_seq
CREATE SEQUENCE Tipe_media_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- Sequence: genre_seq
CREATE SEQUENCE genre_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- Sequence: metode_pembayaran_seq
CREATE SEQUENCE metode_pembayaran_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- Sequence: riwayat_transaksi_seq
CREATE SEQUENCE riwayat_transaksi_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- End of file.

