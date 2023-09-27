Feature: S_1_1_MenüleriGez
 #S kodlu shop user ile login olur, stok 2.0 daki bütün menüleri gezer her sayfada olması
 # gereken alanları kontol eder.


  Background: System Login
    Given I control logout with username: "DealerFToker2"
    Given Open the url given by jenkins job
    #Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerFToker2" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 5 seconds at index 1
    When I click element: login button at index 1

  @Stok
  Scenario: S_1_1_MenüleriGez
    #Ozet Ekranı
    And I see Ozet page

   # Then I wait ozetEkraniBasligi element 2 seconds at index 1
   # Then I wait ozetEkraniBuHafta element 2 seconds at index 1
   # Then I wait ozetEkraniSatislarim element 2 seconds at index 1
   # Then I scroll to the "ozetEkraniTransferlerim" at index 1
   # Then I wait ozetEkraniTransferlerim element 2 seconds at index 1
   # Then I wait ozetEkraniUrunlerim element 2 seconds at index 1

    Then I wait ozet button element 5 seconds at index 1

    #Urunlerim Ekranı
    And I see urun page
    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1

    Then I wait urunlerim button element 5 seconds at index 1
    And I click element: urunlerim button at index 1

    And I wait urun arama element 2 seconds at index 1
    And I wait urunlerimEkraniBasligi element 2 seconds at index 1
    And I wait urunlerimEkraniBayiFiyati element 2 seconds at index 1
    And I wait urunlerimEkraniSKU element 2 seconds at index 1
    And I wait urunlerimEkraniBarkod element 2 seconds at index 1
    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1

    #Satis Ekranı
    And I see satis page
    Then I wait satis element 5 seconds at index 1
    And I click element: satis at index 1
    Then I wait satislistesi element 5 seconds at index 1
    And I click element: satislistesi at index 1

    Then I wait satislistesiEkraniBasligi element 5 seconds at index 1
    Then I wait satislistesiEkraniAramaAlani element 5 seconds at index 1
    Then I wait satislistesiEkraniBelgeTipi element 5 seconds at index 1
    Then I wait satislistesiEkraniERPdurumu element 5 seconds at index 1

    #faturaliSatis Ekranı

    Then I wait faturaliSatis element 5 seconds at index 1
    And I click element: faturaliSatis at index 1

    Then I wait faturaliSatisEkraniBasligi element 2 seconds at index 1
    Then I wait faturaliSatisArama element 2 seconds at index 1
    Then I wait faturaliSatisEkle element 2 seconds at index 1
    Then I wait faturaliSatisNakitButon element 2 seconds at index 1
    Then I wait faturaliSatisSatisTamamla element 2 seconds at index 1
    Then I wait faturaliSatistckn element 2 seconds at index 1
    Then I wait faturaliSatisFirstName element 2 seconds at index 1
    Then I wait faturaliSatisLastName element 2 seconds at index 1
    Then I wait faturaliSatisGSM element 2 seconds at index 1
    Then I wait faturaliSatisEMail element 2 seconds at index 1
    Then I wait faturaliSatisStreet element 2 seconds at index 1
    Then I wait faturaliSatisCitydown element 2 seconds at index 1
    Then I wait faturaliSatisSKU element 2 seconds at index 1
    Then I wait faturaliSatisBirimFiyati element 2 seconds at index 1
    Then I wait faturaliSatisKalanTutar element 2 seconds at index 1

    #kampanyaliSatis Ekranı

    Then I wait kampanyaliSatis element 5 seconds at index 1
    And I click element: kampanyaliSatis at index 1

    Then I wait kampanyaliSatisEkraniBasligi element 5 seconds at index 1
    Then I wait kampanyaliSatisAramaAlani element 5 seconds at index 1

    #fisliSatis Ekranı

    Then I wait fisliSatis element 5 seconds at index 1
    And I click element: fisliSatis at index 1

    Then I wait fisliSatisSatisTamamla element 5 seconds at index 1
    Then I wait fisliSatisIMEI element 5 seconds at index 1
    Then I wait fisliSatisSKU element 5 seconds at index 1
    Then I wait fisliSatisArama element 5 seconds at index 1
    Then I wait fisliSatisEkle element 5 seconds at index 1
    Then I scroll to the "fisliSatisKalanTutar" at index 1
    Then I wait fisliSatisKalanTutar element 5 seconds at index 1
    Then I wait satis element 5 seconds at index 1
    And I click element: satis at index 1

    #transfer Ekranı
    And I see transfer page

    Then I wait transfer button element 5 seconds at index 1
    And I click element: transfer button at index 1
    Then I wait transferListesi button element 5 seconds at index 1
    And I click element: transferListesi button at index 1

    Then I wait transferListesiEkraniBasligi element 5 seconds at index 1
    Then I wait transferListesiAramaAlani element 5 seconds at index 1
    Then I wait transferListesiDokumanNumarasi element 5 seconds at index 1
    Then I wait transferListesiTransferEdenMagza element 5 seconds at index 1
    Then I wait transferListesiEkraniBasligi element 5 seconds at index 1
    Then I wait transferListesiEkraniBasligi element 5 seconds at index 1
    Then I wait transferListesiTransferEilenEdenMagza element 5 seconds at index 1
    Then I wait transferListesiTransferDurumu element 5 seconds at index 1
    Then I wait transferListesiHataAciklamasi element 5 seconds at index 1

    Then I wait transferOlustur button element 5 seconds at index 1
    And I click element: transferOlustur button at index 1

    Then I wait transferOlusturEkraniBasligi element 2 seconds at index 1
    Then I wait transferOlusturGonder element 2 seconds at index 1
    Then I wait transferOlusturEkraniBasligi element 2 seconds at index 1
    Then I wait transferOlusturAramaAlani element 2 seconds at index 1
    Then I wait transferOlusturEkle element 2 seconds at index 1
    Then I wait transferOlusturSKU element 2 seconds at index 1
    Then I wait transferOlusturUrunKodu element 2 seconds at index 1
    Then I wait transferOlusturUrunAdi element 2 seconds at index 1
    Then I wait transferOlusturIMEI element 2 seconds at index 1
    #Then I wait transferOlusturTeklifTipi element 2 seconds at index 1
    Then I wait transferOlusturAdet element 52 seconds at index 1
    Then I wait transferOlusturIslemYapanPer element 2 seconds at index 1
    Then I wait transferOlusturTransferEdilenMagza element 2 seconds at index 1

    Then I wait transfer button element 5 seconds at index 1
    And I click element: transfer button at index 1

    #siparişler Ekranı

    And I see siparisler page

    Then I wait siparisler button element 5 seconds at index 1
    And I click element: siparisler button at index 1
    Then I wait teslimatSiparisleriBTN element 5 seconds at index 1
    And I click element: teslimatSiparisleriBTN at index 1

    Then I wait teslimatSiparisleriEkraniBasligi element 2 seconds at index 1
    Then I wait teslimatSiparisleriIrsaliyeNumarasi element 2 seconds at index 1
    Then I wait teslimatSiparisleriIrsaliyeNoArama element 2 seconds at index 1
    Then I wait teslimatSiparisleriVersiyon element 2 seconds at index 1
    Then I wait teslimatSiparisleriTedarilci element 2 seconds at index 1
    Then I wait teslimatSiparisleriSiparisDurumu element 2 seconds at index 1
    Then I wait teslimatSiparisleriIslemYapanPersonel element 2 seconds at index 1

    Then I wait siparisler button element 5 seconds at index 1
    And I click element: siparisler button at index 1

   #topluStokGirişi Ekranı

    And I see topluStokGirisi page

    Then I wait topluStokGirisi button element 5 seconds at index 1
    And I click element: topluStokGirisi button at index 1

    Then I wait topluStokGirisiLaptopicon element 2 seconds at index 1
    Then I wait topluStokGirisiComputer element 2 seconds at index 1
    Then I wait topluStokGirisiEkraniBasligi element 2 seconds at index 1
    Then I wait topluStokGirisiDurum element 2 seconds at index 1
    Then I wait topluStokGirisiDosyaAdi element 2 seconds at index 1
    Then I wait topluStokGirisiDetayliAciklama element 2 seconds at index 1

      #Entegratör Bilgi Güncelleme

    And I see entegrator page

    Then I wait ent BilgiGun element 5 seconds at index 1
    Then I click element: ent BilgiGun at index 1
    Then I wait ent EkraniBasligi element 2 seconds at index 1
    Then I wait ent Alandi element 2 seconds at index 1
    Then I wait ent EDM element 2 seconds at index 1
    Then I wait ent LOGO element 2 seconds at index 1
    Then I wait ent KulAdi element 2 seconds at index 1
    Then I wait ent Sifre element 2 seconds at index 1
    #Then I wait ent Email element 2 seconds at index 1
    #Then I wait ent TCKN element 2 seconds at index 1
    #Then I wait ent Isim element 2 seconds at index 1
    #Then I wait ent SoyIsim element 2 seconds at index 1
    #Then I wait ent VeriDairesi element 2 seconds at index 1
    #Then I wait ent Mersis element 2 seconds at index 1
    #Then I wait ent SicilNo element 2 seconds at index 1
    #Then I wait ent KaydetBtn element 2 seconds at index 1

    #Then I wait entegrator radio buttons element 2 seconds at index 1
    #And I click element: entegrator radio buttons at index 1

    #Then I wait ent KulAdi element 2 seconds at index 1
    #Then I wait ent Sifre element 2 seconds at index 1
    #Then I wait ent TCKN element 2 seconds at index 1
    #Then I wait ent Isim element 2 seconds at index 1
    #Then I wait ent SoyIsim element 2 seconds at index 1
    #Then I wait ent VeriDairesi element 2 seconds at index 1
    #Then I wait ent Mersis element 2 seconds at index 1
    #Then I wait ent SicilNo element 2 seconds at index 1
    #Then I wait entegrator radio buttons element 2 seconds at index 1
    #And I click element: entegrator radio buttons at index 1

    #Then I wait entegrator radio buttons element 2 seconds at index 2
    #And I click element: entegrator radio buttons at index 2

    Then I wait ent VkNo element 2 seconds at index 1
    Then I wait ent UNVAN element 2 seconds at index 1
    Then I wait ent VeriDairesi element 2 seconds at index 1
    Then I wait ent Mersis element 2 seconds at index 1
    Then I wait ent SicilNo element 2 seconds at index 1

    #işlem bitti çıkış yap.
    And I logout the system