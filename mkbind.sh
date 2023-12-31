#!/bin/bash
set -e
set -x

for i in "id128" "bus" "bus-vtable" "journal" "daemon" "event" ; do
        imports="--global-import core.stdc.stdarg"
        if [[ $i != "id128" ]]; then
                imports=" $imports --global-import systemd.binding.id128"
        fi

        # Fix imports
        if [[ $i == "bus" ]]; then
                imports=" $imports --global-import systemd.binding.event --global-import systemd.binding.bus_vtable"
        elif [[ $i == "bus-vtable" ]]; then
                imports=" $imports --global-import systemd.binding.bus"
        elif [[ $i == "event" ]]; then
                imports=" $imports --global-import core.sys.linux.sys.signalfd --global-import core.sys.linux.sys.inotify"
        fi
        imports="--global-import systemd.binding.common $imports"
        pkgName=`echo $i | sed 's@-@_@g'`

        dstep   /usr/include/systemd/sd-$i.h -o source/systemd/binding/$pkgName.d \
                --normalize-modules=true \
                --public-submodules=true \
                --rename-enum-members=false \
                --translate-macros=false \
                --alias-enum-members=true \
                --package systemd.binding \
                --comments=false \
                --global-attribute '@nogc' \
                --global-attribute 'nothrow' \
                --skip _sd_useless_struct_to_allow_trailing_semicolon_ \
                $imports \
                -D__COVERITY__=1


done


for i in source/systemd/binding/*.d ; do
        sed -e 's/ULL/UL/g' -i $i;
done
