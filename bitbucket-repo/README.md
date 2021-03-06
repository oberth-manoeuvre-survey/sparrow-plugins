# SYNOPSIS

Create ( multiple ) bitbucket git repositories.

# Description

Plugin goes through the list of directories and creates remote git repository for every one. 

# INSTALL

    s6 --install bitbucket-repo


# USAGE

    s6 --plg-run bitbucket-repo 
    ,team=heroes\
    ,project=ABC\
    ,svn_repo=http://svn_repository/goods\
    ,user=alexey\
    ,password=12345\
    ,granto=guest-user
    

# Parameters

## team

This should be a bitbucket team  _representing_ a realm for git repositories.

For example:

    ,team=my-cool-team

Obligatory. No default value.

## project

This should be key of bitbucket project inside `$team`. Obligatory. No default value.

For example:

    ,project=PRJ1

## user

This should be a bitbucket user with privileges to create a repositories inside the `team`.

## password

This should be bitbucket user's password

## svn_repo

This should be a svn repo URL.

For example:

    ,svn_repo=http://svn_repository/goods

Plugin goes through the list of directories and asynchronously creates remote git repository for every one. 

A list of directories is fetched by `svn list` command:

    $ svn list $svn_repo 

Obligatory. No default value.

## repo

If repo is set - only perform operation for given repository ( directory listed at `$svn_repo` ). For example:

    ,repo=foo 

## postfix

An optional parameter, if set add `$postfix` string to the name of bitbucket repository being created.

For example:

    ,postfix='-cookbook'

This is useful to avoid conflicts when some bitbucket repositories already exist at team. 

## granto

This should be butbucket user which will be granted a read access to bitbucket repositories being created.

# Author

Alexey Melezhik

