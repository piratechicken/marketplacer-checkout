# marketplacer-checkout

A code challenge submitted to Marketplacer

## Set up
This project was written in Ruby 3.0.1 but it should work in any recent ruby version.

### To install the ruby version:
- If you use asdf:
  - `asdf install ruby 3.0.1`
- If you use rbenv:
  - `rbenv install 3.0.1`

### To run specs:
- `bundle install` to install rspec
- `bundle exec rspec`

### To run the checkout CLI:
- `./run_checkout`

## To dos and improvements
- Products and discounts:
  - Use BigDecimal (or cents as integer) for prices to avoid float point errors
  - Add validation of discounts file input
  - Move loading of products and discounts to stand alone classes
  - The `numerical?` method in `Product` should be mocved to a helper module
- CLI class:
  - Add user feedback when no product found
  - This class not very optimal with the loop and all the `puts` (it was the last part I rushed through). I suspect the loop in particular is an issue that could cause a memory problem. There are also no specs for this class
- General:
  - In specs, stub classes that are not the one to be tested
  - Allow user to custom path to products and discounts json when running the checkout
