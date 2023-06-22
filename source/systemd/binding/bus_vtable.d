module systemd.binding.bus_vtable;

import core.stdc.config;
import core.stdc.stdarg;
import systemd.binding.bus;
import systemd.binding.common;
import systemd.binding.id128;

extern (C):
@nogc:
nothrow:

enum _Anonymous_0
{
    _SD_BUS_VTABLE_START = '<',
    _SD_BUS_VTABLE_END = '>',
    _SD_BUS_VTABLE_METHOD = 'M',
    _SD_BUS_VTABLE_SIGNAL = 'S',
    _SD_BUS_VTABLE_PROPERTY = 'P',
    _SD_BUS_VTABLE_WRITABLE_PROPERTY = 'W'
}

alias _SD_BUS_VTABLE_START = _Anonymous_0._SD_BUS_VTABLE_START;
alias _SD_BUS_VTABLE_END = _Anonymous_0._SD_BUS_VTABLE_END;
alias _SD_BUS_VTABLE_METHOD = _Anonymous_0._SD_BUS_VTABLE_METHOD;
alias _SD_BUS_VTABLE_SIGNAL = _Anonymous_0._SD_BUS_VTABLE_SIGNAL;
alias _SD_BUS_VTABLE_PROPERTY = _Anonymous_0._SD_BUS_VTABLE_PROPERTY;
alias _SD_BUS_VTABLE_WRITABLE_PROPERTY = _Anonymous_0._SD_BUS_VTABLE_WRITABLE_PROPERTY;

enum _Anonymous_1
{
    SD_BUS_VTABLE_DEPRECATED = 1UL << 0,
    SD_BUS_VTABLE_HIDDEN = 1UL << 1,
    SD_BUS_VTABLE_UNPRIVILEGED = 1UL << 2,
    SD_BUS_VTABLE_METHOD_NO_REPLY = 1UL << 3,
    SD_BUS_VTABLE_PROPERTY_CONST = 1UL << 4,
    SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE = 1UL << 5,
    SD_BUS_VTABLE_PROPERTY_EMITS_INVALIDATION = 1UL << 6,
    SD_BUS_VTABLE_PROPERTY_EXPLICIT = 1UL << 7,
    SD_BUS_VTABLE_SENSITIVE = 1UL << 8,
    SD_BUS_VTABLE_ABSOLUTE_OFFSET = 1UL << 9,
    _SD_BUS_VTABLE_CAPABILITY_MASK = 0xFFFFUL << 40
}

alias SD_BUS_VTABLE_DEPRECATED = _Anonymous_1.SD_BUS_VTABLE_DEPRECATED;
alias SD_BUS_VTABLE_HIDDEN = _Anonymous_1.SD_BUS_VTABLE_HIDDEN;
alias SD_BUS_VTABLE_UNPRIVILEGED = _Anonymous_1.SD_BUS_VTABLE_UNPRIVILEGED;
alias SD_BUS_VTABLE_METHOD_NO_REPLY = _Anonymous_1.SD_BUS_VTABLE_METHOD_NO_REPLY;
alias SD_BUS_VTABLE_PROPERTY_CONST = _Anonymous_1.SD_BUS_VTABLE_PROPERTY_CONST;
alias SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE = _Anonymous_1.SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE;
alias SD_BUS_VTABLE_PROPERTY_EMITS_INVALIDATION = _Anonymous_1
    .SD_BUS_VTABLE_PROPERTY_EMITS_INVALIDATION;
alias SD_BUS_VTABLE_PROPERTY_EXPLICIT = _Anonymous_1.SD_BUS_VTABLE_PROPERTY_EXPLICIT;
alias SD_BUS_VTABLE_SENSITIVE = _Anonymous_1.SD_BUS_VTABLE_SENSITIVE;
alias SD_BUS_VTABLE_ABSOLUTE_OFFSET = _Anonymous_1.SD_BUS_VTABLE_ABSOLUTE_OFFSET;
alias _SD_BUS_VTABLE_CAPABILITY_MASK = _Anonymous_1._SD_BUS_VTABLE_CAPABILITY_MASK;

enum _Anonymous_2
{
    _SD_BUS_VTABLE_PARAM_NAMES = 1 << 0
}

alias _SD_BUS_VTABLE_PARAM_NAMES = _Anonymous_2._SD_BUS_VTABLE_PARAM_NAMES;

extern __gshared const uint sd_bus_object_vtable_format;

struct sd_bus_vtable
{
    import std.bitmanip : bitfields;

    mixin(bitfields!(ubyte, "type", 8, ulong, "flags", 56));

    union _Anonymous_3
    {
        struct _Anonymous_4
        {
            alias size_t = c_ulong;
            size_t element_size;
            ulong features;
            const(uint)* vtable_format_reference;
        }

        _Anonymous_4 start;

        struct _Anonymous_5
        {
            size_t _reserved;
        }

        _Anonymous_5 end;

        struct _Anonymous_6
        {
            const(char)* member;
            const(char)* signature;
            const(char)* result;

            alias sd_bus_message_handler_t = int function(sd_bus_message* m,
                    void* userdata, sd_bus_error* ret_error);
            sd_bus_message_handler_t handler;
            size_t offset;
            const(char)* names;
        }

        _Anonymous_6 method;

        struct _Anonymous_7
        {
            const(char)* member;
            const(char)* signature;
            const(char)* names;
        }

        _Anonymous_7 signal;

        struct _Anonymous_8
        {
            const(char)* member;
            const(char)* signature;
            alias sd_bus_property_get_t = int function(sd_bus* bus, const(char)* path,
                    const(char)* interface_, const(char)* property,
                    sd_bus_message* reply, void* userdata, sd_bus_error* ret_error);
            sd_bus_property_get_t get;
            alias sd_bus_property_set_t = int function(sd_bus* bus, const(char)* path,
                    const(char)* interface_, const(char)* property,
                    sd_bus_message* value, void* userdata, sd_bus_error* ret_error);
            sd_bus_property_set_t set;
            size_t offset;
        }

        _Anonymous_8 property;
    }

    _Anonymous_3 x;
}
