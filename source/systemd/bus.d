module systemd.bus;

import core.stdc.stdio;
import core.sys.posix.sys.uio;

extern (C):
@nogc:
nothrow:

struct _sd_useless_struct_to_allow_trailing_semicolon_;

struct sd_bus;
struct sd_bus_message;
struct sd_bus_slot;
struct sd_bus_creds;
struct sd_bus_track;

struct sd_bus_error
{
    const(char)* name;
    const(char)* message;
    int _need_free;
}

struct sd_bus_error_map
{
    const(char)* name;
    int code;
}

enum _Anonymous_0
{
    SD_BUS_CREDS_PID = 1UL L << 0,
    SD_BUS_CREDS_TID = 1UL L << 1,
    SD_BUS_CREDS_PPID = 1UL L << 2,
    SD_BUS_CREDS_UID = 1UL L << 3,
    SD_BUS_CREDS_EUID = 1UL L << 4,
    SD_BUS_CREDS_SUID = 1UL L << 5,
    SD_BUS_CREDS_FSUID = 1UL L << 6,
    SD_BUS_CREDS_GID = 1UL L << 7,
    SD_BUS_CREDS_EGID = 1UL L << 8,
    SD_BUS_CREDS_SGID = 1UL L << 9,
    SD_BUS_CREDS_FSGID = 1UL L << 10,
    SD_BUS_CREDS_SUPPLEMENTARY_GIDS = 1UL L << 11,
    SD_BUS_CREDS_COMM = 1UL L << 12,
    SD_BUS_CREDS_TID_COMM = 1UL L << 13,
    SD_BUS_CREDS_EXE = 1UL L << 14,
    SD_BUS_CREDS_CMDLINE = 1UL L << 15,
    SD_BUS_CREDS_CGROUP = 1UL L << 16,
    SD_BUS_CREDS_UNIT = 1UL L << 17,
    SD_BUS_CREDS_SLICE = 1UL L << 18,
    SD_BUS_CREDS_USER_UNIT = 1UL L << 19,
    SD_BUS_CREDS_USER_SLICE = 1UL L << 20,
    SD_BUS_CREDS_SESSION = 1UL L << 21,
    SD_BUS_CREDS_OWNER_UID = 1UL L << 22,
    SD_BUS_CREDS_EFFECTIVE_CAPS = 1UL L << 23,
    SD_BUS_CREDS_PERMITTED_CAPS = 1UL L << 24,
    SD_BUS_CREDS_INHERITABLE_CAPS = 1UL L << 25,
    SD_BUS_CREDS_BOUNDING_CAPS = 1UL L << 26,
    SD_BUS_CREDS_SELINUX_CONTEXT = 1UL L << 27,
    SD_BUS_CREDS_AUDIT_SESSION_ID = 1UL L << 28,
    SD_BUS_CREDS_AUDIT_LOGIN_UID = 1UL L << 29,
    SD_BUS_CREDS_TTY = 1UL L << 30,
    SD_BUS_CREDS_UNIQUE_NAME = 1UL L << 31,
    SD_BUS_CREDS_WELL_KNOWN_NAMES = 1UL L << 32,
    SD_BUS_CREDS_DESCRIPTION = 1UL L << 33,
    SD_BUS_CREDS_AUGMENT = 1UL L << 63,
    _SD_BUS_CREDS_ALL = (1UL L << 34) - 1
}

alias SD_BUS_CREDS_PID = _Anonymous_0.SD_BUS_CREDS_PID;
alias SD_BUS_CREDS_TID = _Anonymous_0.SD_BUS_CREDS_TID;
alias SD_BUS_CREDS_PPID = _Anonymous_0.SD_BUS_CREDS_PPID;
alias SD_BUS_CREDS_UID = _Anonymous_0.SD_BUS_CREDS_UID;
alias SD_BUS_CREDS_EUID = _Anonymous_0.SD_BUS_CREDS_EUID;
alias SD_BUS_CREDS_SUID = _Anonymous_0.SD_BUS_CREDS_SUID;
alias SD_BUS_CREDS_FSUID = _Anonymous_0.SD_BUS_CREDS_FSUID;
alias SD_BUS_CREDS_GID = _Anonymous_0.SD_BUS_CREDS_GID;
alias SD_BUS_CREDS_EGID = _Anonymous_0.SD_BUS_CREDS_EGID;
alias SD_BUS_CREDS_SGID = _Anonymous_0.SD_BUS_CREDS_SGID;
alias SD_BUS_CREDS_FSGID = _Anonymous_0.SD_BUS_CREDS_FSGID;
alias SD_BUS_CREDS_SUPPLEMENTARY_GIDS = _Anonymous_0.SD_BUS_CREDS_SUPPLEMENTARY_GIDS;
alias SD_BUS_CREDS_COMM = _Anonymous_0.SD_BUS_CREDS_COMM;
alias SD_BUS_CREDS_TID_COMM = _Anonymous_0.SD_BUS_CREDS_TID_COMM;
alias SD_BUS_CREDS_EXE = _Anonymous_0.SD_BUS_CREDS_EXE;
alias SD_BUS_CREDS_CMDLINE = _Anonymous_0.SD_BUS_CREDS_CMDLINE;
alias SD_BUS_CREDS_CGROUP = _Anonymous_0.SD_BUS_CREDS_CGROUP;
alias SD_BUS_CREDS_UNIT = _Anonymous_0.SD_BUS_CREDS_UNIT;
alias SD_BUS_CREDS_SLICE = _Anonymous_0.SD_BUS_CREDS_SLICE;
alias SD_BUS_CREDS_USER_UNIT = _Anonymous_0.SD_BUS_CREDS_USER_UNIT;
alias SD_BUS_CREDS_USER_SLICE = _Anonymous_0.SD_BUS_CREDS_USER_SLICE;
alias SD_BUS_CREDS_SESSION = _Anonymous_0.SD_BUS_CREDS_SESSION;
alias SD_BUS_CREDS_OWNER_UID = _Anonymous_0.SD_BUS_CREDS_OWNER_UID;
alias SD_BUS_CREDS_EFFECTIVE_CAPS = _Anonymous_0.SD_BUS_CREDS_EFFECTIVE_CAPS;
alias SD_BUS_CREDS_PERMITTED_CAPS = _Anonymous_0.SD_BUS_CREDS_PERMITTED_CAPS;
alias SD_BUS_CREDS_INHERITABLE_CAPS = _Anonymous_0.SD_BUS_CREDS_INHERITABLE_CAPS;
alias SD_BUS_CREDS_BOUNDING_CAPS = _Anonymous_0.SD_BUS_CREDS_BOUNDING_CAPS;
alias SD_BUS_CREDS_SELINUX_CONTEXT = _Anonymous_0.SD_BUS_CREDS_SELINUX_CONTEXT;
alias SD_BUS_CREDS_AUDIT_SESSION_ID = _Anonymous_0.SD_BUS_CREDS_AUDIT_SESSION_ID;
alias SD_BUS_CREDS_AUDIT_LOGIN_UID = _Anonymous_0.SD_BUS_CREDS_AUDIT_LOGIN_UID;
alias SD_BUS_CREDS_TTY = _Anonymous_0.SD_BUS_CREDS_TTY;
alias SD_BUS_CREDS_UNIQUE_NAME = _Anonymous_0.SD_BUS_CREDS_UNIQUE_NAME;
alias SD_BUS_CREDS_WELL_KNOWN_NAMES = _Anonymous_0.SD_BUS_CREDS_WELL_KNOWN_NAMES;
alias SD_BUS_CREDS_DESCRIPTION = _Anonymous_0.SD_BUS_CREDS_DESCRIPTION;
alias SD_BUS_CREDS_AUGMENT = _Anonymous_0.SD_BUS_CREDS_AUGMENT;
alias _SD_BUS_CREDS_ALL = _Anonymous_0._SD_BUS_CREDS_ALL;

enum _Anonymous_1
{
    SD_BUS_NAME_REPLACE_EXISTING = 1UL L << 0,
    SD_BUS_NAME_ALLOW_REPLACEMENT = 1UL L << 1,
    SD_BUS_NAME_QUEUE = 1UL L << 2
}

alias SD_BUS_NAME_REPLACE_EXISTING = _Anonymous_1.SD_BUS_NAME_REPLACE_EXISTING;
alias SD_BUS_NAME_ALLOW_REPLACEMENT = _Anonymous_1.SD_BUS_NAME_ALLOW_REPLACEMENT;
alias SD_BUS_NAME_QUEUE = _Anonymous_1.SD_BUS_NAME_QUEUE;

enum _Anonymous_2
{
    SD_BUS_MESSAGE_DUMP_WITH_HEADER = 1UL L << 0,
    SD_BUS_MESSAGE_DUMP_SUBTREE_ONLY = 1UL L << 1
}

alias SD_BUS_MESSAGE_DUMP_WITH_HEADER = _Anonymous_2.SD_BUS_MESSAGE_DUMP_WITH_HEADER;
alias SD_BUS_MESSAGE_DUMP_SUBTREE_ONLY = _Anonymous_2.SD_BUS_MESSAGE_DUMP_SUBTREE_ONLY;

alias sd_bus_message_handler_t = int function(sd_bus_message * m,
        void * userdata, sd_bus_error * ret_error);
alias sd_bus_property_get_t = int function(sd_bus * bus, const(char) * path,
        const(char) * interface_, const(char) * property, sd_bus_message * reply,
        void * userdata, sd_bus_error * ret_error);
alias sd_bus_property_set_t = int function(sd_bus * bus, const(char) * path,
        const(char) * interface_, const(char) * property, sd_bus_message * value,
        void * userdata, sd_bus_error * ret_error);
alias sd_bus_object_find_t = int function(sd_bus * bus, const(char) * path,
        const(char) * interface_, void * userdata, void *  * ret_found, sd_bus_error * ret_error);
alias sd_bus_node_enumerator_t = int function(sd_bus * bus, const(char) * prefix,
        void * userdata, char *  *  * ret_nodes, sd_bus_error * ret_error);
alias sd_bus_track_handler_t = int function(sd_bus_track * track, void * userdata);
alias sd_bus_destroy_t = void function();

int sd_bus_interface_name_is_valid(const(char) * p);
int sd_bus_service_name_is_valid(const(char) * p);
int sd_bus_member_name_is_valid(const(char) * p);
int sd_bus_object_path_is_valid(const(char) * p);

int sd_bus_default(sd_bus *  * ret);
int sd_bus_default_user(sd_bus *  * ret);
int sd_bus_default_system(sd_bus *  * ret);

int sd_bus_open(sd_bus *  * ret);
int sd_bus_open_with_description(sd_bus *  * ret, const(char) * description);
int sd_bus_open_user(sd_bus *  * ret);
int sd_bus_open_user_with_description(sd_bus *  * ret, const(char) * description);
int sd_bus_open_user_machine(sd_bus *  * ret, const(char) * machine);
int sd_bus_open_system(sd_bus *  * ret);
int sd_bus_open_system_with_description(sd_bus *  * ret, const(char) * description);
int sd_bus_open_system_remote(sd_bus *  * ret, const(char) * host);
int sd_bus_open_system_machine(sd_bus *  * ret, const(char) * machine);

int sd_bus_new(sd_bus *  * ret);

int sd_bus_set_address(sd_bus * bus, const(char) * address);
int sd_bus_set_fd(sd_bus * bus, int input_fd, int output_fd);
int sd_bus_set_exec(sd_bus * bus, const(char) * path, char *  * argv);
int sd_bus_get_address(sd_bus * bus, const(char * ) * address);
int sd_bus_set_bus_client(sd_bus * bus, int b);
int sd_bus_is_bus_client(sd_bus * bus);
int sd_bus_set_server(sd_bus * bus, int b, sd_id128_t bus_id);
int sd_bus_is_server(sd_bus * bus);
int sd_bus_set_anonymous(sd_bus * bus, int b);
int sd_bus_is_anonymous(sd_bus * bus);
int sd_bus_set_trusted(sd_bus * bus, int b);
int sd_bus_is_trusted(sd_bus * bus);
int sd_bus_set_monitor(sd_bus * bus, int b);
int sd_bus_is_monitor(sd_bus * bus);
int sd_bus_set_description(sd_bus * bus, const(char) * description);
int sd_bus_get_description(sd_bus * bus, const(char * ) * description);
int sd_bus_negotiate_creds(sd_bus * bus, int b, ulong creds_mask);
int sd_bus_negotiate_timestamp(sd_bus * bus, int b);
int sd_bus_negotiate_fds(sd_bus * bus, int b);
int sd_bus_can_send(sd_bus * bus, char type);
int sd_bus_get_creds_mask(sd_bus * bus, ulong * creds_mask);
int sd_bus_set_allow_interactive_authorization(sd_bus * bus, int b);
int sd_bus_get_allow_interactive_authorization(sd_bus * bus);
int sd_bus_set_exit_on_disconnect(sd_bus * bus, int b);
int sd_bus_get_exit_on_disconnect(sd_bus * bus);
int sd_bus_set_close_on_exit(sd_bus * bus, int b);
int sd_bus_get_close_on_exit(sd_bus * bus);
int sd_bus_set_watch_bind(sd_bus * bus, int b);
int sd_bus_get_watch_bind(sd_bus * bus);
int sd_bus_set_connected_signal(sd_bus * bus, int b);
int sd_bus_get_connected_signal(sd_bus * bus);
int sd_bus_set_sender(sd_bus * bus, const(char) * sender);
int sd_bus_get_sender(sd_bus * bus, const(char * ) * ret);

int sd_bus_start(sd_bus * bus);

int sd_bus_try_close(sd_bus * bus);
void sd_bus_close(sd_bus * bus);

sd_bus * sd_bus_ref(sd_bus * bus);
sd_bus * sd_bus_unref(sd_bus * bus);
sd_bus * sd_bus_close_unref(sd_bus * bus);
sd_bus * sd_bus_flush_close_unref(sd_bus * bus);

void sd_bus_default_flush_close();

int sd_bus_is_open(sd_bus * bus);
int sd_bus_is_ready(sd_bus * bus);

int sd_bus_get_bus_id(sd_bus * bus, sd_id128_t * id);
int sd_bus_get_scope(sd_bus * bus, const(char * ) * scope_);
int sd_bus_get_tid(sd_bus * bus, pid_t * tid);
int sd_bus_get_owner_creds(sd_bus * bus, ulong creds_mask, sd_bus_creds *  * ret);

int sd_bus_send(sd_bus * bus, sd_bus_message * m, ulong * cookie);
int sd_bus_send_to(sd_bus * bus, sd_bus_message * m, const(char) * destination, ulong * cookie);
int sd_bus_call(sd_bus * bus, sd_bus_message * m, ulong usec,
        sd_bus_error * ret_error, sd_bus_message *  * reply);
int sd_bus_call_async(sd_bus * bus, sd_bus_slot *  * slot, sd_bus_message * m,
        sd_bus_message_handler_t callback, void * userdata, ulong usec);

int sd_bus_get_fd(sd_bus * bus);
int sd_bus_get_events(sd_bus * bus);
int sd_bus_get_timeout(sd_bus * bus, ulong * timeout_usec);
int sd_bus_process(sd_bus * bus, sd_bus_message *  * r);
int sd_bus_process_priority(sd_bus * bus, long max_priority, sd_bus_message *  * r);
int sd_bus_wait(sd_bus * bus, ulong timeout_usec);
int sd_bus_flush(sd_bus * bus);
int sd_bus_enqueue_for_read(sd_bus * bus, sd_bus_message * m);

sd_bus_slot * sd_bus_get_current_slot(sd_bus * bus);
sd_bus_message * sd_bus_get_current_message(sd_bus * bus);
sd_bus_message_handler_t sd_bus_get_current_handler(sd_bus * bus);
void * sd_bus_get_current_userdata(sd_bus * bus);

int sd_bus_attach_event(sd_bus * bus, sd_event * e, int priority);
int sd_bus_detach_event(sd_bus * bus);
sd_event * sd_bus_get_event(sd_bus * bus);

int sd_bus_get_n_queued_read(sd_bus * bus, ulong * ret);
int sd_bus_get_n_queued_write(sd_bus * bus, ulong * ret);

int sd_bus_set_method_call_timeout(sd_bus * bus, ulong usec);
int sd_bus_get_method_call_timeout(sd_bus * bus, ulong * ret);

int sd_bus_add_filter(sd_bus * bus, sd_bus_slot *  * slot,
        sd_bus_message_handler_t callback, void * userdata);
int sd_bus_add_match(sd_bus * bus, sd_bus_slot *  * slot, const(char) * match,
        sd_bus_message_handler_t callback, void * userdata);
int sd_bus_add_match_async(sd_bus * bus, sd_bus_slot *  * slot, const(char) * match,
        sd_bus_message_handler_t callback, sd_bus_message_handler_t install_callback,
        void * userdata);
int sd_bus_add_object(sd_bus * bus, sd_bus_slot *  * slot, const(char) * path,
        sd_bus_message_handler_t callback, void * userdata);
int sd_bus_add_fallback(sd_bus * bus, sd_bus_slot *  * slot, const(char) * prefix,
        sd_bus_message_handler_t callback, void * userdata);
int sd_bus_add_object_vtable(sd_bus * bus, sd_bus_slot *  * slot, const(char) * path,
        const(char) * interface_, const(sd_bus_vtable) * vtable, void * userdata);
int sd_bus_add_fallback_vtable(sd_bus * bus, sd_bus_slot *  * slot, const(char) * prefix,
        const(char) * interface_, const(sd_bus_vtable) * vtable,
        sd_bus_object_find_t find, void * userdata);
int sd_bus_add_node_enumerator(sd_bus * bus, sd_bus_slot *  * slot,
        const(char) * path, sd_bus_node_enumerator_t callback, void * userdata);
int sd_bus_add_object_manager(sd_bus * bus, sd_bus_slot *  * slot, const(char) * path);

sd_bus_slot * sd_bus_slot_ref(sd_bus_slot * slot);
sd_bus_slot * sd_bus_slot_unref(sd_bus_slot * slot);

sd_bus * sd_bus_slot_get_bus(sd_bus_slot * slot);
void * sd_bus_slot_get_userdata(sd_bus_slot * slot);
void * sd_bus_slot_set_userdata(sd_bus_slot * slot, void * userdata);
int sd_bus_slot_set_description(sd_bus_slot * slot, const(char) * description);
int sd_bus_slot_get_description(sd_bus_slot * slot, const(char * ) * description);
int sd_bus_slot_get_floating(sd_bus_slot * slot);
int sd_bus_slot_set_floating(sd_bus_slot * slot, int b);
int sd_bus_slot_set_destroy_callback(sd_bus_slot * s, sd_bus_destroy_t callback);
int sd_bus_slot_get_destroy_callback(sd_bus_slot * s, sd_bus_destroy_t * callback);

sd_bus_message * sd_bus_slot_get_current_message(sd_bus_slot * slot);
sd_bus_message_handler_t sd_bus_slot_get_current_handler(sd_bus_slot * slot);
void * sd_bus_slot_get_current_userdata(sd_bus_slot * slot);

int sd_bus_message_new(sd_bus * bus, sd_bus_message *  * m, ubyte type);
int sd_bus_message_new_signal(sd_bus * bus, sd_bus_message *  * m,
        const(char) * path, const(char) * interface_, const(char) * member);
int sd_bus_message_new_method_call(sd_bus * bus, sd_bus_message *  * m,
        const(char) * destination, const(char) * path,
        const(char) * interface_, const(char) * member);
int sd_bus_message_new_method_return(sd_bus_message * call, sd_bus_message *  * m);
int sd_bus_message_new_method_error(sd_bus_message * call, sd_bus_message *  * m,
        const(sd_bus_error) * e);
int sd_bus_message_new_method_errorf(sd_bus_message * call, sd_bus_message *  * m,
        const(char) * name, const(char) * format, ...);
int sd_bus_message_new_method_errno(sd_bus_message * call, sd_bus_message *  * m,
        int error, const(sd_bus_error) * e);
int sd_bus_message_new_method_errnof(sd_bus_message * call, sd_bus_message *  * m,
        int error, const(char) * format, ...);

sd_bus_message * sd_bus_message_ref(sd_bus_message * m);
sd_bus_message * sd_bus_message_unref(sd_bus_message * m);

int sd_bus_message_seal(sd_bus_message * m, ulong cookie, ulong timeout_usec);

int sd_bus_message_get_type(sd_bus_message * m, ubyte * type);
int sd_bus_message_get_cookie(sd_bus_message * m, ulong * cookie);
int sd_bus_message_get_reply_cookie(sd_bus_message * m, ulong * cookie);
int sd_bus_message_get_priority(sd_bus_message * m, long * priority);

int sd_bus_message_get_expect_reply(sd_bus_message * m);
int sd_bus_message_get_auto_start(sd_bus_message * m);
int sd_bus_message_get_allow_interactive_authorization(sd_bus_message * m);

const(char) * sd_bus_message_get_signature(sd_bus_message * m, int complete);
const(char) * sd_bus_message_get_path(sd_bus_message * m);
const(char) * sd_bus_message_get_interface(sd_bus_message * m);
const(char) * sd_bus_message_get_member(sd_bus_message * m);
const(char) * sd_bus_message_get_destination(sd_bus_message * m);
const(char) * sd_bus_message_get_sender(sd_bus_message * m);
const(sd_bus_error) * sd_bus_message_get_error(sd_bus_message * m);
int sd_bus_message_get_errno(sd_bus_message * m);

int sd_bus_message_get_monotonic_usec(sd_bus_message * m, ulong * usec);
int sd_bus_message_get_realtime_usec(sd_bus_message * m, ulong * usec);
int sd_bus_message_get_seqnum(sd_bus_message * m, ulong * seqnum);

sd_bus * sd_bus_message_get_bus(sd_bus_message * m);
sd_bus_creds * sd_bus_message_get_creds(sd_bus_message * m);

int sd_bus_message_is_signal(sd_bus_message * m, const(char) * interface_, const(char) * member);
int sd_bus_message_is_method_call(sd_bus_message * m, const(char) * interface_, const(char) * member);
int sd_bus_message_is_method_error(sd_bus_message * m, const(char) * name);
int sd_bus_message_is_empty(sd_bus_message * m);
int sd_bus_message_has_signature(sd_bus_message * m, const(char) * signature);

int sd_bus_message_set_expect_reply(sd_bus_message * m, int b);
int sd_bus_message_set_auto_start(sd_bus_message * m, int b);
int sd_bus_message_set_allow_interactive_authorization(sd_bus_message * m, int b);

int sd_bus_message_set_destination(sd_bus_message * m, const(char) * destination);
int sd_bus_message_set_sender(sd_bus_message * m, const(char) * sender);
int sd_bus_message_set_priority(sd_bus_message * m, long priority);

int sd_bus_message_append(sd_bus_message * m, const(char) * types, ...);
int sd_bus_message_appendv(sd_bus_message * m, const(char) * types, va_list ap);
int sd_bus_message_append_basic(sd_bus_message * m, char type, const(void) * p);
int sd_bus_message_append_array(sd_bus_message * m, char type, const(void) * ptr, size_t size);
int sd_bus_message_append_array_space(sd_bus_message * m, char type, size_t size, void *  * ptr);
int sd_bus_message_append_array_iovec(sd_bus_message * m, char type, const(iovec) * iov, uint n);
int sd_bus_message_append_array_memfd(sd_bus_message * m, char type, int memfd,
        ulong offset, ulong size);
int sd_bus_message_append_string_space(sd_bus_message * m, size_t size, char *  * s);
int sd_bus_message_append_string_iovec(sd_bus_message * m, const(iovec) * iov, uint n);
int sd_bus_message_append_string_memfd(sd_bus_message * m, int memfd, ulong offset, ulong size);
int sd_bus_message_append_strv(sd_bus_message * m, char *  * l);
int sd_bus_message_open_container(sd_bus_message * m, char type, const(char) * contents);
int sd_bus_message_close_container(sd_bus_message * m);
int sd_bus_message_copy(sd_bus_message * m, sd_bus_message * source, int all);

int sd_bus_message_read(sd_bus_message * m, const(char) * types, ...);
int sd_bus_message_readv(sd_bus_message * m, const(char) * types, va_list ap);
int sd_bus_message_read_basic(sd_bus_message * m, char type, void * p);
int sd_bus_message_read_array(sd_bus_message * m, char type, const(void * ) * ptr, size_t * size);
int sd_bus_message_read_strv(sd_bus_message * m, char *  *  * l);
int sd_bus_message_skip(sd_bus_message * m, const(char) * types);
int sd_bus_message_enter_container(sd_bus_message * m, char type, const(char) * contents);
int sd_bus_message_exit_container(sd_bus_message * m);
int sd_bus_message_peek_type(sd_bus_message * m, char * type, const(char * ) * contents);
int sd_bus_message_verify_type(sd_bus_message * m, char type, const(char) * contents);
int sd_bus_message_at_end(sd_bus_message * m, int complete);
int sd_bus_message_rewind(sd_bus_message * m, int complete);
int sd_bus_message_sensitive(sd_bus_message * m);

int sd_bus_message_dump(sd_bus_message * m, FILE * f, ulong flags);

int sd_bus_get_unique_name(sd_bus * bus, const(char * ) * unique);
int sd_bus_request_name(sd_bus * bus, const(char) * name, ulong flags);
int sd_bus_request_name_async(sd_bus * bus, sd_bus_slot *  * ret_slot,
        const(char) * name, ulong flags, sd_bus_message_handler_t callback, void * userdata);
int sd_bus_release_name(sd_bus * bus, const(char) * name);
int sd_bus_release_name_async(sd_bus * bus, sd_bus_slot *  * ret_slot,
        const(char) * name, sd_bus_message_handler_t callback, void * userdata);
int sd_bus_list_names(sd_bus * bus, char *  *  * acquired, char *  *  * activatable);
int sd_bus_get_name_creds(sd_bus * bus, const(char) * name, ulong mask, sd_bus_creds *  * creds);
int sd_bus_get_name_machine_id(sd_bus * bus, const(char) * name, sd_id128_t * machine);

int sd_bus_message_send(sd_bus_message * m);
int sd_bus_call_methodv(sd_bus * bus, const(char) * destination,
        const(char) * path, const(char) * interface_, const(char) * member,
        sd_bus_error * ret_error, sd_bus_message *  * reply, const(char) * types, va_list ap);
int sd_bus_call_method(sd_bus * bus, const(char) * destination,
        const(char) * path, const(char) * interface_, const(char) * member,
        sd_bus_error * ret_error, sd_bus_message *  * reply, const(char) * types, ...);
int sd_bus_call_method_asyncv(sd_bus * bus, sd_bus_slot *  * slot,
        const(char) * destination, const(char) * path, const(char) * interface_,
        const(char) * member, sd_bus_message_handler_t callback, void * userdata,
        const(char) * types, va_list ap);
int sd_bus_call_method_async(sd_bus * bus, sd_bus_slot *  * slot,
        const(char) * destination, const(char) * path, const(char) * interface_,
        const(char) * member, sd_bus_message_handler_t callback, void * userdata,
        const(char) * types, ...);
int sd_bus_get_property(sd_bus * bus, const(char) * destination,
        const(char) * path, const(char) * interface_, const(char) * member,
        sd_bus_error * ret_error, sd_bus_message *  * reply, const(char) * type);
int sd_bus_get_property_trivial(sd_bus * bus, const(char) * destination,
        const(char) * path, const(char) * interface_, const(char) * member,
        sd_bus_error * ret_error, char type, void * ret_ptr);
int sd_bus_get_property_string(sd_bus * bus, const(char) * destination,
        const(char) * path, const(char) * interface_, const(char) * member,
        sd_bus_error * ret_error, char *  * ret);
int sd_bus_get_property_strv(sd_bus * bus, const(char) * destination,
        const(char) * path, const(char) * interface_, const(char) * member,
        sd_bus_error * ret_error, char *  *  * ret);
int sd_bus_set_propertyv(sd_bus * bus, const(char) * destination,
        const(char) * path, const(char) * interface_, const(char) * member,
        sd_bus_error * ret_error, const(char) * type, va_list ap);
int sd_bus_set_property(sd_bus * bus, const(char) * destination,
        const(char) * path, const(char) * interface_, const(char) * member,
        sd_bus_error * ret_error, const(char) * type, ...);

int sd_bus_reply_method_returnv(sd_bus_message * call, const(char) * types, va_list ap);
int sd_bus_reply_method_return(sd_bus_message * call, const(char) * types, ...);
int sd_bus_reply_method_error(sd_bus_message * call, const(sd_bus_error) * e);
int sd_bus_reply_method_errorfv(sd_bus_message * call, const(char) * name,
        const(char) * format, va_list ap);
int sd_bus_reply_method_errorf(sd_bus_message * call, const(char) * name,
        const(char) * format, ...);
int sd_bus_reply_method_errno(sd_bus_message * call, int error, const(sd_bus_error) * e);
int sd_bus_reply_method_errnofv(sd_bus_message * call, int error, const(char) * format, va_list ap);
int sd_bus_reply_method_errnof(sd_bus_message * call, int error, const(char) * format, ...);

int sd_bus_emit_signalv(sd_bus * bus, const(char) * path,
        const(char) * interface_, const(char) * member, const(char) * types, va_list ap);
int sd_bus_emit_signal(sd_bus * bus, const(char) * path, const(char) * interface_,
        const(char) * member, const(char) * types, ...);

int sd_bus_emit_properties_changed_strv(sd_bus * bus, const(char) * path,
        const(char) * interface_, char *  * names);
int sd_bus_emit_properties_changed(sd_bus * bus, const(char) * path,
        const(char) * interface_, const(char) * name, ...);

int sd_bus_emit_object_added(sd_bus * bus, const(char) * path);
int sd_bus_emit_object_removed(sd_bus * bus, const(char) * path);
int sd_bus_emit_interfaces_added_strv(sd_bus * bus, const(char) * path, char *  * interfaces);
int sd_bus_emit_interfaces_added(sd_bus * bus, const(char) * path, const(char) * interface_, ...);
int sd_bus_emit_interfaces_removed_strv(sd_bus * bus, const(char) * path, char *  * interfaces);
int sd_bus_emit_interfaces_removed(sd_bus * bus, const(char) * path, const(char) * interface_, ...);

int sd_bus_query_sender_creds(sd_bus_message * m, ulong mask, sd_bus_creds *  * creds);
int sd_bus_query_sender_privilege(sd_bus_message * m, int capability);

int sd_bus_match_signal(sd_bus * bus, sd_bus_slot *  * ret, const(char) * sender,
        const(char) * path, const(char) * interface_, const(char) * member,
        sd_bus_message_handler_t callback, void * userdata);
int sd_bus_match_signal_async(sd_bus * bus, sd_bus_slot *  * ret,
        const(char) * sender, const(char) * path, const(char) * interface_, const(char) * member,
        sd_bus_message_handler_t match_callback,
        sd_bus_message_handler_t add_callback, void * userdata);

int sd_bus_creds_new_from_pid(sd_bus_creds *  * ret, pid_t pid, ulong creds_mask);
sd_bus_creds * sd_bus_creds_ref(sd_bus_creds * c);
sd_bus_creds * sd_bus_creds_unref(sd_bus_creds * c);
ulong sd_bus_creds_get_mask(const(sd_bus_creds) * c);
ulong sd_bus_creds_get_augmented_mask(const(sd_bus_creds) * c);

int sd_bus_creds_get_pid(sd_bus_creds * c, pid_t * pid);
int sd_bus_creds_get_ppid(sd_bus_creds * c, pid_t * ppid);
int sd_bus_creds_get_tid(sd_bus_creds * c, pid_t * tid);
int sd_bus_creds_get_uid(sd_bus_creds * c, uid_t * uid);
int sd_bus_creds_get_euid(sd_bus_creds * c, uid_t * euid);
int sd_bus_creds_get_suid(sd_bus_creds * c, uid_t * suid);
int sd_bus_creds_get_fsuid(sd_bus_creds * c, uid_t * fsuid);
int sd_bus_creds_get_gid(sd_bus_creds * c, gid_t * gid);
int sd_bus_creds_get_egid(sd_bus_creds * c, gid_t * egid);
int sd_bus_creds_get_sgid(sd_bus_creds * c, gid_t * sgid);
int sd_bus_creds_get_fsgid(sd_bus_creds * c, gid_t * fsgid);
int sd_bus_creds_get_supplementary_gids(sd_bus_creds * c, const(gid_t * ) * gids);
int sd_bus_creds_get_comm(sd_bus_creds * c, const(char * ) * comm);
int sd_bus_creds_get_tid_comm(sd_bus_creds * c, const(char * ) * comm);
int sd_bus_creds_get_exe(sd_bus_creds * c, const(char * ) * exe);
int sd_bus_creds_get_cmdline(sd_bus_creds * c, char *  *  * cmdline);
int sd_bus_creds_get_cgroup(sd_bus_creds * c, const(char * ) * cgroup);
int sd_bus_creds_get_unit(sd_bus_creds * c, const(char * ) * unit);
int sd_bus_creds_get_slice(sd_bus_creds * c, const(char * ) * slice);
int sd_bus_creds_get_user_unit(sd_bus_creds * c, const(char * ) * unit);
int sd_bus_creds_get_user_slice(sd_bus_creds * c, const(char * ) * slice);
int sd_bus_creds_get_session(sd_bus_creds * c, const(char * ) * session);
int sd_bus_creds_get_owner_uid(sd_bus_creds * c, uid_t * uid);
int sd_bus_creds_has_effective_cap(sd_bus_creds * c, int capability);
int sd_bus_creds_has_permitted_cap(sd_bus_creds * c, int capability);
int sd_bus_creds_has_inheritable_cap(sd_bus_creds * c, int capability);
int sd_bus_creds_has_bounding_cap(sd_bus_creds * c, int capability);
int sd_bus_creds_get_selinux_context(sd_bus_creds * c, const(char * ) * context);
int sd_bus_creds_get_audit_session_id(sd_bus_creds * c, uint * sessionid);
int sd_bus_creds_get_audit_login_uid(sd_bus_creds * c, uid_t * loginuid);
int sd_bus_creds_get_tty(sd_bus_creds * c, const(char * ) * tty);
int sd_bus_creds_get_unique_name(sd_bus_creds * c, const(char * ) * name);
int sd_bus_creds_get_well_known_names(sd_bus_creds * c, char *  *  * names);
int sd_bus_creds_get_description(sd_bus_creds * c, const(char * ) * name);

void sd_bus_error_free(sd_bus_error * e);
int sd_bus_error_set(sd_bus_error * e, const(char) * name, const(char) * message);
int sd_bus_error_setf(sd_bus_error * e, const(char) * name, const(char) * format, ...);
int sd_bus_error_set_const(sd_bus_error * e, const(char) * name, const(char) * message);
int sd_bus_error_set_errno(sd_bus_error * e, int error);
int sd_bus_error_set_errnof(sd_bus_error * e, int error, const(char) * format, ...);
int sd_bus_error_set_errnofv(sd_bus_error * e, int error, const(char) * format, va_list ap);
int sd_bus_error_get_errno(const(sd_bus_error) * e);
int sd_bus_error_copy(sd_bus_error * dest, const(sd_bus_error) * e);
int sd_bus_error_move(sd_bus_error * dest, sd_bus_error * e);
int sd_bus_error_is_set(const(sd_bus_error) * e);
int sd_bus_error_has_name(const(sd_bus_error) * e, const(char) * name);
int sd_bus_error_has_names_sentinel(const(sd_bus_error) * e, ...);

int sd_bus_error_add_map(const(sd_bus_error_map) * map);

int sd_bus_path_encode(const(char) * prefix, const(char) * external_id, char *  * ret_path);
int sd_bus_path_encode_many(char *  * out_, const(char) * path_template, ...);
int sd_bus_path_decode(const(char) * path, const(char) * prefix, char *  * ret_external_id);
int sd_bus_path_decode_many(const(char) * path, const(char) * path_template, ...);

int sd_bus_track_new(sd_bus * bus, sd_bus_track *  * track,
        sd_bus_track_handler_t handler, void * userdata);
sd_bus_track * sd_bus_track_ref(sd_bus_track * track);
sd_bus_track * sd_bus_track_unref(sd_bus_track * track);

sd_bus * sd_bus_track_get_bus(sd_bus_track * track);
void * sd_bus_track_get_userdata(sd_bus_track * track);
void * sd_bus_track_set_userdata(sd_bus_track * track, void * userdata);

int sd_bus_track_add_sender(sd_bus_track * track, sd_bus_message * m);
int sd_bus_track_remove_sender(sd_bus_track * track, sd_bus_message * m);
int sd_bus_track_add_name(sd_bus_track * track, const(char) * name);
int sd_bus_track_remove_name(sd_bus_track * track, const(char) * name);

int sd_bus_track_set_recursive(sd_bus_track * track, int b);
int sd_bus_track_get_recursive(sd_bus_track * track);

uint sd_bus_track_count(sd_bus_track * track);
int sd_bus_track_count_sender(sd_bus_track * track, sd_bus_message * m);
int sd_bus_track_count_name(sd_bus_track * track, const(char) * name);

const(char) * sd_bus_track_contains(sd_bus_track * track, const(char) * name);
const(char) * sd_bus_track_first(sd_bus_track * track);
const(char) * sd_bus_track_next(sd_bus_track * track);

int sd_bus_track_set_destroy_callback(sd_bus_track * s, sd_bus_destroy_t callback);
int sd_bus_track_get_destroy_callback(sd_bus_track * s, sd_bus_destroy_t * ret);

void sd_bus_unrefp(sd_bus *  * p);
struct _sd_useless_struct_to_allow_trailing_semicolon_;
void sd_bus_close_unrefp(sd_bus *  * p);
struct _sd_useless_struct_to_allow_trailing_semicolon_;
void sd_bus_flush_close_unrefp(sd_bus *  * p);
struct _sd_useless_struct_to_allow_trailing_semicolon_;
void sd_bus_slot_unrefp(sd_bus_slot *  * p);
struct _sd_useless_struct_to_allow_trailing_semicolon_;
void sd_bus_message_unrefp(sd_bus_message *  * p);
struct _sd_useless_struct_to_allow_trailing_semicolon_;
void sd_bus_creds_unrefp(sd_bus_creds *  * p);
struct _sd_useless_struct_to_allow_trailing_semicolon_;
void sd_bus_track_unrefp(sd_bus_track *  * p);
struct _sd_useless_struct_to_allow_trailing_semicolon_;

struct _sd_useless_struct_to_allow_trailing_semicolon_;
