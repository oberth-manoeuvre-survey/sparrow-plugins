# SYNOPSIS

Find stale processes at your server. 

It is very handy when for some reasons you have an old, stale processes on your server not died for some reasons ...


# Dependencies

ps utility should be installed

# INSTALL

    $ s6 --install stale-proc-check


# USAGE

    # lets find all nginx processes running since last week

    $ sparrow plg run stale-proc-check --param filter=nginx --param hitask="'1 weeks'"

# Plugin settings

## filter

Sets pattern to filter desired processes. Should be perl regexp.

## hitask

Check process for given period of time. Default value is \`1 days', An example values:

* 1 months
* 10 days
* 2 weeks

This parameter should complies with [DateTime::subtract method](https://metacpan.org/pod/DateTime#Math-Methods) format.

# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)

