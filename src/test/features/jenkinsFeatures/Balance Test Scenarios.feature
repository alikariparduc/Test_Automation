Feature: Balance Test Scenarios

  Scenario Outline: Bakiye Düşüm - Yükleme Sonrası Bayi Bakiye Miktarı Kontrolü

    Given I control logout with username: <svmsUserName>
    And Get Token With username <svmsUserName> and password <svmsPassword> and usergroup "THIRD_PARTY" with "POST".
    And Add multiple icci with storeCode <storeCode> and with quantity <icciQuantity> with "POST"

    Given I control logout with username: <bppsUsername>
    And Get Token With username <bppsUsername> and password <bppsPassword> and usergroup "THIRD_PARTY" with "POST".
    And Validate store with storeCode <storeCode> and transferAmount <transferAmount> with "POST"
    And Approve amount with storeCode <storeCode> and transferAmount <transferAmount> with "POST"

    Given I control logout with username: <balanceUsername>
    And Get Token With username <balanceUsername> and password <balancePassword> and usergroup "THIRD_PARTY" with "POST".
    And Deduct added ICCIs with storeCode <storeCode> with "POST"
    #And Deduct ICCI <icci1> with storeCode <storeCode> with "POST"
    #And Deduct ICCI <icci2> with storeCode <storeCode> with "POST"

    Given I control logout with username: <username>
    When I login the system with username <username> and password <password>
    And I see ozet page
    And I wait ozet button element 10 seconds at index 1
    And I click element: ozet button at index 1
    And I need to just wait
    And I wait bakiyeMiktari element 10 seconds at index 1
    And I control bakiyeMiktari element's text is "₺0,00" at index 1

    And Refund deducted ICCIs with transactionIds with "POST"

    And I have to refresh the page
    And I control bakiyeMiktari element's text is "₺864,22" at index 1

    And Deduct added ICCIs with storeCode <storeCode> with "POST"
    #And Deduct ICCI <icci1> with storeCode <storeCode> with "POST"
    #And Deduct ICCI <icci2> with storeCode <storeCode> with "POST"

    And I have to refresh the page
    And I control bakiyeMiktari element's text is "₺0,00" at index 1

    And I logout the system

    Examples:
      | svmsUserName        | bppsUsername           | balanceUsername        | username     | svmsPassword   | bppsPassword     | balancePassword | password        | storeCode   | transferAmount    | icciQuantity   |
      | "triplea.svms.auto" | "triplea-bpps-postman" | "triplea.balance.auto" | "S388900"    | "triplea.svms" | "triplea-bpps"   | "triplea"       | "Voda1234"      | "S388900"   | "864.22"          | "2"            |
