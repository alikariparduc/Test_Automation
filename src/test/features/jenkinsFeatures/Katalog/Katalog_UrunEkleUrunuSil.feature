Feature: Katalog_UrunEkleUrunuSil

  Background: System Login
    Given I control logout with username: "otomasyontest"
    Given Open the url given by jenkins job
    Then I see login page
    And I click element: tedarikciGirisi at index 1
    #And I click element: vodafoneRadioButton at index 1
    Then I enter "otomasyontest" text to username text area at index 1
    Then I enter "bstar" text to password text area at index 1
    And  I wait login button element 5 seconds at index 1
    When I click element: login button at index 1


  #@Stok
  Scenario: Katalog_UrunEkleUrunuSil

    #stokListesi ekranından ürün ekleme ekranına git
    Given I see stokListesi page
    And I wait urunEkle element 1 seconds at index 1
    And I click element: urunEkle at index 1

    #stokKartEkle ekranında ürün bilgilerini gir ve ekle
    Given I see stokKartEkle page
    When I wait StokKartEkleBaslik element 1 seconds at index 1
    And I wait segmentSecimi element 1 seconds at index 1
    And I click element: segmentSecimi at index 1
    And I wait yeniNesil element 1 seconds at index 1
    And I click element: yeniNesil at index 1
    And I wait kategoriSecimi element 1 seconds at index 1
    And I click element: kategoriSecimi at index 1
    And I wait PHONE element 1 seconds at index 1
    And I click element: PHONE at index 1
    And I wait markaSecimi element 1 seconds at index 1
    And I click element: markaSecimi at index 1
    And I wait Apple element 1 seconds at index 1
    And I click element: Apple at index 1
    And I wait modelSecimi element 1 seconds at index 1
    And I click element: modelSecimi at index 1
    And I wait iPhone13Mini element 1 seconds at index 1
    And I click element: iPhone13Mini at index 1
    And I wait vergiTipiSecimi element 1 seconds at index 1
    And I click element: vergiTipiSecimi at index 1
    And I wait KDV element 1 seconds at index 1
    And I click element: KDV at index 1
    And I wait birimTipiSecimi element 1 seconds at index 1
    And I click element: birimTipiSecimi at index 1
    And I wait Adet element 1 seconds at index 1
    And I click element: Adet at index 1
    And I wait varyantTipiSecimi element 1 seconds at index 1
    And I click element: varyantTipiSecimi at index 1
    And I wait HAFIZA element 1 seconds at index 1
    And I click element: HAFIZA at index 1
    And I wait varyantSecimi element 1 seconds at index 1
    And I click element: varyantSecimi at index 1
    And I wait 128GB element 1 seconds at index 1
    And I click element: 128GB at index 1
    And I wait varyantEkleButon element 1 seconds at index 1
    And I click element: varyantEkleButon at index 1
    #And I wait takipliUrunEvetRadioButton element 1 seconds at index 1
    #And I click element: takipliUrunEvetRadioButton at index 1

    And I wait barkodInputAlani element 1 seconds at index 1
    And I click element: barkodInputAlani at index 1
    And I clear text to barkodInputAlani at index 1
    And I enter barkod number to barkodInputAlani at index 1

    And I wait SKUInputAlani element 1 seconds at index 1
    And I click element: SKUInputAlani at index 1
    And I clear text to SKUInputAlani at index 1
    And I enter random SKU to SKUInputAlani at index 1

    And I wait ekleButon element 1 seconds at index 1
    And I scroll to the "ekleButon"
    Then I click element: ekleButon at index 1

    And I wait stokKart element 1 seconds at index 1
    Then I click element: stokKart at index 1

    #ürünü barkodla arayarak eklendiğini kontrol et
    Given I see stokListesi page
    When I wait asagiOkIsimVeyaBarkod element 1 seconds at index 1
    And I click element: asagiOkIsimVeyaBarkod at index 1
    And I wait barkodIleArama element 1 seconds at index 1
    And I click element: barkodIleArama at index 1
    And I wait urunAramaInputAlani element 1 seconds at index 1
    And I click element: urunAramaInputAlani at index 1
    And I clear text to urunAramaInputAlani at index 1
    And I enter barkod number to urunAramaInputAlani at index 1

    #-------burada bir bug var o yüzden farklı bir sayfaya gidip gelip tekrar arama alanına geliyorum-------
    And I see home page
    And I wait simKartHesapCetveli element 1 seconds at index 1
    And I click element: simKartHesapCetveli at index 1
    And I need to just wait
    And I wait stokKart element 1 seconds at index 1
    And I click element: stokKart at index 1
    And I see stokListesi page

    When I wait asagiOkIsimVeyaBarkod element 1 seconds at index 1
    And I click element: asagiOkIsimVeyaBarkod at index 1
    And I wait barkodIleArama element 1 seconds at index 1
    And I click element: barkodIleArama at index 1
    And I wait urunAramaInputAlani element 1 seconds at index 1
    And I click element: urunAramaInputAlani at index 1
    And I clear text to urunAramaInputAlani at index 1
    And I enter barkod number to urunAramaInputAlani at index 1
    And I wait aramaSonucuIlkUrun element 1 seconds at index 1
    And I click element: aramaSonucuIlkUrun at index 1
    #-----------------------------------------------------------------------------------------------------

    #arama sonucu ekranından ürünün doğruluğunu kontol et
    And I wait PHONE element 1 seconds at index 1
    And I wait appleIPhone13Mini128GB element 1 seconds at index 1
    And I wait yeniNesil element 1 seconds at index 1

    #ürünü sil
    And I wait copKutusuIconlari element 1 seconds at index 1
    And I click element: copKutusuIconlari at index 1
    And I wait tamamButonu element 1 seconds at index 1
    And I click element: tamamButonu at index 1

    #ürünü tekrar arayıp bulunamadığını kontrol et
    And I see home page
    And I wait simKartHesapCetveli element 1 seconds at index 1
    And I click element: simKartHesapCetveli at index 1
    And I need to just wait
    And I wait stokKart element 1 seconds at index 1
    And I click element: stokKart at index 1
    And I see stokListesi page

    When I wait asagiOkIsimVeyaBarkod element 1 seconds at index 1
    And I click element: asagiOkIsimVeyaBarkod at index 1
    And I wait barkodIleArama element 1 seconds at index 1
    And I click element: barkodIleArama at index 1
    And I wait urunAramaInputAlani element 1 seconds at index 1
    And I click element: urunAramaInputAlani at index 1
    And I clear text to urunAramaInputAlani at index 1
    And I enter barkod number to urunAramaInputAlani at index 1
    And I wait urunBulunamadi element 1 seconds at index 1

    #çıkış yap.
    And I logout the back office system