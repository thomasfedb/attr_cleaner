# AttrCleaner

Cleans up your model attributes. Strips leading and trailing space, and turns
empty strings into `nil`.

## Install

If you're using Rails with ActiveRecord all you need to do is:

```ruby
gem "attr_cleaner"
```

AttrCleaner will also work with any ORM that writes attributes via a method
called `write_attribute`.

To get AttrCleaner working with your ORM just include it into your models:

```ruby
include AttrCleaner::Model
```

AttrCleaner can also be used outside of Rails if ActiveSupport 3 is avalable.
If you're using AttrCleaner outside of Rails, and it detects ActiveRecord is
allready loaded, it will include itself into ActiveRecod. Make sure ActiveRecord
is loaded first.

## Usage

Simply add this to any model you want to clean:

```ruby
attr_cleaner
```

You can restrict the cleaning to specific attributes with `:only` and `:except`:

```ruby
attr_cleaner only: :name
attr_cleaner only: [:name, :age]
attr_cleaner except: :age
attr_cleaner except: [:age, :price]
```

Settings are be inherited, so sometimes you may need both `:only` and `:except`:

```ruby
# Remove :age from the list, add :name
attr_cleaner only: :name, except: :age
```

## Copyright

Copyright &copy; 2010 Thomas Drake-Brockman
