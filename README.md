# Lutong Bahay CLI

A friendly command-line app to browse and follow **Filipino recipes** step-by-step.

## Features

- Recipe list with **search by name/tags**
- **Interactive cooking mode**: next/prev step, restart, show ingredients
- Switch recipes any time
- Clean Ruby design with:
  - Your own classes (`Recipe`, `LutongBahay::CLI`) and `initialize`
  - Instance variables and `attr_reader`/`attr_accessor`
  - Terminal input via `gets` and `chomp`
- MiniTest tests in `tests/`

## Install & Run

```bash
# Ruby 3.x recommended
git clone https://github.com/yourname/lutong-bahay-cli.git
cd lutong-bahay-cli
bundle install  # (optional if you add a Gemfile)
chmod +x bin/lutong_bahay
bin/lutong_bahay
