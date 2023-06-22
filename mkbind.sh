#!/bin/bash
set -e
set -x

dstep -o source/systemd/bus.d \
        /usr/include/systemd/sd-bus.h \
        --normalize-modules=true \
        --public-submodules=true \
        --rename-enum-members=false \
        --translate-macros=false \
        --alias-enum-members=true \
        --package systemd \
        --comments=false \
        --global-attribute '@nogc' \
        --global-attribute 'nothrow'
        
dstep -o source/systemd/journal.d \
        /usr/include/systemd/sd-journal.h \
        --normalize-modules=true \
        --public-submodules=true \
        --rename-enum-members=false \
        --translate-macros=false \
        --alias-enum-members=true \
        --package systemd \
        --comments=false \
        --global-attribute '@nogc' \
        --global-attribute 'nothrow'
        
dstep -o source/systemd/daemon.d \
        /usr/include/systemd/sd-daemon.h \
        --normalize-modules=true \
        --public-submodules=true \
        --rename-enum-members=false \
        --translate-macros=false \
        --alias-enum-members=true \
        --package systemd \
        --comments=false \
        --global-attribute '@nogc' \
        --global-attribute 'nothrow' \
        -U__INCLUDE_LEVEL__
