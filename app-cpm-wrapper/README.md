# SYNOPSIS

Simple wrapper for [App::cpm](https://metacpan.org/pod/App::cpm)


# INSTALL

    $ s6 --install app-cpm-wrapper

# USAGE

Basic usage:

    $ s6 --plg-run app-cpm-wrapper@module=$module -- <app-cpm-wrapper-params>

For example:

    $ s6 --plg-run app-cpm-wrapper@\
    ,module="HTTP::Tiny Config::Tiny" --\
    -w 2\
    -L /home/melezhik/cpan # so on

See parameters description at [cpm doc](https://metacpan.org/pod/distribution/App-cpm/script/cpm)

# Automation

By sparrow tasks:

/app-cpm-wrapper/README

/app-cpm-wrapper/README

    $ s6 --task-set cpan/installer

      ---
      args: 
        - '~w': 2 
        - '~L': /home/melezhik/cpan

    $ s6 --task-run cpan/installer,module="HTTP::Tiny Config::Tiny"


Or if you prefer remote run, use Sparrowdo:

    $ cat sparrowfile

    task-run "install a couple of modules", "app-cpm-wrapper", %(
      args => (
        'g', # global install
        %( '~w' => 2 ) # numbe of workers
      )
    );


    $ sparrowdo --host=$host # run on remote host

# Author

* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)




