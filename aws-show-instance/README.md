# SYNOPSIS

Sparrow plugin to print ec2 instance info in human readable format.


# INSTALL

    $ s6 --install aws-show-instance


# USAGE

To dump your tagged ec2 instances in human readable format just run:

    $ s6 --plg-run aws-show-instance@id=$instance-id

# Author

Alexey Melezhik


# See also

[aws-run-instance ](https://sparrowhub.org/info/aws-run-instance) - sparrow plugin to run ec2 instances ( optionally with some tags attached )

# Prerequisites

Aws cli should be installed

