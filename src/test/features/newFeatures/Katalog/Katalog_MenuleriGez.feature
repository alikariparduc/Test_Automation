Feature: Katalog_MenuleriGez

  Background: System Login
    Given I control logout with username: "otomasyontest"
    Given Open the url given by jenkins job
    Then I see login page
    And I click element: tedarikciGirisi at index 1
    And I click element: vodafoneRadioButton at index 1
    Then I enter "otomasyontest" text to username text area at index 1
    Then I enter "bstar" text to password text area at index 1
    And  I wait login button element 5 seconds at index 1
    When I click element: login button at index 1


  #@Stok
  Scenario: Katalog_MenuleriGez

    #stokListesi ekranını kontrol et
    Given I see stokListesi page
    When I wait stokListesiBaslik element 3 seconds at index 1
    And I wait asagiOkIsimVeyaBarkod element 3 seconds at index 1
    And I click element: asagiOkIsimVeyaBarkod at index 1
    And I wait isimIleArama element 3 seconds at index 1
    And I wait barkodIleArama element 3 seconds at index 1
    And I click element: barkodIleArama at index 1
    And I wait urunAramaInputAlani element 3 seconds at index 1
    And I wait urunEkle element 3 seconds at index 1
    And I wait SKU element 3 seconds at index 1
    And I wait kategori element 3 seconds at index 1
    And I wait urunAdi element 3 seconds at index 1
    And I wait segment element 3 seconds at index 1
    And I wait barkod element 3 seconds at index 1
    And I wait takipli element 3 seconds at index 1
    Then I click element: urunEkle at index 1


    #stokKartEkle (ürün ekleye basıp o ekranı kontrol et)
    Given I see stokKartEkle page
    When I wait StokKartEkleBaslik element 3 seconds at index 1
    And I wait segmentSecimi element 3 seconds at index 1
    And I wait kategoriSecimi element 3 seconds at index 1
    And I wait markaSecimi element 3 seconds at index 1
    And I wait modelSecimi element 3 seconds at index 1
    And I wait vergiTipiSecimi element 3 seconds at index 1
    And I wait birimTipiSecimi element 3 seconds at index 1
    And I wait varyantTipiSecimi element 3 seconds at index 1
    And I wait varyantSecimi element 3 seconds at index 1
    And I wait varyantEkleButon element 3 seconds at index 1
    And I wait takipliUrunEvetRadioButton element 3 seconds at index 1
    And I wait barkodInputAlani element 3 seconds at index 1
    And I wait SKUInputAlani element 3 seconds at index 1
    And I wait ekleButon element 3 seconds at index 1
    And I wait geriButonu element 3 seconds at index 1
    Then I click element: geriButonu at index 1

    And I see home page
    And I wait simKartHesapCetveli element 3 seconds at index 1
    And I click element: simKartHesapCetveli at index 1


    #sim kart hesap cetveli ekranını kontrol et
    Given I see simKartHesapCetveli page
    When I wait simKartHesapCetveliBaslik element 3 seconds at index 1
    And I wait tarihAlanlari element 3 seconds at index 1
    And I wait takvimButonlari element 3 seconds at index 1
    And I wait tarihAlanlari element 3 seconds at index 2
    And I wait takvimButonlari element 3 seconds at index 2
    And I wait durum element 3 seconds at index 1
    And I wait dosyaAdi element 3 seconds at index 1
    And I wait durumMesaji element 3 seconds at index 1
    And I wait yuklemeTarihi element 3 seconds at index 1
    And I wait baslangicTarihi element 3 seconds at index 1
    And I wait bitisTarihi element 3 seconds at index 1
    And I wait eylemler element 3 seconds at index 1
    And I wait laptopIcon element 3 seconds at index 1
    And I click element: laptopIcon at index 1
    And I wait tarihAlanlari element 3 seconds at index 3
    And I wait takvimButonlari element 3 seconds at index 3
    And I wait laptopIconIcindekiLaptonIcon element 3 seconds at index 1

    And I have to refresh the page
    Then I see home page
    And I wait bayiBakiyeAltLimitDuzenleme element 3 seconds at index 1
    And I click element: bayiBakiyeAltLimitDuzenleme at index 1
    
    #bayi bakiye alt limit düzenleme ekranını kontrol et
    Given I see bayiBakiyeAltLimitDuzenleme page
    When I wait bayiBakiyeAltLimitDuzenleme element 3 seconds at index 1
    And I wait bayi element 3 seconds at index 1
    And I wait limit element 3 seconds at index 1

    #çıkış yap.
    And I logout the system