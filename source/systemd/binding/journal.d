module systemd.binding.journal;

import core.stdc.stdarg;
import core.sys.posix.sys.uio;
import systemd.binding.common;
import systemd.binding.id128;

extern (C):
@nogc:
nothrow:

int sd_journal_print(int priority, const(char)* format, ...);
int sd_journal_printv(int priority, const(char)* format, va_list ap);
int sd_journal_send(const(char)* format, ...);
int sd_journal_sendv(const(iovec)* iov, int n);
int sd_journal_perror(const(char)* message);

int sd_journal_print_with_location(int priority, const(char)* file,
        const(char)* line, const(char)* func, const(char)* format, ...);
int sd_journal_printv_with_location(int priority, const(char)* file,
        const(char)* line, const(char)* func, const(char)* format, va_list ap);
int sd_journal_send_with_location(const(char)* file, const(char)* line,
        const(char)* func, const(char)* format, ...);
int sd_journal_sendv_with_location(const(char)* file, const(char)* line,
        const(char)* func, const(iovec)* iov, int n);
int sd_journal_perror_with_location(const(char)* file, const(char)* line,
        const(char)* func, const(char)* message);

int sd_journal_stream_fd(const(char)* identifier, int priority, int level_prefix);

struct sd_journal;

enum _Anonymous_0
{
    SD_JOURNAL_LOCAL_ONLY = 1 << 0,
    SD_JOURNAL_RUNTIME_ONLY = 1 << 1,
    SD_JOURNAL_SYSTEM = 1 << 2,
    SD_JOURNAL_CURRENT_USER = 1 << 3,
    SD_JOURNAL_OS_ROOT = 1 << 4,
    SD_JOURNAL_ALL_NAMESPACES = 1 << 5,
    SD_JOURNAL_INCLUDE_DEFAULT_NAMESPACE = 1 << 6,

    SD_JOURNAL_SYSTEM_ONLY = 4
}

alias SD_JOURNAL_LOCAL_ONLY = _Anonymous_0.SD_JOURNAL_LOCAL_ONLY;
alias SD_JOURNAL_RUNTIME_ONLY = _Anonymous_0.SD_JOURNAL_RUNTIME_ONLY;
alias SD_JOURNAL_SYSTEM = _Anonymous_0.SD_JOURNAL_SYSTEM;
alias SD_JOURNAL_CURRENT_USER = _Anonymous_0.SD_JOURNAL_CURRENT_USER;
alias SD_JOURNAL_OS_ROOT = _Anonymous_0.SD_JOURNAL_OS_ROOT;
alias SD_JOURNAL_ALL_NAMESPACES = _Anonymous_0.SD_JOURNAL_ALL_NAMESPACES;
alias SD_JOURNAL_INCLUDE_DEFAULT_NAMESPACE = _Anonymous_0.SD_JOURNAL_INCLUDE_DEFAULT_NAMESPACE;
alias SD_JOURNAL_SYSTEM_ONLY = _Anonymous_0.SD_JOURNAL_SYSTEM_ONLY;

enum _Anonymous_1
{
    SD_JOURNAL_NOP = 0,
    SD_JOURNAL_APPEND = 1,
    SD_JOURNAL_INVALIDATE = 2
}

alias SD_JOURNAL_NOP = _Anonymous_1.SD_JOURNAL_NOP;
alias SD_JOURNAL_APPEND = _Anonymous_1.SD_JOURNAL_APPEND;
alias SD_JOURNAL_INVALIDATE = _Anonymous_1.SD_JOURNAL_INVALIDATE;

int sd_journal_open(sd_journal** ret, int flags);
int sd_journal_open_namespace(sd_journal** ret, const(char)* name_space, int flags);
int sd_journal_open_directory(sd_journal** ret, const(char)* path, int flags);
int sd_journal_open_directory_fd(sd_journal** ret, int fd, int flags);
int sd_journal_open_files(sd_journal** ret, const(char*)* paths, int flags);
int sd_journal_open_files_fd(sd_journal** ret, int* fds, uint n_fds, int flags);
int sd_journal_open_container(sd_journal** ret, const(char)* machine, int flags);
void sd_journal_close(sd_journal* j);

int sd_journal_previous(sd_journal* j);
int sd_journal_next(sd_journal* j);

int sd_journal_previous_skip(sd_journal* j, ulong skip);
int sd_journal_next_skip(sd_journal* j, ulong skip);

int sd_journal_get_realtime_usec(sd_journal* j, ulong* ret);
int sd_journal_get_monotonic_usec(sd_journal* j, ulong* ret, sd_id128_t* ret_boot_id);

int sd_journal_set_data_threshold(sd_journal* j, size_t sz);
int sd_journal_get_data_threshold(sd_journal* j, size_t* sz);

int sd_journal_get_data(sd_journal* j, const(char)* field, const(void*)* data, size_t* l);
int sd_journal_enumerate_data(sd_journal* j, const(void*)* data, size_t* l);
int sd_journal_enumerate_available_data(sd_journal* j, const(void*)* data, size_t* l);
void sd_journal_restart_data(sd_journal* j);

int sd_journal_add_match(sd_journal* j, const(void)* data, size_t size);
int sd_journal_add_disjunction(sd_journal* j);
int sd_journal_add_conjunction(sd_journal* j);
void sd_journal_flush_matches(sd_journal* j);

int sd_journal_seek_head(sd_journal* j);
int sd_journal_seek_tail(sd_journal* j);
int sd_journal_seek_monotonic_usec(sd_journal* j, sd_id128_t boot_id, ulong usec);
int sd_journal_seek_realtime_usec(sd_journal* j, ulong usec);
int sd_journal_seek_cursor(sd_journal* j, const(char)* cursor);

int sd_journal_get_cursor(sd_journal* j, char** cursor);
int sd_journal_test_cursor(sd_journal* j, const(char)* cursor);

int sd_journal_get_cutoff_realtime_usec(sd_journal* j, ulong* from, ulong* to);
int sd_journal_get_cutoff_monotonic_usec(sd_journal* j, const sd_id128_t boot_id,
        ulong* from, ulong* to);

int sd_journal_get_usage(sd_journal* j, ulong* bytes);

int sd_journal_query_unique(sd_journal* j, const(char)* field);
int sd_journal_enumerate_unique(sd_journal* j, const(void*)* data, size_t* l);
int sd_journal_enumerate_available_unique(sd_journal* j, const(void*)* data, size_t* l);
void sd_journal_restart_unique(sd_journal* j);

int sd_journal_enumerate_fields(sd_journal* j, const(char*)* field);
void sd_journal_restart_fields(sd_journal* j);

int sd_journal_get_fd(sd_journal* j);
int sd_journal_get_events(sd_journal* j);
int sd_journal_get_timeout(sd_journal* j, ulong* timeout_usec);
int sd_journal_process(sd_journal* j);
int sd_journal_wait(sd_journal* j, ulong timeout_usec);
int sd_journal_reliable_fd(sd_journal* j);

int sd_journal_get_catalog(sd_journal* j, char** text);
int sd_journal_get_catalog_for_message_id(sd_id128_t id, char** text);

int sd_journal_has_runtime_files(sd_journal* j);
int sd_journal_has_persistent_files(sd_journal* j);

void sd_journal_closep(sd_journal** p);
