Feature: Katalog_UrunOzelligiEkleSil

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
  Scenario: Katalog_UrunOzelligiEkleSil

    #stokListesi ekranından ürün ekleme ekranına git
    Given I see stokListesi page
    And I wait urunEkle element 1 seconds at index 1
    And I click element: urunEkle at index 1

    #stokKartEkle ekranında her ürün özelliği için ekle ve sil
    Given I see stokKartEkle page
    When I wait StokKartEkleBaslik element 1 seconds at index 1
    #segment ekle sil
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 1
    And I click element: stokKartEkleEkraniButonlari at index 1
    And I wait yeniSegmentInputAlani element 1 seconds at index 1
    And I enter "testSegment" text to yeniSegmentInputAlani at index 1
    And I wait ekleButon element 1 seconds at index 2
    And I click element: ekleButon at index 2
    And I need to just wait
    And I wait segmentSecimi element 1 seconds at index 1
    And I click element: segmentSecimi at index 1
    And I wait testSegment element 1 seconds at index 1
    And I click element: testSegment at index 1
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 3
    And I click element: stokKartEkleEkraniButonlari at index 3
    And I wait tamamButonu element 1 seconds at index 1
    And I click element: tamamButonu at index 1

    #kategori ekle sil
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 2
    And I click element: stokKartEkleEkraniButonlari at index 2
    And I wait yeniKategoriInputAlani element 1 seconds at index 1
    And I enter "testKategori" text to yeniKategoriInputAlani at index 1
    And I wait ekleButon element 1 seconds at index 2
    And I click element: ekleButon at index 2
    And I need to just wait
    And I wait kategoriSecimi element 1 seconds at index 1
    And I click element: kategoriSecimi at index 1
    And I wait testKategori element 1 seconds at index 1
    And I click element: testKategori at index 1
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 4
    And I click element: stokKartEkleEkraniButonlari at index 4
    And I wait tamamButonu element 1 seconds at index 1
    And I click element: tamamButonu at index 1

    #kategori seçili olmalı yoksa marka seçemem
    And I wait kategoriSecimi element 1 seconds at index 1
    And I click element: kategoriSecimi at index 1
    And I wait PHONE element 1 seconds at index 1
    And I click element: PHONE at index 1

    #marka ekle sil
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 5
    And I click element: stokKartEkleEkraniButonlari at index 5
    And I wait yeniMarkaInputAlani element 1 seconds at index 1
    And I enter "testMarka" text to yeniMarkaInputAlani at index 1
    And I wait tedarikciSecme element 1 seconds at index 1
    And I click element: tedarikciSecme at index 1
    And I wait brightStar element 1 seconds at index 1
    And I click element: brightStar at index 1
    And I press TAB button
    And I wait addButon element 1 seconds at index 1
    And I click element: addButon at index 1
    And I need to just wait
    And I wait markaSecimi element 1 seconds at index 1
    And I click element: markaSecimi at index 1
    And I wait testMarka element 1 seconds at index 1
    And I click element: testMarka at index 1
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 7
    And I click element: stokKartEkleEkraniButonlari at index 7
    And I wait tamamButonu element 1 seconds at index 1
    And I click element: tamamButonu at index 1

    #marka seçili olmalı yoksa model seçemem
    And I wait markaSecimi element 1 seconds at index 1
    And I click element: markaSecimi at index 1
    And I wait Apple element 1 seconds at index 1
    And I click element: Apple at index 1

    #model ekle sil
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 8
    And I click element: stokKartEkleEkraniButonlari at index 8
    And I wait yeniModelInputAlani element 1 seconds at index 1
    And I enter "testModel" text to yeniModelInputAlani at index 1
    And I wait ekleButon element 1 seconds at index 2
    And I click element: ekleButon at index 2
    And I need to just wait
    And I wait modelSecimi element 1 seconds at index 1
    And I click element: modelSecimi at index 1
    And I wait testModel element 1 seconds at index 1
    And I click element: testModel at index 1
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 10
    And I click element: stokKartEkleEkraniButonlari at index 10
    And I wait tamamButonu element 1 seconds at index 1
    And I click element: tamamButonu at index 1

    #varyant tipi ve varyant ekle sil
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 13
    And I click element: stokKartEkleEkraniButonlari at index 13
    And I wait yeniVaryantTipiInputAlani element 1 seconds at index 1
    And I enter "testVaryantTipi" text to yeniVaryantTipiInputAlani at index 1
    And I wait ekleButon element 1 seconds at index 2
    And I click element: ekleButon at index 2
    And I need to just wait
    And I wait varyantTipiSecimi element 1 seconds at index 1
    And I click element: varyantTipiSecimi at index 1
    And I wait testVaryantTipi element 1 seconds at index 1
    And I click element: testVaryantTipi at index 1
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 16
    And I click element: stokKartEkleEkraniButonlari at index 16
    And I wait yeniVaryantInputAlani element 1 seconds at index 1
    And I enter "testVaryant" text to yeniVaryantInputAlani at index 1
    And I wait ekleButon element 1 seconds at index 2
    And I click element: ekleButon at index 2
    And I wait varyantSecimi element 1 seconds at index 1
    And I click element: varyantSecimi at index 1
    And I wait testVaryant element 1 seconds at index 1
    And I click element: testVaryant at index 1
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 18
    And I click element: stokKartEkleEkraniButonlari at index 18
    And I wait tamamButonu element 1 seconds at index 1
    And I click element: tamamButonu at index 1
    And I wait stokKartEkleEkraniButonlari element 1 seconds at index 15
    And I click element: stokKartEkleEkraniButonlari at index 15
    And I wait tamamButonu element 1 seconds at index 1
    And I click element: tamamButonu at index 1

    #çıkış yap.
    And I logout the back office system