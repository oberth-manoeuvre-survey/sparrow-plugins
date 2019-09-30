# SYNOPSIS

Run and list ado builds using `azure devops cli`

# INSTALL

    $ s6 --install ado-pipeline-build

# USAGE

Run build for the current branch:

    $ s6 --plg-run ado-pipeline-build@name=WebApp

List builds for the current branch and pipeline WebApp:

    $ s6 --plg-run ado-pipeline-build@action=list,name=WebApp
    
Use as Sparrow6 tasks:

    task_run "run my build", "ado-pipeline-build", %(
      name => "WebApp",
      variables => "foo=1 bar=2"
    );

# Parameters

## name

Ado pipeline definition name

## action

Action to execute. `run|list`. Default value is `run` ( run build )

## variables

Ado variables being set for a build run

# See also

[azure devops cli](https://docs.microsoft.com/en-us/azure/devops/cli/get-started?view=azure-devops)


# Author

Alexey Melezhik