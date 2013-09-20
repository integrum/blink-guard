Guard Blink
===========

Tools to help use [blink(1)](http://thingm.com/products/blink-1.html)
with ruby [guard](https://github.com/guard/guard) to report on test status

Install
-------

### Download the official blink1-tool and add it to your path

* [OSX](http://thingm.com/blink1/downloads/blink1-tool-mac.zip)
* [Linux X86](http://thingm.com/blink1/downloads/blink1-tool-linux_x86.zip)
* [Linux x64](http://thingm.com/blink1/downloads/blink1-tool-linux_x86_64.zip)

### Add these lines to the test sections you want to use blink(1) on:

    callback(:run_all_begin) {
      `cd /path/to/blinky; ./pulse.sh`
    }
    callback(:run_on_changes_begin) {
      `cd /path/to/blinky; ./pulse.sh FAST`
    }

  For Example:

    guard :rspec do
      callback(:run_all_begin) {
        `cd /path/to/blinky; ./pulse.sh`
      }
      callback(:run_on_changes_begin) {
        `cd /path/to/blinky; ./pulse.sh FAST`
      }
    end

### Run the blinky-watch.sh script in some other terminal window or tab


    cd /path/to/blinky; ./blink-watch.sh

