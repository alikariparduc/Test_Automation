Feature: Katalog_HataliUrunEkle

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
  Scenario: Katalog_HataliUrunEkle

    #stokListesi ekranından ürün ekleme ekranına git
    Given I see stokListesi page
    And I wait urunEkle element 1 seconds at index 1
    And I click element: urunEkle at index 1

    #stokKartEkle ekranında varolan barkod bilgisi ve sku ile ürün ekle, hataları gör
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
    And I enter "9340102400614D" text to barkodInputAlani at index 1

    And I wait SKUInputAlani element 1 seconds at index 1
    And I click element: SKUInputAlani at index 1
    And I clear text to SKUInputAlani at index 1
    And I enter "IPH0330D" text to SKUInputAlani at index 1

    And I wait ekleButon element 1 seconds at index 1
    And I scroll to the "ekleButon"
    Then I click element: ekleButon at index 1
    And I wait barkodVarUyarisi element 1 seconds at index 1
    Then I click element: closeBtn at index 1

    And I wait barkodInputAlani element 1 seconds at index 1
    And I click element: barkodInputAlani at index 1
    And I clear text to barkodInputAlani at index 1
    And I enter barkod number to barkodInputAlani at index 1

    And I wait ekleButon element 1 seconds at index 1
    And I scroll to the "ekleButon"
    Then I click element: ekleButon at index 1
    And I wait stokKoduVarUyarisi element 1 seconds at index 1
    Then I click element: closeBtn at index 1

    #çıkış yap.
    And I logout the back office system