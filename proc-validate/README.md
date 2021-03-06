# SYNOPSIS

Simple Linux/UNIX process validator.

Check if process set by PID taken from pid file exists.


# INSTALL

    $ s6 --install proc-validate


# USAGE

## Manually

    # check process by PID taken from pid file
    $ s6 --plg-run proc-validate@pid_file=/var/run/nginx.pid

    # check process by footprint 
    $ s6 --plg-run proc-validate@footprint='sshd\s+-D'

## Via Sparrowdo

    $ cat sparrowfile

    use v6;
    
    use Sparrowdo;
    
    task-run 'check foo process', 'proc-validate', %(
      parameters => %(
        pid_file => '/var/run/foo.pid'
      )
    );


# Advanced usage

Sometimes you need to verify that process data taken from `ps`  
matches some regular expression, use footprint parameter for this:

    $ s6 --plg-run proc-validate@pid_file=/var/run/nginx.pid,footprint='nginx.*master'

Or via sparrowdo:

    task-run 'check nginx', 'proc-validate', %(
      parameters => %(
        pid_file => '/var/run/nginx.pid',
        footprint => 'nginx.*master'
      )
    );


# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
