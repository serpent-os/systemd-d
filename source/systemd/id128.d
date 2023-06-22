module systemd.id128;

import core.stdc.stdarg;
import systemd.common;

extern (C):
@nogc:
nothrow:

alias sd_id128_t = sd_id128;

union sd_id128
{
    ubyte[16] bytes;
    ulong[2] qwords;
}

char* sd_id128_to_string(sd_id128_t id, ref char[SD_ID128_STRING_MAX] s);
char* sd_id128_to_uuid_string(sd_id128_t id, ref char[SD_ID128_UUID_STRING_MAX] s);
int sd_id128_from_string(const(char)* s, sd_id128_t* ret);

int sd_id128_randomize(sd_id128_t* ret);

int sd_id128_get_machine(sd_id128_t* ret);
int sd_id128_get_boot(sd_id128_t* ret);
int sd_id128_get_invocation(sd_id128_t* ret);

int sd_id128_get_machine_app_specific(sd_id128_t app_id, sd_id128_t* ret);
int sd_id128_get_boot_app_specific(sd_id128_t app_id, sd_id128_t* ret);

int sd_id128_equal(sd_id128_t a, sd_id128_t b);

int sd_id128_is_null(sd_id128_t a);

int sd_id128_is_allf(sd_id128_t a);

int sd_id128_in_setv(sd_id128_t a, va_list ap);

int sd_id128_in_set_sentinel(sd_id128_t a, ...);
