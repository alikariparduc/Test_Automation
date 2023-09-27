Feature: Katalog_UrunSiralamasiniDegistirmeKontrolü

  Background: System Login
    #Given I control logout with username: "otomasyontest"
    Given Open the url given by jenkins job
    Then I see login page
    And I click element: tedarikciGirisi at index 1
    And I click element: vodafoneRadioButton at index 1
    Then I enter "otomasyontest" text to username text area at index 1
    Then I enter "bstar" text to password text area at index 1
    And  I wait login button element 5 seconds at index 1
    When I click element: login button at index 1

  #@Stok
  Scenario: Katalog_UrunSiralamasiniDegistirmeKontrolü

    #sırayla sku, kategori, ürün adı, segment, barkod, takipli sütunlarına tıklayarak sıralamanın değiştiğini kontrol et
    Given I see stokListesi page
    When I wait SKU element 1 seconds at index 1
    And I click element: SKU at index 1
    And I wait SKU element 1 seconds at index 1
    And I click element: SKU at index 1

    And I wait kategori element 1 seconds at index 1
    And I click element: kategori at index 1
    And I wait kategori element 1 seconds at index 1
    And I click element: kategori at index 1

    And I wait urunAdi element 1 seconds at index 1
    And I click element: urunAdi at index 1
    And I wait urunAdi element 1 seconds at index 1
    And I click element: urunAdi at index 1

    And I wait segment element 1 seconds at index 1
    And I click element: segment at index 1
    And I wait segment element 1 seconds at index 1
    And I click element: segment at index 1

    And I wait barkod element 1 seconds at index 1
    And I click element: barkod at index 1
    And I wait barkod element 1 seconds at index 1
    And I click element: barkod at index 1

    And I wait takipli element 1 seconds at index 1
    And I click element: takipli at index 1
    And I wait takipli element 1 seconds at index 1
    And I click element: takipli at index 1


    #çıkış yap.
    And I logout the system
