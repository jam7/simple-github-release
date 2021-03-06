#!/bin/sh

# Script to upload binary files to github release page.
#
# Prerequirement:
#   github-release  (https://github.com/aktau/github-release)
#   golang
#
# Copyright 2017 Kazushi (Jam) Marukawa.

owner=$GITHUB_OWNER
repo=$GITHUB_REPO

case x$owner in x) need_owner_repo=1;; esac
case x$repo in x) need_owner_repo=1;; esac
case x$need_owner_repo in x1)
  echo "Please specify owern and repository you want to manage in GITHUB_OWNER and GITHUB_REPO environment variables"
  exit 1;;
esac

case x$1 in
x|x-h)
  echo "Usage: $0 [options] tag files...
Options:
  -h: help
  -d: dump status of repository

Upload files to tagged release page of http://github.com/$owner/$repo"
  exit 0;;
x-d)
  github-release info -u "$owner" -r "$repo"
  exit 0;;
*)
  tag=$1
  shift;;
esac

case x$GITHUB_TOKEN in
x)
  echo "It is required to set your public_repo token to GITHUB_TOKEN environment variable to upload"
  exit 1;;
esac

for file in "$@"; do
  name=`basename $file`
  github-release upload -u "$owner" -r "$repo" -t "$tag" -n "$name" -f "$file"
done
  
