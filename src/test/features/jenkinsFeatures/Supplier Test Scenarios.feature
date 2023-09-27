Feature: Supplier Test Scenarios


  Scenario Outline: Siparisin Teslimat Siparisleri Ekraninda Irsaliye No'ya Gore Aratılabilmesi
    Given I control logout with username: <username>
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with "POST".
    And I login the system with username <username> and password <password>

    When I see siparisler page
    And I wait siparisler button element 3 seconds at index 1
    And I click element: siparisler button at index 1
    And I wait teslimatSiparisleriBTN element 3 seconds at index 1
    And I click element: teslimatSiparisleriBTN at index 1
    And I wait teslimatSiparisleriEkraniBasligi element 3 seconds at index 1
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1
    Then I wait teslimatSiparisleriOnayBeklyr element 3 seconds at index 1
    And I logout the system

    Examples:
      | username           | password   | storeCode |
      | "DealerAKirklar5"  | "Voda1234" | "W000800" |
      | "DealerGTokmak4"   | "Voda1234" | "S324400" |

  Scenario Outline: Sipariş Geldiğinde Dashboard Ekranında Onay Bekleyen Siparişlerim Sayısının Artması
    Given I login the system with username <username> and password <password>
    And I see ozet page
    And I wait ozet button element 10 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniOnayBekleyenSiparisler element 10 seconds at index 1
    And I  get Dashboard Stock Value ozetEkraniOnayBekleyenSiparisler

    When I control logout with username: <username>
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with "POST".

    Then I wait for dashboard to update
    And I see ozet page
    And I wait ozet button element 3 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniOnayBekleyenSiparisler element 3 seconds at index 1
    And I verify Dashboard Value: ozetEkraniOnayBekleyenSiparisler at addCount 1

    Examples:
      | username           | password   | storeCode |
      | "DealerECanbolat"  | "Voda1234" | "W075300" |
      | "DealerGTokmak4"   | "Voda1234" | "S324400" |

  Scenario Outline: Siparisin Onaylanarak Ürünlerin Stoğa Alınması
    Given I control logout with username: <username>
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with "POST".

    When I login the system with username <username> and password <password>
    And I wait for dashboard to update
    And I see ozet page
    And I wait ozet button element 10 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniOnayBekleyenSiparisler element 10 seconds at index 1
    And I  get Dashboard Stock Value ozetEkraniOnayBekleyenSiparisler

    #teslimat siparisleri ekranına git
    And I see siparisler page
    And I wait siparisler button element 3 seconds at index 1
    Then I click element: siparisler button at index 1
    And I wait teslimatSiparisleriBTN element 3 seconds at index 1
    Then I click element: teslimatSiparisleriBTN at index 1
    And I wait teslimatSiparisleriEkraniBasligi element 3 seconds at index 1
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1

    #siparişi onayla
    And I wait teslimatSiparisleriOnayBeklyr element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnayBeklyr at index 1
    And I wait teslimatSiparisleriIncele element 3 seconds at index 1
    Then I click element: teslimatSiparisleriIncele at index 1
    And I wait aciklamaInputAlani element 3 seconds at index 1
    Then I click element: aciklamaInputAlani at index 1
    Then I enter "Açıklama alanı test" text to aciklamaInputAlani at index 1
    And I wait teslimatSiparisleriOnayla element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnayla at index 1
    And I wait teslimatSiparisleriOnayla element 3 seconds at index 2
    Then I click element: teslimatSiparisleriOnayla at index 2

    #siparişin onaylandığını gör
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1
    And I wait teslimatSiparisleriOnaylandi element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnaylandi at index 1

    #ürünlerin eklendiğini gör
    And I see urun page
    And I wait urun button element 3 seconds at index 1
    Then I click element: urun button at index 1
    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1
    Then I enter a Supplier IMEI1 fromGlobal to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I clear text to urun arama at index 1
    Then I enter a Supplier IMEI2 fromGlobal to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I clear text to urun arama at index 1
    Then I enter a Supplier IMEI3 fromGlobal to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I clear text to urun arama at index 1
    Then I enter a Supplier IMEI4 fromGlobal to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I clear text to urun arama at index 1

    #dashboard ekranında onay bekleyen siparişlerimin azaldığını gör///
    Then I wait for dashboard to update
    And I see ozet page
    And I wait ozet button element 3 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniOnayBekleyenSiparisler element 3 seconds at index 1
    And I verify Dashboard Value: ozetEkraniOnayBekleyenSiparisler at deleteCount 1

    And I logout the system

    Examples:
      | username           | password   | storeCode |
      | "DealerAKirklar5"  | "Voda1234" | "W000800" |
      | "DealerGTokmak4"   | "Voda1234" | "S324400" |

  Scenario Outline: Siparisin Reddedilmesi / Sorun Bildirilmesi
    Given I control logout with username: <username>
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with "POST".

    When I login the system with username <username> and password <password>
    And I wait for dashboard to update
    And I see ozet page
    And I wait ozet button element 10 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniOnayBekleyenSiparisler element 10 seconds at index 1
    And I  get Dashboard Stock Value ozetEkraniOnayBekleyenSiparisler

    #teslimat siparisleri ekranına git
    And I see siparisler page
    And I wait siparisler button element 3 seconds at index 1
    Then I click element: siparisler button at index 1
    And I wait teslimatSiparisleriBTN element 3 seconds at index 1
    Then I click element: teslimatSiparisleriBTN at index 1
    And I wait teslimatSiparisleriEkraniBasligi element 3 seconds at index 1
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1

    #sipariş ile ilgili sorun bildir
    And I wait teslimatSiparisleriOnayBeklyr element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnayBeklyr at index 1
    And I wait teslimatSiparisleriIncele element 3 seconds at index 1
    Then I click element: teslimatSiparisleriIncele at index 1
    And I wait aciklamaInputAlani element 3 seconds at index 1
    Then I click element: aciklamaInputAlani at index 1
    Then I enter "Siparis iptal test" text to aciklamaInputAlani at index 1
    And I wait sorunBildirBtn element 3 seconds at index 1
    Then I click element: sorunBildirBtn at index 1
    And I wait sorunSecimi element 3 seconds at index 1
    Then I click element: sorunSecimi at index 1
    And I wait digerNedenler element 3 seconds at index 1
    Then I click element: digerNedenler at index 1
    And I wait sorunBildirBtn element 3 seconds at index 2
    Then I click element: sorunBildirBtn at index 2

    #siparişin iptal edildiğini gör
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1
    And I wait teslimatSiparisleriIptalEdildi element 3 seconds at index 1
    Then I click element: teslimatSiparisleriIptalEdildi at index 1

    #ürünlerin eklenmediğini gör
    And I see urun page
    And I wait urun button element 3 seconds at index 1
    Then I click element: urun button at index 1
    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1
    Then I enter a Supplier IMEI1 fromGlobal to urun arama at index 1
    Then I wait urun Stokda Yok element 3 seconds at index 1
    Then I clear text to urun arama at index 1
    Then I enter a Supplier IMEI2 fromGlobal to urun arama at index 1
    Then I wait urun Stokda Yok element 3 seconds at index 1
    Then I clear text to urun arama at index 1
    Then I enter a Supplier IMEI3 fromGlobal to urun arama at index 1
    Then I wait urun Stokda Yok element 3 seconds at index 1
    Then I clear text to urun arama at index 1
    Then I enter a Supplier IMEI4 fromGlobal to urun arama at index 1
    Then I wait urun Stokda Yok element 3 seconds at index 1
    Then I clear text to urun arama at index 1

    #dashboard ekranında onay bekleyen siparişlerimin azaldığını gör
    Then I wait for dashboard to update
    And I see ozet page
    And I wait ozet button element 3 seconds at index 1
    And I click element: ozet button at index 1
    And I wait ozetEkraniOnayBekleyenSiparisler element 3 seconds at index 1
    And I verify Dashboard Value: ozetEkraniOnayBekleyenSiparisler at deleteCount 1

    And I logout the system

    Examples:
      | username           | password   | storeCode |
      | "DealerAKirklar5"  | "Voda1234" | "W000800" |
      | "DealerGTokmak4"   | "Voda1234" | "S324400" |

  Scenario Outline: Sipariş Reddedilme Alanında Açıklama Alanının Zorunlu Alan Olması Kontrolü
    Given I control logout with username: <username>
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with "POST".
    When I login the system with username <username> and password <password>

    #teslimat siparisleri ekranına git
    And I see siparisler page
    And I wait siparisler button element 3 seconds at index 1
    Then I click element: siparisler button at index 1
    And I wait teslimatSiparisleriBTN element 3 seconds at index 1
    Then I click element: teslimatSiparisleriBTN at index 1
    And I wait teslimatSiparisleriEkraniBasligi element 3 seconds at index 1
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1

    #ilgili alanların zorunlu olduğunu kontrol et
    And I wait teslimatSiparisleriOnayBeklyr element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnayBeklyr at index 1
    And I wait teslimatSiparisleriIncele element 3 seconds at index 1
    Then I click element: teslimatSiparisleriIncele at index 1

    And I wait sorunBildirBtn element 3 seconds at index 1
    Then I click element: sorunBildirBtn at index 1
    And I wait lutfenAciklamaAlaniniDoldurun element 3 seconds at index 1
    And I wait aciklamaInputAlani element 3 seconds at index 1
    Then I click element: aciklamaInputAlani at index 1
    Then I enter "Siparis iptal test" text to aciklamaInputAlani at index 1
    And I wait sorunBildirBtn element 3 seconds at index 1
    Then I click element: sorunBildirBtn at index 1

    And I wait sorunBildirBtn element 3 seconds at index 2
    Then I click element: sorunBildirBtn at index 2
    And I wait lutfenBirSiparisSorunuSeciniz element 3 seconds at index 1
    And I wait sorunSecimi element 3 seconds at index 1
    Then I click element: sorunSecimi at index 1
    And I wait digerNedenler element 3 seconds at index 1
    Then I click element: digerNedenler at index 1
    And I wait sorunBildirBtn element 3 seconds at index 2
    Then I click element: sorunBildirBtn at index 2

    And I logout the system

    Examples:
      | username           | password   | storeCode |
      | "DealerAKirklar5"  | "Voda1234" | "W000800" |
      | "DealerGTokmak4"   | "Voda1234" | "S324400" |


  Scenario Outline: Siparişin Otomatik Onaylanması ve Ürünlerin Stoğa Alınması
    Given I control logout with username: <username>
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with "POST".
    When I login the system with username <username> and password <password>

    #teslimat siparisleri ekranına git
    And I see siparisler page
    And I wait siparisler button element 3 seconds at index 1
    Then I click element: siparisler button at index 1
    And I wait teslimatSiparisleriBTN element 3 seconds at index 1
    Then I click element: teslimatSiparisleriBTN at index 1
    And I wait teslimatSiparisleriEkraniBasligi element 3 seconds at index 1
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1
    And I wait teslimatSiparisleriOnayBeklyr element 3 seconds at index 1

    #siparişin gönderildiği tarihi değiştir ve otomatik onaylanması için bekle
    And I change the created date of the delivery order
    And I wait to accept the delivery automatically
    And I have to refresh the page
    And I need to just wait
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1
    And I wait onaylayanPersonelAuto element 3 seconds at index 1
    And I wait teslimatSiparisleriOnaylandi element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnaylandi at index 1

    #ürünlerin eklendiğini gör
    And I see urun page
    And I wait urun button element 3 seconds at index 1
    Then I click element: urun button at index 1
    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1
    Then I enter a Supplier IMEI1 fromGlobal to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I clear text to urun arama at index 1
    Then I enter a Supplier IMEI2 fromGlobal to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I clear text to urun arama at index 1
    Then I enter a Supplier IMEI3 fromGlobal to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I clear text to urun arama at index 1
    Then I enter a Supplier IMEI4 fromGlobal to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I clear text to urun arama at index 1

    And I logout the system

    Examples:
      | username           | password   | storeCode |
      | "DealerGTokmak4"   | "Voda1234" | "S324400" |


  Scenario Outline: Stokta Olan IMEI İçeren Siparişin Teslimat Siparişleri Ekranında Stok Hatası Olarak Gözükmesi
    Given I control logout with username: <username>
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with in-stock IMEI with "POST".
    When I login the system with username <username> and password <password>

    #teslimat siparisleri ekranına git
    And I see siparisler page
    And I wait siparisler button element 3 seconds at index 1
    Then I click element: siparisler button at index 1
    And I wait teslimatSiparisleriBTN element 3 seconds at index 1
    Then I click element: teslimatSiparisleriBTN at index 1
    And I wait teslimatSiparisleriEkraniBasligi element 3 seconds at index 1
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1

    #stokhatası olduğunu kontrol et
    And I wait teslimatSiparisleriStokHatasiVar element 3 seconds at index 1
    Then I click element: teslimatSiparisleriStokHatasiVar at index 1
    And I wait teslimatSiparisleriIncele element 3 seconds at index 1
    Then I click element: teslimatSiparisleriIncele at index 1
    And I wait imeilerKullanilmisVeyaStoklardaUyarisi element 3 seconds at index 1
    And I verify the area teslimatSiparisleriOnayla by read only at index 1
    And I verify the area sorunBildirBtn by read only at index 1

    And I logout the system

    Examples:
      | username           | password    | storeCode   |
      | "DealerAKirklar5"  | "Voda1234"  | "W000800"   |
      | "DealerGTokmak4"   | "Voda1234"  | "S324400"   |


  Scenario Outline: Stokta Olan ve Olmayan IMEI İçeren Siparişin Onaylanması ve Doğru Ürünlerin İçeri Alınması
    Given I control logout with username: <username>
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with in-stock and non-stock IMEI with "POST".
    When I login the system with username <username> and password <password>

    #teslimat siparisleri ekranına git
    And I see siparisler page
    And I wait siparisler button element 3 seconds at index 1
    Then I click element: siparisler button at index 1
    And I wait teslimatSiparisleriBTN element 3 seconds at index 1
    Then I click element: teslimatSiparisleriBTN at index 1
    And I wait teslimatSiparisleriEkraniBasligi element 3 seconds at index 1
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1

    #siparişi onayla
    And I wait teslimatSiparisleriOnayBeklyr element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnayBeklyr at index 1
    And I wait teslimatSiparisleriIncele element 3 seconds at index 1
    Then I click element: teslimatSiparisleriIncele at index 1
    And I wait imeilerKullanilmisVeyaStoklardaUyarisi element 3 seconds at index 1
    And I wait aciklamaInputAlani element 3 seconds at index 1
    Then I click element: aciklamaInputAlani at index 1
    Then I enter "Açıklama alanı test" text to aciklamaInputAlani at index 1
    And I wait teslimatSiparisleriOnayla element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnayla at index 1
    And I wait teslimatSiparisleriOnayla element 3 seconds at index 2
    Then I click element: teslimatSiparisleriOnayla at index 2

    #siparişin onaylandığını gör
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1
    And I wait teslimatSiparisleriOnaylandi element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnaylandi at index 1

    #doğru ürünlerin eklendiğini gör
    And I see urun page
    And I wait urun button element 3 seconds at index 1
    Then I click element: urun button at index 1
    And I wait urunlerim button element 3 seconds at index 1
    Then I click element: urunlerim button at index 1
    Then I enter a Supplier IMEI1 fromGlobal to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I clear text to urun arama at index 1
    Then I enter a Supplier IMEI2 fromGlobal to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I clear text to urun arama at index 1
    Then I enter a Supplier IMEI3 fromGlobal to urun arama at index 1
    Then I click element: serch1 at index 1
    Then I clear text to urun arama at index 1
    Then I enter a Supplier IMEI4 fromGlobal to urun arama at index 1
    Then I wait urunStokdaYokSatildi element 5 seconds at index 1

    And I logout the system

    Examples:
      | username           | password    | storeCode   |
      | "DealerECanbolat"  | "Voda1234"  | "W075300"   |
      | "DealerGTokmak4"   | "Voda1234"  | "S324400"   |

  Scenario Outline: Sipariş İçerisinde Aynı Barkoda Ait Aynı İmeilerin Gönderilmesi ve Hata Alınması
    Given I control logout with username: <username>
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with duplicate IMEIs under same barcode with "POST".

    Examples:
      | username           | password    | storeCode   |
      | "DealerGTokmak4"   | "Voda1234"  | "S324400"   |


  Scenario Outline: Sipariş İçerisinde Farklı Barkoda Ait Aynı İmeilerin Gönderilmesi ve Hata Alınması
    Given I control logout with username: <username>
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with duplicate IMEIs under different barcodes with "POST".

    Examples:
      | username           | password    | storeCode   |
      | "DealerECanbolat"  | "Voda1234"  | "W075300"   |


  Scenario Outline: Sipariş İçerisinde Tanımlı Olmayan Barkoda Ait Ürün Olması
    Given I control logout with username: <username>
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with non-existent barcode <barcode> with "POST".

    Examples:
      | username           | password    | storeCode   | barcode       |
      | "DealerGTokmak4"   | "Voda1234"  | "S324400"   | "DOESNTEXIST" |



  Scenario Outline: Sipariş İçerisinde Tanımlı Olmayan SKU'ya Ait Ürün Olması
    Given I control logout with username: <username>
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with non-existent barcode <sku> with "POST".

    Examples:
      | username           | password    | storeCode   |     sku       |
      | "DealerECanbolat"  | "Voda1234"  | "W075300"   | "DOESNTEXIST" |

  Scenario Outline: Sipariş İçerisindeki SKU'nun Barkod ile Eşleşmemesi
    Given I control logout with username: <username>
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with barcode <barcode> and non-matching sku <sku> with "POST".

    Examples:
      | username           | password    | storeCode   |     barcode        |     sku      |
      | "DealerECanbolat"  | "Voda1234"  | "W075300"   |  "8806092114388"   |  "AL0034"   |


  Scenario Outline: Sipariş İçerisindeki IMEI'nin 15 Karakterden Farklı Olması
    Given I control logout with username: <username>
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with invalid IMEI <IMEI> with "POST".

    Examples:
      | username           | password    | storeCode   |     IMEI            |
      | "DealerECanbolat"  | "Voda1234"  | "W075300"   | "93828392103948"    |
      | "DealerECanbolat"  | "Voda1234"  | "W075300"   | "9382839210394800"  |

  Scenario Outline: Daha Önce Kullanılmış Receipt No ve Versiyon No ile Sipariş Gönderildiğinde Hata Alınması
    Given I control logout with username: <username>
    And I get and save an old receipt no and its version number from database
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with existent receipt no and version no with "POST".

    Examples:
      | username           | password    | storeCode   |
      | "DealerECanbolat"  | "Voda1234"  | "W075300"   |

  #@Test
  Scenario Outline: Daha Önce Kullanılmış Receipt No'nun Farklı Versiyon No ile Gönderilmesi ve Başarılı Olması
    Given I control logout with username: <username>
    And Get Token With username <username> and password <password> with "POST".
    And Send order for storeCode <storeCode> with "POST".

    When I login the system with username <username> and password <password>

    #teslimat siparisleri ekranına git
    And I see siparisler page
    And I wait siparisler button element 3 seconds at index 1
    Then I click element: siparisler button at index 1
    And I wait teslimatSiparisleriBTN element 3 seconds at index 1
    Then I click element: teslimatSiparisleriBTN at index 1
    And I wait teslimatSiparisleriEkraniBasligi element 3 seconds at index 1
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1

    #siparişi onayla
    And I wait teslimatSiparisleriOnayBeklyr element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnayBeklyr at index 1
    And I wait teslimatSiparisleriIncele element 3 seconds at index 1
    Then I click element: teslimatSiparisleriIncele at index 1
    And I wait aciklamaInputAlani element 3 seconds at index 1
    Then I click element: aciklamaInputAlani at index 1
    Then I enter "Açıklama alanı test" text to aciklamaInputAlani at index 1
    And I wait teslimatSiparisleriOnayla element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnayla at index 1
    And I wait teslimatSiparisleriOnayla element 3 seconds at index 2
    Then I click element: teslimatSiparisleriOnayla at index 2
    And I have to refresh the page
    And I need to just wait

    #siparişin onaylandığını gör
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1
    And I wait teslimatSiparisleriOnaylandi element 3 seconds at index 1

    #aynı receipt no ve farklı versiyon no ile tekrar sipariş gönder
    And Send order for storeCode <storeCode> with existent receipt no and different version no with "POST".
    And I have to refresh the page
    And I need to just wait

    #teslimat siparisleri ekranına git

    And I see siparisler page
    And I wait siparisler button element 3 seconds at index 1
    Then I click element: siparisler button at index 1
    And I wait teslimatSiparisleriBTN element 3 seconds at index 1
    Then I click element: teslimatSiparisleriBTN at index 1
    And I wait teslimatSiparisleriEkraniBasligi element 3 seconds at index 1
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1

    #siparişi onayla
    And I wait teslimatSiparisleriOnayBeklyr element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnayBeklyr at index 1
    And I wait teslimatSiparisleriIncele element 3 seconds at index 1
    Then I click element: teslimatSiparisleriIncele at index 1
    And I wait aciklamaInputAlani element 3 seconds at index 1
    Then I click element: aciklamaInputAlani at index 1
    Then I enter "Açıklama alanı test" text to aciklamaInputAlani at index 1
    And I wait teslimatSiparisleriOnayla element 3 seconds at index 1
    Then I click element: teslimatSiparisleriOnayla at index 1
    And I wait teslimatSiparisleriOnayla element 3 seconds at index 2
    Then I click element: teslimatSiparisleriOnayla at index 2
    And I have to refresh the page
    And I need to just wait

    #siparişin onaylandığını gör
    And I clear text to teslimatSiparisleriIrsaliyeArama at index 1
    And I enter a Supplier no fromGlobal to teslimatSiparisleriIrsaliyeArama at index 1
    And I wait teslimatSiparisleriOnaylandi element 3 seconds at index 1
    And I wait ikinciSiparisVersiyonNo element 3 seconds at index 1

    And I logout the system

    Examples:
      | username           | password    | storeCode   |
      | "DealerECanbolat"  | "Voda1234"  | "W075300"   |
      | "DealerAKirklar5"  | "Voda1234"  | "W000800"   |