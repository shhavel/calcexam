Feature: User can assert one equality
  User invokes program for different operations
  Using simple invocation - asserts equality

Scenario: Assert equality for multiply
  When I successfully run `calcexam 14\*17=258`
  Then the stdout should contain "Wrong!"
  When I successfully run `calcexam 14\*17=238`
  Then the stdout should contain "Right!"

Scenario: Assert equality for minus
  When I successfully run `calcexam 25678-8762=17916`
  Then the stdout should contain "Wrong!"

Scenario: Assert equality for plus
  When I successfully run `calcexam 2635+2632=5267`
  Then the stdout should contain "Right!"
