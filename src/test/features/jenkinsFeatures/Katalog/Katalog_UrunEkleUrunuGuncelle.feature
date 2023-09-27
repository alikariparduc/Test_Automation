Feature: Katalog_UrunEkleUrunuGuncelle

  Background: System Login
    Given I control logout with username: "otomasyontest"
    Given Open the url given by jenkins job
    Then I see login page
    And I click element: tedarikciGirisi at index 1
    Then I enter "otomasyontest" text to username text area at index 1
    Then I enter "bstar" text to password text area at index 1
    And  I wait login button element 5 seconds at index 1
    When I click element: login button at index 1

  @Stok
  Scenario: Katalog_UrunEkleUrunuGuncelle

    #stokListesi ekranından ürün ekleme ekranına git
    Given I see stokListesi page
    And I wait urunEkle element 3 seconds at index 1
    And I click element: urunEkle at index 1

    #stokKartEkle ekranında ürün bilgilerini gir ve ekle
    Given I see stokKartEkle page
    When I wait StokKartEkleBaslik element 3 seconds at index 1
    And I wait segmentSecimi element 3 seconds at index 1
    And I click element: segmentSecimi at index 1
    And I wait yeniNesil element 3 seconds at index 1
    And I click element: yeniNesil at index 1
    And I wait kategoriSecimi element 3 seconds at index 1
    And I click element: kategoriSecimi at index 1
    And I wait PHONE element 3 seconds at index 1
    And I click element: PHONE at index 1
    And I wait markaSecimi element 3 seconds at index 1
    And I click element: markaSecimi at index 1
    And I wait Apple element 3 seconds at index 1
    And I click element: Apple at index 1
    And I wait modelSecimi element 3 seconds at index 1
    And I click element: modelSecimi at index 1
    And I wait iPhone13Mini element 3 seconds at index 1
    And I click element: iPhone13Mini at index 1
    And I wait vergiTipiSecimi element 3 seconds at index 1
    And I click element: vergiTipiSecimi at index 1
    And I wait KDV element 3 seconds at index 1
    And I click element: KDV at index 1
    And I wait birimTipiSecimi element 3 seconds at index 1
    And I click element: birimTipiSecimi at index 1
    And I wait Adet element 3 seconds at index 1
    And I click element: Adet at index 1
    And I wait varyantTipiSecimi element 3 seconds at index 1
    And I click element: varyantTipiSecimi at index 1
    And I wait HAFIZA element 3 seconds at index 1
    And I click element: HAFIZA at index 1
    And I wait varyantSecimi element 3 seconds at index 1
    And I click element: varyantSecimi at index 1
    And I wait 128GB element 3 seconds at index 1
    And I click element: 128GB at index 1
    And I wait varyantEkleButon element 3 seconds at index 1
    And I click element: varyantEkleButon at index 1
    #And I wait takipliUrunEvetRadioButton element 1 seconds at index 1
    #And I click element: takipliUrunEvetRadioButton at index 1

    And I wait barkodInputAlani element 3 seconds at index 1
    And I click element: barkodInputAlani at index 1
    And I clear text to barkodInputAlani at index 1
    And I enter barkod number to barkodInputAlani at index 1

    And I wait SKUInputAlani element 3 seconds at index 1
    And I click element: SKUInputAlani at index 1
    And I clear text to SKUInputAlani at index 1
    And I enter random SKU to SKUInputAlani at index 1

    And I wait ekleButon element 3 seconds at index 1
    And I scroll to the "ekleButon"
    Then I click element: ekleButon at index 1

    And I wait stokKart element 3 seconds at index 1
    Then I click element: stokKart at index 1

    #ürünü barkodla arayarak eklendiğini kontrol et
    Given I see stokListesi page
    When I wait asagiOkIsimVeyaBarkod element 3 seconds at index 1
    And I click element: asagiOkIsimVeyaBarkod at index 1
    And I wait barkodIleArama element 3 seconds at index 1
    And I click element: barkodIleArama at index 1
    And I wait urunAramaInputAlani element 3 seconds at index 1
    And I click element: urunAramaInputAlani at index 1
    And I clear text to urunAramaInputAlani at index 1
    And I enter barkod number to urunAramaInputAlani at index 1

    #-------burada bir bug var o yüzden farklı bir sayfaya gidip gelip tekrar arama alanına geliyorum-------
    And I see home page
    And I wait simKartHesapCetveli element 3 seconds at index 1
    And I click element: simKartHesapCetveli at index 1
    And I need to just wait
    And I wait stokKart element 3 seconds at index 1
    And I click element: stokKart at index 1
    And I see stokListesi page

    When I wait asagiOkIsimVeyaBarkod element 3 seconds at index 1
    And I click element: asagiOkIsimVeyaBarkod at index 1
    And I wait barkodIleArama element 3 seconds at index 1
    And I click element: barkodIleArama at index 1
    And I wait urunAramaInputAlani element 3 seconds at index 1
    And I click element: urunAramaInputAlani at index 1
    And I clear text to urunAramaInputAlani at index 1
    And I enter barkod number to urunAramaInputAlani at index 1
    And I wait aramaSonucuIlkUrun element 3 seconds at index 1
    And I click element: aramaSonucuIlkUrun at index 1
    #-----------------------------------------------------------------------------------------------------

    #arama sonucu ekranından ürünün doğruluğunu kontrol et
    And I wait PHONE element 3 seconds at index 1
    And I wait appleIPhone13Mini128GB element 3 seconds at index 1
    And I wait yeniNesil element 3 seconds at index 1

    #kaleme tıklayıp ürünü güncelle
    And I wait kalemIconlari element 3 seconds at index 1
    And I click element: kalemIconlari at index 1

    Given I see stokKartEkle page
    When I wait StokKartEkleBaslik element 3 seconds at index 1
    And I wait segmentSecimi element 3 seconds at index 1
    And I click element: segmentSecimi at index 1
    And I wait tabletNotebook element 3 seconds at index 1
    And I click element: tabletNotebook at index 1
    And I wait kategoriSecimi element 3 seconds at index 1
    And I click element: kategoriSecimi at index 1
    And I wait TABLET element 3 seconds at index 1
    And I click element: TABLET at index 1
    And I wait markaSecimi element 3 seconds at index 1
    And I click element: markaSecimi at index 1
    And I wait Lenovo element 3 seconds at index 1
    And I click element: Lenovo at index 1
    And I wait modelSecimi element 3 seconds at index 1
    And I click element: modelSecimi at index 1
    And I wait Clara element 3 seconds at index 1
    And I click element: Clara at index 1
    And I wait varyantSilButonu element 3 seconds at index 1
    And I click element: varyantSilButonu at index 1
    And I wait varyantTipiSecimi element 3 seconds at index 1
    And I click element: varyantTipiSecimi at index 1
    And I wait BATARYA element 3 seconds at index 1
    And I click element: BATARYA at index 1
    And I wait varyantSecimi element 3 seconds at index 1
    And I click element: varyantSecimi at index 1
    And I wait 4500mAh element 3 seconds at index 1
    And I click element: 4500mAh at index 1
    And I wait varyantEkleButon element 3 seconds at index 1
    And I click element: varyantEkleButon at index 1

    And I wait guncelleButon element 3 seconds at index 1
    And I scroll to the "guncelleButon"
    Then I click element: guncelleButon at index 1

    And I wait stokKart element 3 seconds at index 1
    Then I click element: stokKart at index 1
    And I need to just wait

    #ürünü tekrar arayarak güncellendiğini kontrol et
    Given I see stokListesi page
    When I wait asagiOkIsimVeyaBarkod element 3 seconds at index 1
    And I click element: asagiOkIsimVeyaBarkod at index 1
    And I wait barkodIleArama element 3 seconds at index 1
    And I click element: barkodIleArama at index 1
    And I wait urunAramaInputAlani element 3 seconds at index 1
    And I click element: urunAramaInputAlani at index 1
    And I clear text to urunAramaInputAlani at index 1
    And I enter barkod number to urunAramaInputAlani at index 1

    #-------burada bir bug var o yüzden farklı bir sayfaya gidip gelip tekrar arama alanına geliyorum-------
    And I have to refresh the page
    And I see home page
    And I wait simKartHesapCetveli element 3 seconds at index 1
    And I click element: simKartHesapCetveli at index 1
    And I need to just wait
    And I have to refresh the page
    And I wait stokKart element 3 seconds at index 1
    And I click element: stokKart at index 1
    And I see stokListesi page

    When I wait asagiOkIsimVeyaBarkod element 3 seconds at index 1
    And I click element: asagiOkIsimVeyaBarkod at index 1
    And I wait barkodIleArama element 3 seconds at index 1
    And I click element: barkodIleArama at index 1
    And I wait urunAramaInputAlani element 3 seconds at index 1
    And I click element: urunAramaInputAlani at index 1
    And I clear text to urunAramaInputAlani at index 1
    And I enter barkod number to urunAramaInputAlani at index 1
    And I wait aramaSonucuIlkUrun element 3 seconds at index 1
    And I click element: aramaSonucuIlkUrun at index 1
    #-----------------------------------------------------------------------------------------------------

    #arama sonucu ekranından ürünün doğruluğunu kontrol et
    And I wait TABLET element 3 seconds at index 1
    And I wait lenovoClara4500mAh element 3 seconds at index 1
    And I wait tabletNotebook element 3 seconds at index 1

    #çıkış yap.
    And I logout the back office system