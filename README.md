Shmacros
========

A pack of shoulda macros for testing Rails apps.

Install
-------
  
    script/plugin install git://github.com/maxim/shmacros.git

Unit Macros
-----------

- `should_accept_nested_attributes_for :foo, :bar` 
  
  Verifies that `accepts_nested_attribtes_for` is declared for given attributes.

- `should_act_as_taggable_on :category_name`

  Verifies that `acts_as_taggable_on` is declared for optionally given category.

- `should_be ClassName`

  Verifies that tested model `is_a?(ClassName)`.

- `should_callback :method_name, :after_save`

  Verifies that given callback (`:method_name`) is declared for given event (`:after_save`).

- `should_delegate :foo, :bar, :to => :elsewhere, :allow_nil => true`

  Verifies that `delegates` is declared for given method to given destination. Also tests `:allow_nil` functionality introduced in Rails 2.3.3.

- `should_validate_associated :foo, :bar`

  Verifies that `validates_associated` is declared for given attributes.

- `should_deny_values :country => %w(Africa Europe), :zipcode => "fake_code"`

  Verifies that tested model is invalid when given attributes are assigned corresponding values.
  As opposed to shoulda's similar method, this implementation doesn't compare error messages, just checks for error presence on attribute.

- `should_allow_values :country => %w(England Russia), :zipcode => "55555"`

  Verifies that tested model is valid when given attributes are assigned corresponding values.
  As opposed to shoulda's similar method, this implementation doesn't compare error messages, just checks for error presence on attribute.

- `should_allow_mass_assignment_of :foo, :bar, :strict => true`

  Overrides Shoulda's `should_allow_mass_assignment_of` to add the convenience option `:strict => true`. When `:strict` is `true` every non-listed attribute is explicitly tested for mass assignment protection.
  
Functional Macros
-----------------

- `should_rest_route :show, :new, :create`

  Provides shortcut to declaring multiple `should_route` tests if routes are supposed to be REST-style. If action names are omitted defaults to testing all 7 RESTful actions. Accepts option `:singular => true` for singular routes such as profile or account controller. Usually guesses controller name, but can be overridden with `:controller => "Profile"` option.

Thank you
------------

- Mike Gunderloy (bug fixes)


Contact/Contribute
------------------

If you'd like to comment on something -- I'm [@hakunin](http://twitter.com/hakunin) on twitter.
My [blog](http://mediumexposure.com) has more ways to reach me. 
For contributions simply fork, change, commit, send me pull requests.

License
-------

Copyright (c) 2009 [Maxim Chernyak](http://mediumexposure.com)
 
Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:
 
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.