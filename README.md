# dockcheck [![Gem Version](https://badge.fury.io/rb/dockcheck.svg)](https://badge.fury.io/rb/dockcheck) [![Tests](https://github.com/solar05/dockcheck/actions/workflows/ruby.yml/badge.svg)](https://github.com/solar05/dockcheck/actions/workflows/ruby.yml) [![Maintainability](https://api.codeclimate.com/v1/badges/78eabd3ae6746960f318/maintainability)](https://codeclimate.com/github/solar05/dockcheck/maintainability)
Simple gem, that validates document check sum.

## Install
`gem install dockcheck`
or using Gemfile `gem 'dockcheck', '~> 2.0'`

### Validators list
- INN
- BIK
- KPP
- SNILS
- OGRN
- OGRNIP

### Validation structure
For input use Hashmap with following stucture:
- `type    - type of document, required, symbol or string`
- `content - document numbers, required, string`
- `extra   - extra data of document, optional, string`

Output structure contains input data and some additional fields:
- `error   - validation error`
- `correct - validation result`

#### Examples
```Ruby
checker = DockCheck.new()  

checker.check({type: :inn, content: "7743013901"})
{type: :inn, content: "7743013901", correct: true, error: ""}

checker.check({type: :inn, content: "8800555"})
{type: :inn, content: "8800555", correct: false, error: 'Incorrect inn numbers count!'}

checker.check({type: :snils, content: "12345678901"})
{type: :snils, content: "12345678901", correct: false, error: ""}

checker.list_checkers
[:inn, :snils, :bik, :kpp, :ogrnip, :ogrn]

checker.check_many([{type: :inn, content: "7743013901"}, {type: :bik, content: "123456?!@"}])
[{type: :inn, content: "7743013901", correct: true, error: ""}, {type: :bik, content: "123456?!@", correct: false, error: ""}]
```
