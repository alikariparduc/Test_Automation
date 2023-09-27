Feature: W_1_1_MenüleriGez
 #W kodlu shop user ile login olur, stok 2.0 daki bütün menüleri gezer her sayfada olması
 # gereken alanları kontol eder.


  Background: System Login
    Given I control logout with username: "DealerADelioglu2"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerADelioglu2" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 5 seconds at index 1
    When I click element: login button at index 1


  @Stok
  Scenario: W_1_1_MenüleriGez
    #Ozet Ekranı
    #And I see Ozet page
 #####
    #Then I wait ozetEkraniBasligi element 2 seconds at index 1
    #Then I wait ozetEkraniBuHafta element 2 seconds at index 1
    #Then I wait ozetEkraniSatislarim element 2 seconds at index 1
    #Then I scroll to the "ozetEkraniTransferlerim" at index 1
    #Then I wait ozetEkraniTransferlerim element 2 seconds at index 1
    #Then I wait ozetEkraniUrunlerim element 2 seconds at index 1


    #Then I wait ozet button element 5 seconds at index 1

    #Urunlerim Ekranı
    And I see urun page
    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1

    Then I wait urunlerim button element 5 seconds at index 1
    And I click element: urunlerim button at index 1

    And I wait urun arama element 2 seconds at index 1
    And I wait urunlerimEkraniBasligi element 2 seconds at index 1
    And I wait urunlerimBayiSorgulaBtn element 2 seconds at index 1
    And I wait urunlerimSepetimBtn element 2 seconds at index 1

    And I wait urunlerimEkraniSKU element 2 seconds at index 1
    And I wait urunlerimEkraniBarkod element 2 seconds at index 1
    And I wait urunlerimSepeteEkleBtn element 2 seconds at index 1
    And I wait urunlerimUrunEkleBtn element 2 seconds at index 1
    And I wait urunlerimUrunuSilBtn element 2 seconds at index 1

    #################################################################################################
    ##Satış Oluştur Ekranını kontrol etmek için sepete ürün eklenmesi gerekiyor

    Then I click element: urunEkle at index 1
    And I enter a IMEI number to input imei at index 1
    And I wait input imei element 1 seconds at index 1
    Then I click element: input imei at index 1
    And I wait Ekle element 1 seconds at index 1
    Then I click element: Ekle at index 1
    Then I need to just wait
    #Then I have to refresh the page

    And I wait urun arama element 1 seconds at index 1
    And I enter a IMEI number to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1
    Then I click element: serch1 at index 1

    And I see sepet page
    And I wait sepete ekle button element 1 seconds at index 1
    Then I click element: sepete ekle button at index 1
    And I wait ImeiSecme element 1 seconds at index 1
    Then I click element: ImeiSecme at index 1
    Then I select a IMEI number from sepet randomImei at index 1
    And I wait serchtamam element 1 seconds at index 1
    Then I click element: serchtamam at index 1
    #################################################################################################

    And I see urun page
    Then I wait urun button element 5 seconds at index 1
    And I click element: urun button at index 1

    #Satis Listesi Ekranı
    And I see satis page
    Then I wait satis element 5 seconds at index 1
    And I click element: satis at index 1
    Then I wait satislistesi element 5 seconds at index 1
    And I click element: satislistesi at index 1

    Then I wait satislistesiEkraniBasligi element 5 seconds at index 1
    Then I wait satislistesiEkraniAramaAlani element 5 seconds at index 1
    Then I wait satislistesiEkraniBelgeTipi element 5 seconds at index 1
    Then I wait satislistesiEkraniERPdurumu element 5 seconds at index 1

    #Satis Oluştur Ekranı
    Then I wait satisOlustur element 5 seconds at index 1
    And I click element: satisOlustur at index 1

    Then I wait satisOlusturBaslik element 2 seconds at index 1
    And I wait satisOlusturSatisiTamamla element 3 seconds at index 1
    Then I wait satisOlusturIslemiYapanPersonel element 2 seconds at index 1
    And I wait satisOlusturSilverBayiSecimi element 3 seconds at index 1

    Then I wait faturaliSatistckn element 2 seconds at index 1
    Then I wait faturaliSatisFirstName element 2 seconds at index 1
    Then I wait faturaliSatisLastName element 2 seconds at index 1
    Then I wait faturaliSatisGSM element 2 seconds at index 1
    Then I wait faturaliSatisEMail element 2 seconds at index 1
    Then I wait faturaliSatisStreet element 2 seconds at index 1
    Then I wait satisOlusturCity element 2 seconds at index 1
    Then I wait faturaliSatisSKU element 2 seconds at index 1
    Then I wait faturaliSatisBirimFiyati element 2 seconds at index 1

    And I see sepet page
    And I click element: sepettenUrunuSilBtn at index 1
    And I wait Tamam element 3 seconds at index 1
    Then I click element: Tamam at index 1

    And I see satis page
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
    Then I wait ent Email element 2 seconds at index 1
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