# AttrCleaner

[![Travis CI](https://travis-ci.org/thomasfedb/attr_cleaner.svg?branch=master)](https://travis-ci.org/thomasfedb/attr_cleaner)

Cleans up your model attributes. Strips leading and trailing space, and turns
empty strings into `nil`.

Tested against Rails 4.2, 5.0, and 5.1.

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

Child models will inherit the attribute writers from their parent.

## Other ORMs

AttrCleaner works by generating attribute setters and should work with most ORMs.

To get AttrCleaner working with your ORM just include it into your models:

```ruby
include AttrCleaner::Model
```

## Copyright

Copyright &copy; 2018 Thomas Drake-Brockman
