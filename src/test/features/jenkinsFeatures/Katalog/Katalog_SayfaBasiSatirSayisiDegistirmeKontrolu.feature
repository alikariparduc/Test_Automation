Feature: Katalog_SayfaBasiSatirSayisiDegistirmeKontrolu

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
  Scenario: Katalog_SayfaBasiSatirSayisiDegistirmeKontrolu

    #stokListesi'nde 10 tane satır gözüktüğünü kontrol et
    Given I see stokListesi page
    When I wait stokListesiBaslik element 1 seconds at index 1
    And I wait sayfaBasiSatirSayisi element 1 seconds at index 1
    And I control sayfaBasiSatirSayisi element's text is "10" at index 1
    And I wait copKutusuIconlari element 1 seconds at index 1
    And I control copKutusuIconlari element's count is 10 at index 1

    #satır sayısını 25 yapıp kontrol et
    And I wait sayfaBasiSatirSayisi element 1 seconds at index 1
    And I click element: sayfaBasiSatirSayisi at index 1
    And I wait 25sayfaBasiSatirSayisi element 1 seconds at index 1
    And I click element: 25sayfaBasiSatirSayisi at index 1
    And I control sayfaBasiSatirSayisi element's text is "25" at index 1
    And I wait copKutusuIconlari element 1 seconds at index 1
    And I control copKutusuIconlari element's count is 25 at index 1

    #satır sayısını 50 yapıp kontrol et
    And I wait sayfaBasiSatirSayisi element 1 seconds at index 1
    And I click element: sayfaBasiSatirSayisi at index 1
    And I wait 50sayfaBasiSatirSayisi element 1 seconds at index 1
    And I click element: 50sayfaBasiSatirSayisi at index 1
    And I control sayfaBasiSatirSayisi element's text is "50" at index 1
    And I wait copKutusuIconlari element 1 seconds at index 1
    And I control copKutusuIconlari element's count is 50 at index 1

    #satır sayısını 100 yapıp kontrol et
    And I wait sayfaBasiSatirSayisi element 1 seconds at index 1
    And I click element: sayfaBasiSatirSayisi at index 1
    And I wait 100sayfaBasiSatirSayisi element 1 seconds at index 1
    And I click element: 100sayfaBasiSatirSayisi at index 1
    And I control sayfaBasiSatirSayisi element's text is "100" at index 1
    And I wait copKutusuIconlari element 1 seconds at index 1
    And I control copKutusuIconlari element's count is 100 at index 1


    #çıkış yap.
    And I logout the back office system