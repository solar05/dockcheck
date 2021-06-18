# dockcheck [![Gem Version](https://badge.fury.io/rb/dockcheck.svg)](https://badge.fury.io/rb/dockcheck) [![Tests](https://github.com/solar05/dockcheck/actions/workflows/ruby.yml/badge.svg)](https://github.com/solar05/dockcheck/actions/workflows/ruby.yml)
Simple gem, that validates document check sum.

## Install
`gem install dockcheck`
or using Gemfile `gem 'dockcheck', '~> 1.1'`

### Examples
`checker = DockCheck.new(:inn)`  
`checker.check('12345433434', []) # => false`  
`checker.check('7743013901', []) # => true`  
   
`checker.change_checker(:snils)`  
`checker.check('34380710664', []) # => true`  
`checker.check('1234', []) # => Throws exception with invalid snils numbers count`  
`checker.current_checker() # => :snils`  

