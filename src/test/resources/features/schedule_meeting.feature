@https://www.pivotaltracker.com/story/show/104351462 @meeting_organiser @organise_meetings
Feature: Schedule meeting
  In order to organise meetings
  As a meeting organiser
  I want to be able to schedule a meeting considering the availabilities of potential participants collected so far

  Background:
    Given the organizer creates the meeting proposal:
      | title  | description | organizer     | slotDuration| isOpen |
      | Test   | Testdescr   | test@test.com | 2           | false  |
    And the organizer creates a new time slot "2015-07-11T11:00:00.000+0000"
    Then the response is status code 201
    And the organizer associates the previous time slot to the created meeting proposal
    Then the response is status code 204
    And The organizer create a new availability "YES"
    And The organizer create a new availability "MAYBE"
    And The organizer create a new availability "NO"

    Scenario: Two votes for yes one for maybe
      And adds a participant with "test1@test.com" email to the previously created meeting proposal
      And the organizer associates the previous meeting proposal with the email parcitipant, timeslot and availability "MAYBE"
      And adds a participant with "test2@test.com" email to the previously created meeting proposal
      And the organizer associates the previous meeting proposal with the email parcitipant, timeslot and availability "YES"
      And adds a participant with "test3@test.com" email to the previously created meeting proposal
      And the organizer associates the previous meeting proposal with the email parcitipant, timeslot and availability "YES"
      Then the organizer puts isOpen as "false"
      Then the response is status code 200
      And the votes for "yes" are 2
      And the votes for "maybe" are 1
      And the votes for "no" are 0