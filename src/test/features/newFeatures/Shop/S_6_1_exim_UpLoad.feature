Feature: S_6_1_exim_UpLoad


   Background: System Login
     Given I control logout with username: "DealerSHezer"
    Given Open the url given by jenkins job
    Then I see login page
    Then I enter "DealerSHezer" text to username text area at index 1
    Then I enter "Voda1234" text to password text area at index 1
    And  I wait login button element 30 seconds at index 1
    When I click element: login button at index 1

  #@Stok
  Scenario: S_6_1_exim_UpLoad
    And I see topluStokGirisi page

    When I wait topluStokGirisi button element 5 seconds at index 1
    Then I click element: topluStokGirisi button at index 1
    When I wait topluStokGirisiLaptopicon element 5 seconds at index 1
    Then I click element: topluStokGirisiLaptopicon at index 1
    #When I wait topluStokGirisiadd element 5 seconds at index 1
    #Then I click element: topluStokGirisiadd at index 1
    #Then I click element: topluStokGirisiadd2 at index 1

    #Then I need to just wait
    #Then I upload the excel file from "FileUploadStock.exe"
    #Then I need to just wait

    Then I need to just wait
    Then I upload the file "Stock2.0" with random suffix using the: topluStokGirisiadd2 at index 1
    Then I need to just wait

    And I see urun page

    And I wait urun button element 1 seconds at index 1
    When I click element: urun button at index 1
    And I wait urunlerim button element 1 seconds at index 1
    Then I click element: urunlerim button at index 1
    And I wait hamburger close element 1 seconds at index 1
    Then I click element: hamburger close at index 1
    Then I clear text to urun arama at index 1
    Then I enter "102121212121010" text to urun arama at index 1
    And I wait serch1 element 1 seconds at index 1

    Then I click element: serch1 at index 1
    And I wait Urunsil element 1 seconds at index 1
    Then I click element: Urunsil at index 1
    And I wait ImeiSec element 1 seconds at index 1
    Then I click element: ImeiSec at index 1
    Then I click element: 102121212121010 at index 1

    And I wait Imesil element 1 seconds at index 1
    Then I click element: Imesil at index 1
    And I wait Imesil element 1 seconds at index 1
    And I wait silbasarili element 1 seconds at index 1

        #işlem bitti çıkış yap.
    And I logout the system