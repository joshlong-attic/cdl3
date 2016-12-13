#!/bin/bash

CF_USER=${1:-$CF_USER}
CF_PASSWORD=${2:-$CF_PASSWORD}
CF_ORG=${3:-$CF_ORG}
CF_SPACE=${4:-$CF_SPACE}

function install_cf(){
    mkdir -p $HOME/bin
    curl -v -L -o cf.tgz 'https://cli.run.pivotal.io/stable?release=linux64-binary&version=6.15.0&source=github-rel'
    tar zxpf cf.tgz
    mkdir -p $HOME/bin && mv cf $HOME/bin
}

function validate_cf(){

    cf  -v || install_cf
    export PATH=$PATH:$HOME/bin

    cf api $CF_API
    cf auth $CF_USER "$CF_PASSWORD" && cf target -o $CF_ORG -s $CF_SPACE &&  cf apps
}

validate_cf

BP=https://github.com/cloudfoundry/java-buildpack.git

cf push -b $BP -p target/*jar --hostname cdlive-staging cdlive
