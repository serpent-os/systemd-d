/*
 * SPDX-FileCopyrightText: Copyright © 2020-2023 Serpent OS Developers
 *
 * SPDX-License-Identifier: Zlib
 */

/**
 * systemd
 *
 * Direct (low level) API binding to libsystemd
 *
 * Authors: Copyright © 2020-2023 Serpent OS Developers
 * License: Zlib
 */

public import systemd.bus_vtable;
public import systemd.bus;
public import systemd.common;
public import systemd.daemon;
public import systemd.event;
public import systemd.id128;
public import systemd.journal;

public import std.exception : errnoEnforce;

/**
 * Demonstrate dbus usage
 */
@("testing sd-dbus") @system unittest
{
    sd_bus* obj;
    sd_bus_default_user(&obj).errnoEnforce;
    scope (exit)
    {
        sd_bus_close(obj);
    }
    obj.sd_bus_request_name("com.serpentos.test", 0).errnoEnforce;

    auto iterations = 1;

    while (iterations < 5)
    {
        scope (exit)
            iterations++;

        immutable ret = obj.sd_bus_process(null);
        errnoEnforce(ret >= 0);
        if (ret > 0)
        {
            continue;
        }
        immutable waited = obj.sd_bus_wait(100);
        errnoEnforce(ret >= 0);
    }
}
