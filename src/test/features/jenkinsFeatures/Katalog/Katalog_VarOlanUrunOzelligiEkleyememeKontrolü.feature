Feature: Katalog_VarOlanUrunOzelligiEkleyememeKontrolü

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
  Scenario: Katalog_VarOlanUrunOzelligiEkleyememeKontrolü

    #stokListesi ekranından ürün ekleme ekranına git
    Given I see stokListesi page
    And I wait urunEkle element 1 seconds at index 1
    And I click element: urunEkle at index 1

    #stokKartEkle ekranında her ürün özelliği için var olan bir özellik eklemeyi dene ve hatayı gör
    Given I see stokKartEkle page
    When I wait StokKartEkleBaslik element 1 seconds at index 1

    #segment
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 1
    And I click element: stokKartEkleEkraniButonlari at index 1
    And I wait yeniSegmentInputAlani element 1 seconds at index 1
    And I enter "Yeni Nesil" text to yeniSegmentInputAlani at index 1
    And I wait ekleButon element 1 seconds at index 2
    And I click element: ekleButon at index 2
    And I wait segmentZatenVarUyari element 1 seconds at index 1
    And I click element: closeBtn at index 1


    #kategori
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 2
    And I click element: stokKartEkleEkraniButonlari at index 2
    And I wait yeniKategoriInputAlani element 1 seconds at index 1
    And I enter "PHONE" text to yeniKategoriInputAlani at index 1
    And I wait ekleButon element 1 seconds at index 2
    And I click element: ekleButon at index 2
    And I wait kategoriZatenVarUyari element 1 seconds at index 1
    And I click element: closeBtn at index 1
    #kategori seçili olmalı yoksa marka ekleyemem
    And I wait kategoriSecimi element 1 seconds at index 1
    And I click element: kategoriSecimi at index 1
    And I wait PHONE element 1 seconds at index 1
    And I click element: PHONE at index 1

    #marka
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 5
    And I click element: stokKartEkleEkraniButonlari at index 5
    And I wait yeniMarkaInputAlani element 1 seconds at index 1
    And I enter "Apple" text to yeniMarkaInputAlani at index 1
    And I wait tedarikciSecme element 1 seconds at index 1
    And I click element: tedarikciSecme at index 1
    And I wait brightStar element 1 seconds at index 1
    And I click element: brightStar at index 1
    And I press TAB button
    And I wait addButon element 1 seconds at index 1
    And I click element: addButon at index 1
    And I wait markaZatenVarUyari element 1 seconds at index 1
    And I click element: closeBtn at index 1
    #marka seçili olmalı yoksa model ekleyemem
    And I wait markaSecimi element 1 seconds at index 1
    And I click element: markaSecimi at index 1
    And I wait Apple element 1 seconds at index 1
    And I click element: Apple at index 1

    #model
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 8
    And I click element: stokKartEkleEkraniButonlari at index 8
    And I wait yeniModelInputAlani element 1 seconds at index 1
    And I enter "iPhone 13 Mini" text to yeniModelInputAlani at index 1
    And I wait ekleButon element 1 seconds at index 2
    And I click element: ekleButon at index 2
    And I wait modelZatenVarUyari element 1 seconds at index 1
    And I click element: closeBtn at index 1

    #varyant tipi ve varyant
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 13
    And I click element: stokKartEkleEkraniButonlari at index 13
    And I wait yeniVaryantTipiInputAlani element 1 seconds at index 1
    And I enter "HAFIZA" text to yeniVaryantTipiInputAlani at index 1
    And I wait ekleButon element 1 seconds at index 2
    And I click element: ekleButon at index 2
    And I wait varyantTipiZatenVarUyari element 1 seconds at index 1
    And I click element: closeBtn at index 1

    And I wait varyantTipiSecimi element 1 seconds at index 1
    And I click element: varyantTipiSecimi at index 1
    And I wait HAFIZA element 1 seconds at index 1
    And I click element: HAFIZA at index 1

    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 16
    And I click element: stokKartEkleEkraniButonlari at index 16
    And I wait yeniVaryantInputAlani element 1 seconds at index 1
    And I enter "128GB" text to yeniVaryantInputAlani at index 1
    And I wait ekleButon element 1 seconds at index 2
    And I click element: ekleButon at index 2
    And I wait varyantZatenVarUyari element 1 seconds at index 1
    And I click element: closeBtn at index 1

    #çıkış yap.
    And I logout the back office system