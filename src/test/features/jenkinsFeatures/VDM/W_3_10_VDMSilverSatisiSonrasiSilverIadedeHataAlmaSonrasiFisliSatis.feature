Feature: W_3_10_VDMSilverSatisiSonrasiSilverIadedeHataAlmaSonrasiFisliSatis


  Background: System Login
    Given I control logout with username: "DealerAKirklar5"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerAKirklar5" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1


  @Stok
  Scenario: W_3_10_VDMSilverSatisiSonrasiSilverIadedeHataAlmaSonrasiFisliSatis
    And I see ozet page
    And I wait ozet button element 3 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 3 seconds at index 1
    And I  get Dashboard Stock Value ozetEkraniToplamUrunAdedi

    # ürün lerim sayfasına giriş.
    And I see urun page
    And I wait urun button element 3 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1
    Then I wait urun arama element 5 seconds at index 1
    And I generate an IMEI list with count: 3

    Then I enter "194252157008" text to urun arama at index 1
    And I press Down and Enter buttons
    And I wait urunEkle element 3 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait input imei element 3 seconds at index 1
    Then I click element: input imei at index 1
    And I enter 1. IMEI number from generated IMEI list to input imei at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1
    And I need to just wait

    Then I enter "194252157008" text to urun arama at index 1
    And I wait serch1 element 3 seconds at index 1
    Then I click element: serch1 at index 1
    And I wait urunEkle element 3 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait input imei element 3 seconds at index 1
    Then I click element: input imei at index 1
    And I enter 2. IMEI number from generated IMEI list to input imei at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1
    And I need to just wait

    Then I enter "194252101988" text to urun arama at index 1
    And I wait serch1 element 3 seconds at index 1
    Then I click element: serch1 at index 1
    And I wait urunEkle element 3 seconds at index 1
    Then I click element: urunEkle at index 1
    And I wait input imei element 3 seconds at index 1
    Then I click element: input imei at index 1
    And I enter 3. IMEI number from generated IMEI list to input imei at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1
    And I need to just wait

    # Ürünleri sepete ekle
    Then I enter 1. IMEI number from generated IMEI list to urun arama at index 1
    Then I wait serch1 element 3 seconds at index 1
    Then I click element: serch1 at index 1
    And I see sepet page
    And I wait sepete ekle button element 3 seconds at index 1
    Then I click element: sepete ekle button at index 1
    And I wait ImeiSecme element 3 seconds at index 1
    Then I click element: ImeiSecme at index 1
    Then I select 1. IMEI number from generated IMEI list in sepet
    And I wait serchtamam element 3 seconds at index 1
    Then I click element: serchtamam at index 1

    And I see urun page
    And I clear text to urun arama at index 1
    Then I enter 2. IMEI number from generated IMEI list to urun arama at index 1
    Then I wait serch1 element 3 seconds at index 1
    Then I click element: serch1 at index 1
    And I see sepet page
    And I wait sepete ekle button element 3 seconds at index 1
    Then I click element: sepete ekle button at index 1
    And I wait ImeiSecme element 3 seconds at index 1
    Then I click element: ImeiSecme at index 1
    Then I select 2. IMEI number from generated IMEI list in sepet
    And I wait serchtamam element 3 seconds at index 1
    Then I click element: serchtamam at index 1

    And I see urun page
    And I clear text to urun arama at index 1
    Then I enter 3. IMEI number from generated IMEI list to urun arama at index 1
    Then I wait serch1 element 3 seconds at index 1
    Then I click element: serch1 at index 1
    And I see sepet page
    And I wait sepete ekle button element 3 seconds at index 1
    Then I click element: sepete ekle button at index 1
    And I wait ImeiSecme element 3 seconds at index 1
    Then I click element: ImeiSecme at index 1
    Then I select 3. IMEI number from generated IMEI list in sepet
    And I wait serchtamam element 3 seconds at index 1
    Then I click element: serchtamam at index 1
    And I see urun page
    And I clear text to urun arama at index 1
    And I need to just wait

    #Satış öncesi mevcut ürün sayısını kaydet
    And I see ozet page
    And I wait ozet button element 3 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 3 seconds at index 1
    And I verify Dashboard Value: ozetEkraniToplamUrunAdedi at addCount 3
    And I  get Dashboard Stock Value ozetEkraniToplamUrunAdedi

    # sepetim sayfasına git.
    And I see sepet page
    And I wait satis element 3 seconds at index 1
    Then I click element: satis at index 1
    And I wait satisOlustur element 3 seconds at index 1
    Then I click element: satisOlustur at index 1

    And I wait silverPartnerSecim element 3 seconds at index 1
    Then I click element: silverPartnerSecim at index 1
    And I press Down and Enter buttons
    Then I click element: silverPartnerSecim at index 1
    And I press Down and Enter buttons
    Then I click element: silverPartnerSecim at index 1
    And I press Down and Enter buttons
    Then I click element: silverPartnerSecim at index 1
    And I press Down and Enter buttons

    And I wait satisiTamamlaBtn element 3 seconds at index 1
    Then I click element: satisiTamamlaBtn at index 1
    And I wait satisOnayTamam element 2 seconds at index 1
    Then I click element: satisOnayTamam at index 1

    # satışın başarılı olduğunu kontrol et
    And I see satisListesi page
    Then I wait satislistesi element 3 seconds at index 1
    And I click element: satislistesi at index 1

    Then I click element: hamburger close at index 1

    And I wait satislistArama element 2 seconds at index 1
    And I click element: satislistArama at index 1
    Then I enter 2. IMEI number from generated IMEI list to satislistArama at index 1
    And I wait satislistAramaBtn element 3 seconds at index 1
    And I click element: satislistAramaBtn at index 1
    And I wait SurecBasarili element 60 seconds at index 1
    Then I click element: SurecBasarili at index 1
    And I wait Incele element 3 seconds at index 1
    Then I click element: Incele at index 1
    And I see fatura page
    And I wait siparisOlusturuldu element 2 seconds at index 1
    #And I wait faturaGonderildi element 2 seconds at index 1
    And I wait faturaOlusturuldu element 2 seconds at index 1
    And I wait erpServiseGonderilecek element 2 seconds at index 1
    And I wait erpServiseGonderildi element 2 seconds at index 1
    And I wait erpServiseKaydedildi element 2 seconds at index 1

    #burada db üzerinden satışı kontrol et
    #Then I click element: SurecBasarili at index 1
    #And I wait Incele element 3 seconds at index 1
    #Then I click element: Incele at index 1
    #And I need to just wait
    #And I save fatura bilgileri into variables
    #And I save fatura name from faturaDetay element at index 1
    #And I control vdm to silver sale operations in database for IMEI: "RANDOM" barkod: "190198044167" SKU: "IPH0175" and store code: "W001000-01"
    #And I wait Geri element 3 seconds at index 1
    #Then I click element: Geri at index 1

    Then I need to just wait
    Then I click element: hamburger close at index 1

    And I see urun page
    Then I wait urunlerim button element 2 seconds at index 1
    And I click element: urunlerim button at index 1

    And I enter 1. IMEI number from generated IMEI list to urun arama at index 1
    Then I wait urun Stokda Yok Close element 3 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1
    And I clear text to urun arama at index 1

    And I enter 2. IMEI number from generated IMEI list to urun arama at index 1
    Then I wait urun Stokda Yok Close element 3 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1
    And I clear text to urun arama at index 1

    And I enter 3. IMEI number from generated IMEI list to urun arama at index 1
    Then I wait urun Stokda Yok Close element 3 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1
    And I clear text to urun arama at index 1
    And I need to just wait
    And I need to just wait

    And I see ozet page
    And I wait ozet button element 3 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniToplamUrunAdedi element 3 seconds at index 1
    And I verify Dashboard Value: ozetEkraniToplamUrunAdedi at deleteCount 3

    # işlem bitti çıkış yap.
    And I logout the system

    #silver ile giriş yap ve imei'yi iade et.
    And I need to just wait
    And I have to refresh the page
    And I need to just wait
    Given I control logout with username: "R000378"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "R000378" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

    # ürün lerim sayfasında ürünlerin geldiğinin kontrolü
    And I see urun page
    And I wait urun button element 3 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1
    And I wait urunlerimEkraniBasligi element 3 seconds at index 1

    And I wait urun arama element 3 seconds at index 1
    Then I enter 1. IMEI number from generated IMEI list to urun arama at index 1
    And I wait serch1 element 5 seconds at index 1
    Then I click element: serch1 at index 1
    And I clear text to urun arama at index 1

    And I wait urun arama element 3 seconds at index 1
    Then I enter 2. IMEI number from generated IMEI list to urun arama at index 1
    And I wait serch1 element 5 seconds at index 1
    Then I click element: serch1 at index 1
    And I clear text to urun arama at index 1

    And I wait urun arama element 3 seconds at index 1
    Then I enter 3. IMEI number from generated IMEI list to urun arama at index 1
    And I wait serch1 element 5 seconds at index 1
    Then I click element: serch1 at index 1

    #satisi kontrol etme
    And I see satis page
    Then I wait satis element 3 seconds at index 1
    And I click element: satis at index 1
    And I see satisListesi page
    Then I wait satislistesi element 3 seconds at index 1
    And I click element: satislistesi at index 1

    And I wait hamburger close element 3 seconds at index 1
    Then I click element: hamburger close at index 1

    Then I wait satisTipi element 3 seconds at index 1
    And I click element: satisTipi at index 1
    And I press Down and Enter buttons

    Then I wait satislistArama element 3 seconds at index 1
    And I click element: satislistArama at index 1
    Then I enter 1. IMEI number from generated IMEI list to satislistArama at index 1
    And I wait satislistAramaBtn element 3 seconds at index 1
    And I click element: satislistAramaBtn at index 1

    #VDM'den yapılan satışın başarılı olduğunu görme
    And I wait SurecBasarili element 60 seconds at index 1
    Then I click element: SurecBasarili at index 1
    And I wait Incele element 3 seconds at index 1
    Then I click element: Incele at index 1

    And I wait Geri element 3 seconds at index 1
    Then I click element: Geri at index 1

    And I wait hamburger close element 3 seconds at index 1
    Then I click element: hamburger close at index 1

    #iade etme
    Then I see satis page
    And I wait faturaIadeSilver element 3 seconds at index 1
    Then I click element: faturaIadeSilver at index 1

    #faturaliSatisArama = faturaliİadeArama
    And I wait faturaliSatisArama element 3 seconds at index 1
    Then I click element: faturaliSatisArama at index 1

    And I enter 1. IMEI number from generated IMEI list to faturaliSatisArama at index 1
    And I wait faturaIadeEkleBtn element 3 seconds at index 1
    Then I click element: faturaIadeEkleBtn at index 1

    And I enter 2. IMEI number from generated IMEI list to faturaliSatisArama at index 1
    And I wait faturaIadeEkleBtn element 3 seconds at index 1
    Then I click element: faturaIadeEkleBtn at index 1

    And I enter 3. IMEI number from generated IMEI list to faturaliSatisArama at index 1
    And I wait faturaIadeEkleBtn element 3 seconds at index 1
    Then I click element: faturaIadeEkleBtn at index 1

    And I wait faturaIadeyiTamamlaBtn element 3 seconds at index 1
    Then I click element: faturaIadeyiTamamlaBtn at index 1
    And I wait faturaIadeOnayTamamBtn element 3 seconds at index 1
    Then I click element: faturaIadeOnayTamamBtn at index 1

    #burada iade işlemini kontrol et

    #Then I have to refresh the page
    Then I need to just wait

    #iadenin hata aldığının kontrolü
    Then I wait satislistesi element 3 seconds at index 1
    And I click element: satislistesi at index 1
    Then I see satisListesi page
    Then I wait satislistArama element 3 seconds at index 1
    And I click element: satislistArama at index 1
    Then I enter 3. IMEI number from generated IMEI list to satislistArama at index 1
    And I wait satislistAramaBtn element 3 seconds at index 1
    And I click element: satislistAramaBtn at index 1

    And I wait SurecHatali element 3 seconds at index 1
    And I wait SurecHatali element 5 seconds at index 1
    Then I click element: SurecHatali at index 1
    And I wait Incele element 3 seconds at index 1
    Then I click element: Incele at index 1
    And I see fatura page
    And I wait siparisOlusturuldu element 2 seconds at index 1
    And I wait faturaEntegratoreGonderilirkenHataOlustu element 2 seconds at index 1
    And I wait faturaTamamlanamadiERPServiseGonderilemedi element 2 seconds at index 1
    And I wait Geri element 3 seconds at index 1
    Then I click element: Geri at index 1

    #ürünleri fişli olarak son kullanıcıya sat
    And I see satis page
    And I wait fisliSatis element 3 seconds at index 1
    Then I click element: fisliSatis at index 1
    Then I click element: hamburger close at index 1

    And I wait fisliSatisArama element 3 seconds at index 1
    And I enter 1. IMEI number from generated IMEI list to fisliSatisArama at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1

    And I clear text to fisliSatisArama at index 1
    And I enter 2. IMEI number from generated IMEI list to fisliSatisArama at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1

    And I clear text to fisliSatisArama at index 1
    And I enter 3. IMEI number from generated IMEI list to fisliSatisArama at index 1
    And I wait Ekle element 3 seconds at index 1
    Then I click element: Ekle at index 1

    And I scroll to the "birimFiyat" at index 1
    And I wait birimFiyat element 3 seconds at index 1
    And I clear text to birimFiyat at index 1
    Then I enter "1200" text to birimFiyat at index 1

    And I scroll to the "birimFiyat" at index 2
    And I wait birimFiyat element 3 seconds at index 2
    And I click element: birimFiyat at index 2
    And I clear text to birimFiyat at index 2
    Then I enter "1300" text to birimFiyat at index 2

    And I scroll to the "birimFiyat" at index 3
    And I wait birimFiyat element 3 seconds at index 3
    And I click element: birimFiyat at index 3
    And I clear text to birimFiyat at index 3
    Then I enter "1000" text to birimFiyat at index 3

    #And I wait birimFiyat element 3 seconds at index 4
    #Then I clear text to birimFiyat at index 4
    #Then I enter "2" text to birimFiyat at index 5

    Then I scroll to the "fisliSatisNakitButon" at index 1
    And I wait fisliSatisNakitButon element 3 seconds at index 1
    Then I click element: fisliSatisNakitButon at index 1
    And I wait Nakitgirisinput element 3 seconds at index 1
    Then I enter "3500" text to Nakitgirisinput at index 1
    And I wait NakitgirisTutar element 3 seconds at index 1
    Then I click element: NakitgirisTutar at index 1

    Then I scroll to the "fisliSatistckn" at index 1
    Then I enter "33212312342" text to fisliSatistckn at index 1
    Then I click element: fisliSatisSatisTamamla at index 1
    Then I verify the area eksikAlanKntrol by read only at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "Selenium_W_3_10" text to faturaliSatisFirstName at index 1
    Then I click element: fisliSatisSatisTamamla at index 1
    Then I verify the area eksikAlanKntrol by read only at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "Fişli birdenFazlaImei" text to faturaliSatisLastName at index 1
   # Then I click element: fisliSatisSatisTamamla at index 1
   # Then I verify the area eksikAlanKntrol by read only at index 1
   # Then I click element: eksikAlanKntrolclose at index 1

    Then I scroll to the "faturaliSatisGSM" at index 1
    Then I enter "0542542542" text to faturaliSatisGSM at index 1
    Then I click element: fisliSatisSatisTamamla at index 1
    Then I verify the area eksikAlanKntrol by read only at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "auto@case.com.tr" text to faturaliSatisEMail at index 1
    Then I click element: fisliSatisSatisTamamla at index 1
    Then I verify the area eksikAlanKntrol by read only at index 1
    Then I click element: eksikAlanKntrolclose at index 1

    Then I enter "Java Street no:150€ /[10+$]" text to faturaliSatisStreet at index 1
    Then I click element: fisliSatisSatisTamamla at index 1
    Then I verify the area eksikAlanKntrol by read only at index 1

    And I wait faturaliSatisCitydown element 3 seconds at index 1
    Then I click element: faturaliSatisCitydown at index 1
    And I wait Citydown1 element 3 seconds at index 1
    Then I click element: Citydown1 at index 1
    And I wait district element 3 seconds at index 1
    Then I click element: district at index 1
    And I wait Citydown1 element 3 seconds at index 1
    Then I click element: Citydown1 at index 1

     # FİŞLİ SATIŞ TAMAMLAMA

    And I wait fisliSatisSatisTamamla element 2 seconds at index 1
    Then I click element: fisliSatisSatisTamamla at index 1
    And I wait SatisbasariliTamamBtn element 2 seconds at index 1
    Then I click element: SatisbasariliTamamBtn at index 1

    # FİŞLİ SATIŞ ONAYI

    Then I need to just wait
    Then I see satisListesi page
    Then I need to just wait
    And I wait satislistArama element 3 seconds at index 1
    And I enter 1. IMEI number from generated IMEI list to satislistArama at index 1
    Then I need to just wait

    And I wait satislistAramaBtn element 3 seconds at index 1
    Then I click element: satislistAramaBtn at index 1
    And I wait SurecBasarili element 60 seconds at index 1
    Then I click element: SurecBasarili at index 1
    And I wait belgeTipiFisli element 3 seconds at index 1
    Then I click element: belgeTipiFisli at index 1

    # Fiş detay inceleme
    And I wait Incele element 3 seconds at index 1
    Then I click element: Incele at index 1

    And I see urun page
    And I see satis page
    And I see satisListesi page
    Then I scroll to the "TCKN" at index 1
    Then I verify the area TCno by read only at index 1
    Then I verify the area GSMkontorl by read only at index 1
    And I see fatura page
    And I wait fisOlusturuldu element 2 seconds at index 1
    And I see satisListesi page
    And I wait Geri element 3 seconds at index 1
    Then I click element: Geri at index 1
    Then I click element: hamburger close at index 1

    #ürünlerin stoktan çıktığını kontrol et
    And I see urun page
    Then I wait urunlerim button element 3 seconds at index 1
    And I click element: urunlerim button at index 1

    And I enter 1. IMEI number from generated IMEI list to urun arama at index 1
    Then I wait urun Stokda Yok Close element 3 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1
    And I clear text to urun arama at index 1

    And I enter 2. IMEI number from generated IMEI list to urun arama at index 1
    Then I wait urun Stokda Yok Close element 3 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1
    And I clear text to urun arama at index 1

    And I enter 3. IMEI number from generated IMEI list to urun arama at index 1
    Then I wait urun Stokda Yok Close element 3 seconds at index 1
    And I click element: urun Stokda Yok Close at index 1
    And I clear text to urun arama at index 1

    # işlem bitti çıkış yap.
    And I logout the system