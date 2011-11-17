SpreeVariantsViaSelectField
===========================

If your products have a broad selection of variants the default way of showing it as radio buttons quickly becomes very
cluttered.
This plugin creates select boxes from your option types.
To prevent the selection of a combination of options (if 2 or more options) for which there is no product
(or no available product), options will be disabled on the fly. While this works well with two option types it currently
does not work 100% correctly if you have more the 2 option types per product. If the user then chooses an invalid combination
a message will be displayed that the selected product is not available.

Install notes
-------------
* This plugin has only been testet on SpreeCommerce version 0.70.0
* it requires coffescript (part of default RAILS 3.1)

release notes
-------------
* 0.1 - 17.11.2011
  initial release



Copyright (c) 2011 [Gordon Friebe], released under the New BSD License
