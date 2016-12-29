# AttrCleaner

Cleans up your model attributes. Strips leading and trailing space, and turns
empty strings into `nil`.

Tested against Rails 4.2 and 5.0.

![Travis CI](https://travis-ci.org/thomasfedb/attr_cleaner.svg?branch=master)

## Install

If you're using Rails with ActiveRecord all you need to do is:

```ruby
gem "attr_cleaner"
```

## Usage

Simply pass a list of attributes that you want to clean:

```ruby
attr_cleaner :title, :body
```

Child models will inherit the attribute list from their parent by default.

## Other ORMs

AttrCleaner will also work with any ORM that writes attributes via a method
called `write_attribute`.

To get AttrCleaner working with your ORM just include it into your models:

```ruby
include AttrCleaner::Model
```

## Copyright

Copyright &copy; 2010 Thomas Drake-Brockman
