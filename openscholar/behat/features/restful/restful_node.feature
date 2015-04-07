Feature:
  Creating nodes via rest.

  @api @restful
  Scenario: Creating biblio via rest.
    Given I create a new node of "biblio" as "john" with the settings:
      | Label       | Body                  | vsite | type  |
      | Rest biblio | This is a test Biblio | john  | 101   |

  @api @restful
  Scenario: Creating bio via rest.
    Given I delete the node "John doe biography"
     Then I create a new node of "bio" as "john" with the settings:
      | Label       | Body                | vsite |
      | Rest bio    | This is a test bio  | john  |

  @api @restful
  Scenario: Creating blog via rest.
    Given I create a new node of "blog" as "john" with the settings:
      | Label     | Body                 | vsite |
      | Rest blog | This is a test blog  | john  |

  @api @restful
  Scenario: Creating book via rest.
    Given I create a new node of "book" as "john" with the settings:
      | Label     | Body                | vsite |
      | Rest book | This is a test book | john  |

  @api @restful
  Scenario: Creating class via rest.
    Given I create a new node of "class" as "john" with the settings:
      | Label       | Body                  | vsite |
      | Rest class  | This is a test class  | john  |

  @api @restful
  Scenario: Creating book via rest.
    Given I create a new node of "class_material" as "john" with the settings:
      | Label               | Body                           | vsite | Parent     |
      | Rest class material | This is a test class material  | john  | Rest class |

  @api @restful
  Scenario: Creating book via rest.
    Given I delete the node "John doe's curriculum"
     Then I create a new node of "cv" as "john" with the settings:
      | Label   | Body               | vsite  |
      | Rest CV | This is a test CV  | john   |

  @api @restful
  Scenario: Creating book via rest.
     Given I create a new node of "event" as "john" with the settings:
      | Label       | Body                  | vsite  | Start date |
      | Rest event  | This is a test event  | john   | 1/1/2010   |

  @api @restful
  Scenario: Creating faq via rest.
     Given I create a new node of "faq" as "john" with the settings:
      | Label     | Body                | vsite  |
      | Rest FAQ  | This is a test FAQ  | john   |

  @api @restful
  Scenario: Creating faq via rest.
     Given I create a new node of "feed" as "john" with the settings:
      | Label     | Body                | vsite  | Field url      |
      | Rest feed | This is a test feed | john   | http://foo.bar |

  @api @restful
  Scenario: Creating faq via rest.
     Given I create a new node of "image_gallery" as "john" with the settings:
      | Label         | vsite  | columns  | rows  | files               |
      | Rest gallery  | john   | 3        | 4     | jfk_1.jpg,jfk_2.jpg |

  @api @restful
  Scenario: Creating faq via rest.
     Given I create a new node of "news" as "john" with the settings:
      | Label     | date      | body                | vsite  |
      | Rest news | 1/1/2012  | This is a rest nest | john   |

  @api @restful
  Scenario: Creating faq via rest.
     Given I create a new node of "page" as "john" with the settings:
      | Label     | body                | vsite  | path       |
      | Rest page | This is a rest page | john   | rest-path  |

  @api @restful
  Scenario: Creating faq via rest.
     Given I create a new node of "person" as "john" with the settings:
      | address      | email            | first_name  | middle_name | last_name | phone     | prefix  | professional_title  | vsite   |
      | Rest address | foo@example.com  | Diego       | dela        | vega      | 555-1212  | snr.    | Zoro!               | john    |

  @api @restful
  Scenario: Creating faq via rest.
     Given I create a new node of "presentation" as "john" with the settings:
      | Label             | vsite | date     | location        |
      | Rest presentation | john  | 1/1/2012 | Home sweet home |

  #todo: handle files.
  @api @restful
  Scenario: Creating faq via rest.
     Given I create a new node of "slideshow_slide" as "john" with the settings:
      | Label           | vsite |
      | Rest slide show | john  |

  @api @restful
  Scenario: Creating faq via rest.
     Given I create a new node of "software_project" as "john" with the settings:
      | Label                 | vsite | files               |
      | Rest software project | john  | jfk_1.jpg,jfk_2.jpg |

  @api @restful
  Scenario: Creating faq via rest.
     Given I create a new node of "software_release" as "john" with the settings:
      | Label                 | vsite | software_project      | body  | recommended | version | package  |
      | Rest softeare release | john  | Rest software project | foo   | 1           | 2005    | true     |