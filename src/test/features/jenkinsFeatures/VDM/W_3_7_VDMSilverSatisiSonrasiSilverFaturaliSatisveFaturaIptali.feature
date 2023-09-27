Feature: W_3_7_VDMSilverSatisiSonrasiSilverFaturaliSatisveFaturaIptali


  Background: System Login
    Given I control logout with username: "DealerAKirklar5"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerAKirklar5" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1


  @Stok
  Scenario: W_3_7_VDMSilverSatisiSonrasiSilverFaturaliSatisveFaturaIptali
    And I see ozet page
    And I wait ozet button element 5 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 5 seconds at index 1
    And I  get Dashboard Stock Value ozetEkraniToplamUrunAdedi

    # ürün lerim sayfasına giriş.
    And I see urun page
    And I wait urun button element 5 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 5 seconds at index 1
    Then I click element: urunlerim button at index 1
    Then I wait urun arama element 5 seconds at index 1
    Then I enter "190198044167" text to urun arama at index 1
    And I press Down and Enter buttons

    # Imei ile ürün ekle
    And I see urun page
    And I wait urunEkle element 5 seconds at index 1
    Then I click element: urunEkle at index 1
    And I enter a IMEI number to input imei at index 1
    And I wait input imei element 5 seconds at index 1
    Then I click element: input imei at index 1
    And I wait Ekle element 5 seconds at index 1
    Then I click element: Ekle at index 1
    Then I need to just wait
    And I control take in operations in database for IMEI: "RANDOM" barkod: "190198044167" SKU: "IPH0175" and store code: "W000800"
    Then I need to just wait

    And I wait urun arama element 5 seconds at index 1
    And I enter a IMEI number to urun arama at index 1
    And I wait serch1 element 5 seconds at index 1
    Then I click element: serch1 at index 1
    Then I need to just wait

    # ürün sepete urun ekle
    And I see sepet page
    And I wait sepete ekle button element 5 seconds at index 1
    Then I click element: sepete ekle button at index 1
    And I wait ImeiSecme element 5 seconds at index 1
    Then I click element: ImeiSecme at index 1

    Then I select a IMEI number from sepet randomImei at index 1
    And I wait serchtamam element 5 seconds at index 1
    Then I click element: serchtamam at index 1
    And I need to just wait

    And I see ozet page
    And I wait ozet button element 5 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 5 seconds at index 1
    And I verify Dashboard Value: ozetEkraniToplamUrunAdedi at addCount 1
    And I  get Dashboard Stock Value ozetEkraniToplamUrunAdedi

    # sepetim sayfasına git.
    And I see sepet page
    And I wait satis element 5 seconds at index 1
    Then I click element: satis at index 1
    And I wait satisOlustur element 5 seconds at index 1
    Then I click element: satisOlustur at index 1
    And I wait silverPartnerSecim element 3 seconds at index 1
    Then I click element: silverPartnerSecim at index 1
    And I wait silverSatisYapilacakBayi element 3 seconds at index 1
    Then I click element: silverSatisYapilacakBayi at index 1

    And I wait satisiTamamlaBtn element 3 seconds at index 1
    Then I click element: satisiTamamlaBtn at index 1
    And I wait satisOnayTamam element 5 seconds at index 1
    Then I click element: satisOnayTamam at index 1

    # satışın başarılı olduğunu kontrol et
    And I see satisListesi page
    Then I wait satislistesi element 5 seconds at index 1
    And I click element: satislistesi at index 1

    Then I click element: hamburger close at index 1

    And I wait satislistArama element 2 seconds at index 1
    And I click element: satislistArama at index 1
    Then I enter a IMEI number to satislistArama at index 1
    And I wait satislistAramaBtn element 5 seconds at index 1
    And I click element: satislistAramaBtn at index 1
    And I wait SurecBasarili element 60 seconds at index 1

    #burada db üzerinden satışı kontrol et
    #Then I click element: SurecBasarili at index 1
    #And I wait Incele element 5 seconds at index 1
    #Then I click element: Incele at index 1
    #And I need to just wait
    #And I save fatura bilgileri into variables
    #And I save fatura name from faturaDetay element at index 1
    #And I control vdm to silver sale operations in database for IMEI: "RANDOM" barkod: "190198044167" SKU: "IPH0175" and store code: "W001000-01"
    #And I wait Geri element 5 seconds at index 1
    #Then I click element: Geri at index 1

    Then I need to just wait
    Then I click element: hamburger close at index 1

    And I see urun page
    Then I wait urunlerim button element 2 seconds at index 1
    And I click element: urunlerim button at index 1
    And I wait urunlerimEkraniBasligi element 2 seconds at index 1
    And I wait urun arama element 2 seconds at index 1
    And I enter a IMEI number to urun arama at index 1
    Then I wait urunStokdaYokSatildi element 2 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1
    And I need to just wait

    And I see ozet page
    And I wait ozet button element 5 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 5 seconds at index 1
    And I verify Dashboard Value: ozetEkraniToplamUrunAdedi at deleteCount 1

    # işlem bitti çıkış yap.
    And I logout the system

    #silver ile giriş yap.
    And I need to just wait
    And I have to refresh the page
    And I need to just wait
    Given I control logout with username: "DealerHDemir57"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerHDemir57" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

    And I see ozet page
    And I wait ozet button element 5 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 5 seconds at index 1
    And I  get Dashboard Stock Value ozetEkraniToplamUrunAdedi

    # ürün lerim sayfasında ürünün geldiğinin kontrolü
    And I see urun page
    And I wait urun button element 5 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 5 seconds at index 1
    Then I click element: urunlerim button at index 1

    And I wait urunlerimEkraniBasligi element 5 seconds at index 1
    And I wait urun arama element 5 seconds at index 1
    Then I enter a IMEI number to urun arama at index 1
    Then I wait serch1 element 5 seconds at index 1
    Then I click element: serch1 at index 1

    #vdm'den silver'a yapılan satisi kontrol etme
    And I see satis page
    Then I wait satis element 5 seconds at index 1
    And I click element: satis at index 1
    And I see satisListesi page
    Then I wait satislistesi element 5 seconds at index 1
    And I click element: satislistesi at index 1

    And I wait hamburger close element 5 seconds at index 1
    Then I click element: hamburger close at index 1

    Then I wait satisTipi element 5 seconds at index 1
    And I click element: satisTipi at index 1
    And I press Down and Enter buttons

    Then I wait satislistArama element 5 seconds at index 1
    And I click element: satislistArama at index 1
    Then I enter a IMEI number to satislistArama at index 1
    And I wait satislistAramaBtn element 5 seconds at index 1
    And I click element: satislistAramaBtn at index 1
    And I wait SurecBasarili element 60 seconds at index 1
    Then I click element: SurecBasarili at index 1

    And I wait hamburger close element 5 seconds at index 1
    Then I click element: hamburger close at index 1

    #gelen ürünü faturalı satma
    And I see satis page
    And I wait faturaliSatis element 5 seconds at index 1
    Then I click element: faturaliSatis at index 1
    And I wait faturaliSatisArama element 5 seconds at index 1
    And I enter a IMEI number to faturaliSatisArama at index 1
    And I wait faturaliSatisEkle element 5 seconds at index 1
    Then I click element: faturaliSatisEkle at index 1

    And I wait birimFiyat element 5 seconds at index 1
    Then I enter "9999" text to birimFiyat at index 1
    Then I clear text to birimFiyat at index 1
    Then I enter "150" text to birimFiyat at index 1

    Then I scroll to the "faturaliSatisNakitButon" at index 1
    And I wait faturaliSatisNakitButon element 5 seconds at index 1
    Then I click element: faturaliSatisNakitButon at index 1
    And I wait Nakitgirisinput element 5 seconds at index 1
    Then I clear text to Nakitgirisinput at index 1
    Then I enter "150" text to Nakitgirisinput at index 1
    Then I scroll to the "NakitgirisTutar" at index 1
    And I wait NakitgirisTutar element 5 seconds at index 1
    Then I click element: NakitgirisTutar at index 1

    Then I scroll to the "faturaliSatistckn"
    Then I enter "33212312342" text to faturaliSatistckn at index 1
    Then I enter "Selenium" text to faturaliSatisFirstName at index 1
    Then I enter "Fat.Şahıs.Bireysel" text to faturaliSatisLastName at index 1

    Then I scroll to the "faturaliSatisGSM" at index 1
    Then I enter "0542542542" text to faturaliSatisGSM at index 1
    Then I scroll to the "faturaliSatisEMail" at index 1
    Then I enter "auto@case.com.tr" text to faturaliSatisEMail at index 1
    Then I scroll to the "faturaliSatisStreet" at index 1
    Then I enter "Java Street no:150€ /[10+$]" text to faturaliSatisStreet at index 1

    And I wait faturaliSatisCitydown element 5 seconds at index 1
    Then I click element: faturaliSatisCitydown at index 1
    And I wait Citydown1 element 5 seconds at index 1
    Then I click element: Citydown1 at index 1
    And I wait district element 5 seconds at index 1
    Then I click element: district at index 1
    And I wait Citydown1 element 5 seconds at index 1
    Then I click element: Citydown1 at index 1

    And I wait faturaliSatisSatisTamamla element 2 seconds at index 1
    Then I click element: faturaliSatisSatisTamamla at index 1
    Then I need to just wait
    And I wait SatisbasariliTamamBtn element 2 seconds at index 1
    Then I click element: SatisbasariliTamamBtn at index 1
    And I need to just wait

    #Satışın başarılı olduğunu kontrol et
    And I see satisListesi page
    Then I wait satislistesi element 5 seconds at index 1
    And I click element: satislistesi at index 1

    And I wait hamburger close element 5 seconds at index 1
    Then I click element: hamburger close at index 1

    Then I wait satislistArama element 5 seconds at index 1
    And I click element: satislistArama at index 1
    Then I enter a IMEI number to satislistArama at index 1
    And I wait satislistAramaBtn element 5 seconds at index 1
    And I click element: satislistAramaBtn at index 1
    And I wait SurecBasarili element 60 seconds at index 1

    And I wait hamburger close element 5 seconds at index 1
    Then I click element: hamburger close at index 1

    #Urunun satıldığının kontrolü
    Then I see urun page
    And I wait urunlerim button element 5 seconds at index 1
    Then I click element: urunlerim button at index 1
    And I wait urunlerimEkraniBasligi element 5 seconds at index 1
    And I wait urun arama element 5 seconds at index 1
    Then I enter a IMEI number to urun arama at index 1
    Then I wait urun Stokda Yok element 2 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1
    And I need to just wait

    And I see ozet page
    And I wait ozet button element 5 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 5 seconds at index 1
    And I verify Dashboard Value: ozetEkraniToplamUrunAdedi at deleteCount 1
    And I  get Dashboard Stock Value ozetEkraniToplamUrunAdedi

    # faturanın iptali
    And I see satisListesi page
    Then I wait satislistesi element 5 seconds at index 1
    And I click element: satislistesi at index 1

    And I wait hamburger close element 5 seconds at index 1
    Then I click element: hamburger close at index 1

    Then I wait satislistArama element 5 seconds at index 1
    And I click element: satislistArama at index 1
    Then I enter a IMEI number to satislistArama at index 1
    And I wait satislistAramaBtn element 5 seconds at index 1
    And I click element: satislistAramaBtn at index 1
    And I wait SurecBasarili element 60 seconds at index 1
    Then I click element: SurecBasarili at index 1
    And I wait IptalEt element 5 seconds at index 1
    Then I click element: IptalEt at index 1
    And I wait Tamam element 5 seconds at index 1
    Then I click element: Tamam at index 1
    And I wait SurecIptal element 60 seconds at index 1
    Then I click element: SurecIptal at index 1
    And I wait Incele element 5 seconds at index 1
    Then I click element: Incele at index 1
    And I see fatura page
    And I wait siparisOlusturuldu element 2 seconds at index 1
    And I wait faturaGonderildi element 2 seconds at index 1
    And I wait faturaOlusturuldu element 2 seconds at index 1
    And I wait iptalSureciBasladi element 2 seconds at index 1
    And I wait faturaIptalEdildiUrunlerinEnvantereAlinmasiBekleniyor element 2 seconds at index 1
    And I wait faturaIptalEdildiUrunlerEnvantereAlindi element 2 seconds at index 1
    And I wait erpServiseGonderilecek element 2 seconds at index 1
    And I wait erpServiseGonderildi element 2 seconds at index 1
    And I wait erpServiseKaydedildi element 2 seconds at index 1
    And I wait faturaninIptalEdildigiBilgisiERPServiseGonderildi element 2 seconds at index 1

    And I wait hamburger close element 5 seconds at index 1
    Then I click element: hamburger close at index 1


    # fatura iptali sonrası imei'nin kullanılabilir olduğunun kontrolü
    Then I see urun page
    #And I wait urun button element 5 seconds at index 1
    #When I click element: urun button at index 1
    And I wait urunlerim button element 5 seconds at index 1
    Then I click element: urunlerim button at index 1
    And I wait urunlerimEkraniBasligi element 5 seconds at index 1
    And I wait urun arama element 5 seconds at index 1
    Then I enter a IMEI number to urun arama at index 1
    Then I wait serch1 element 5 seconds at index 1
    Then I click element: serch1 at index 1
    And I need to just wait

    And I see ozet page
    And I wait ozet button element 5 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 5 seconds at index 1
    And I verify Dashboard Value: ozetEkraniToplamUrunAdedi at addCount 1

    #işlem bitti çıkış yap
    And I logout the system