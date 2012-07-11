# Calcexam

Simple training command line application. Increasing your arithmetical ability.

## Installation

Type in command line:

    $ gem install calcexam

## Usage

    $ calcexam --operation=multiply 11..20 11..20
    17 * 11 =  187
    Right!
    14 * 18 =  224
    Try again
    14 * 18 =  262
    Wrong!
    19 * 12 =  _

    $ calcexam --operation=plus --no-shuffle 2345 4567,5678
    2345 + 4567 =  6912
    Right!
    2345 + 5678 =  8023 
    Right!
    Results: 100.0% (2/2)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
