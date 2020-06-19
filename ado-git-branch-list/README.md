# ado-git-branch-list

List Git branches in Ado project

# Install

    s6 --install ado-git-branch-list

# Usage

Cli

    s6 --plg-run ado-git-branch-list@project=Backends,repo=Catalog

API

    my %data = task-run "list branches", "ado-git-branch-list", %(
      project => "Backends",
      repo => "Catalog"
    );

    for %data<list><> -> $i {
        say $i<name>, " by ", $i<author>
    }

# Parameters

* `project`

Ado project name

* `repo`

Repository name

* `author`

Optional. Filter by author name. For example:

    author=melezhik@gmail.com

* `skip`

Optional. Skip branches by filter. Should be Raku regexp:

    skip="^^ 'dev' || 'test' || 'master' $$"

CLI example:

    s6 s6 --plg-run ado-git-branch-list@project=Backends,\
    repo=Catalog,\
    skip="^^ 'dev' || 'master' || 'releas' $$"

# Authentication

Create file named `~/.sparrow-azure-devops.sh`

```
token=$PAT
api=https://dev.azure.com/$organization
user=$api_user
```

Where:

* `user`

User to sign requests

* `token`

User personal access token (PAT)

* `api`

Azure DevOps API URL


# Author

Aleksei Melezhik


