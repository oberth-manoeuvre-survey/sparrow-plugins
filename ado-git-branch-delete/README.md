# ado-repo-create

Delete Git repository in Azure Devops project

# Install

    s6 --install ado-git-branch-delete

# Usage

    s6 --plg-run ado-git-branch-delete@project=Backends,repo=Catalog,branch=feature

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


