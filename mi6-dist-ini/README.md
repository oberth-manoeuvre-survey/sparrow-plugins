# SYNOPSIS

Regenerate mi6 `dist.ini` and `.gitignore` files for Perl6 project.

* Dist.ini - used for [mi6](https://github.com/skaji/mi6) CPAN uploader
* Gitignore - hide from git some files that are not meant for git consumption (*.tar.gz, so on )


# INSTALL

    $ s6 --install mi6-dist-ini


# USAGE 

    $ s6 --plg-run mi6-dist-ini --cwd $PWD\
    ,module=My::Module

# Author

Alexey Melezhik

