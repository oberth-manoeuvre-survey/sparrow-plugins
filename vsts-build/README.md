# SYNOPSIS

Small wrapper for vsts build through [vsts cli](https://docs.microsoft.com/en-us/cli/vsts/overview?view=vsts-cli-latest)

# INSTALL

    $ s6 --install vsts-build

# USAGE


Run build for current branch:

    $ s6 --plg-run vsts-build@definition=BackEndBuild

List latest builds:

    $ s6 --plg-run vsts-build@action=list
    
Use as sparrowdo tasks:

    task_run "run my build", "vsts-build", %(
      definition => "BackEndBuild"
    );

# Parameters

## definition

Vsts build definition name

## action

Action to execute. `run|list`. Default value is `run` ( run build )

# See also

[vsts-cli](https://docs.microsoft.com/en-us/cli/vsts/overview?view=vsts-cli-latest)

# Author

Alexey Melezhik

