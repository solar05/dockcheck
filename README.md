# dockcheck
Simple gem, that validates document check sum.

## Install
gem install dockcheck

### Examples
`checker = DockCheck.new(:inn)`
`checker.check('12345433434') # => false`
`checker.check('7743013901') # => true`
 
`checker.change_checker(:snils)`
`checker.check('34380710664') # => true`
`checker.check('1234') # => Throws exception with invalid snils numbers count`

