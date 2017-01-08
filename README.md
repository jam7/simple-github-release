# simple-github-release
Script to call github-release for the ease of operation

## Prerequirements
golang and github-release (https://github.com/aktau/github-release)

Performs following steps if you are not sure.
```
$ sudo apt-get install golan
$ export GOPATH=$HOME/gocode
$ export PATH=$GOPATH/bin:$PATH
$ go get github.com/aktau/github-release
```

## Setup
Need to specify owner and repository you want to manage and token to operate.

First, make token at github by [creation a github token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/).  Then, set all environment variable like below.
```
$ export GITHUB_OWNER=owner-of-repository-to-manage
$ export GITHUB_REPO=repository-to-manage
$ export GITHUB_TOKEN=token-you-made
```

## Example of use
First, need to make a release page.  Check [creating release page](https://help.github.com/articles/creating-releases/).

After that, you can check the status of your repository by `./upload-github-release.sh -d` like below.
```
$ ./upload-github-release.sh -d
git tags:
- v0.1 (commit: https://api.github.com/repos/jam7/simple-github-release/commits/ad169f2565b9c87e375fb04006dae370461a8456)
releases:
- v0.1, name: 'Release test page', description: 'It is possible to put binaries here.', id: 5097090, tagged: 08/01/2017 at 00:06, published: 08/01/2017 at 00:46, draft: ✗, prerelease: ✔
```

Now, it is possible to upload files to your release page like below.
```
$ ./upload-github-release.sh v0.1 test-binary.zip
```

## Usage
```
./upload-github-release.sh [options] tag files...
Options:
  -h: help
  -d: dump status of repository
```

It is possible to upload multiple files at once.  It is not possible to overwrite files uploaded, so need to remove them from web interface.

## License
Copyright 2017 Kazushi (Jam) Marukawa.

This project including all of its source files is released under the terms of [GNU General Public License (version 3 or later)](http://www.gnu.org/licenses/gpl.txt)
