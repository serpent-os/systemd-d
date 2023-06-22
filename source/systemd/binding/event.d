module systemd.binding.event;

import core.stdc.stdarg;
import core.stdc.time;
import core.sys.linux.sys.inotify;
import core.sys.linux.sys.signalfd;
import core.sys.posix.sys.wait;
import systemd.binding.common;
import systemd.binding.id128;

extern (C):
@nogc:
nothrow:

struct sd_event;
struct sd_event_source;

enum _Anonymous_0
{
    SD_EVENT_OFF = 0,
    SD_EVENT_ON = 1,
    SD_EVENT_ONESHOT = -1
}

alias SD_EVENT_OFF = _Anonymous_0.SD_EVENT_OFF;
alias SD_EVENT_ON = _Anonymous_0.SD_EVENT_ON;
alias SD_EVENT_ONESHOT = _Anonymous_0.SD_EVENT_ONESHOT;

enum _Anonymous_1
{
    SD_EVENT_INITIAL = 0,
    SD_EVENT_ARMED = 1,
    SD_EVENT_PENDING = 2,
    SD_EVENT_RUNNING = 3,
    SD_EVENT_EXITING = 4,
    SD_EVENT_FINISHED = 5,
    SD_EVENT_PREPARING = 6
}

alias SD_EVENT_INITIAL = _Anonymous_1.SD_EVENT_INITIAL;
alias SD_EVENT_ARMED = _Anonymous_1.SD_EVENT_ARMED;
alias SD_EVENT_PENDING = _Anonymous_1.SD_EVENT_PENDING;
alias SD_EVENT_RUNNING = _Anonymous_1.SD_EVENT_RUNNING;
alias SD_EVENT_EXITING = _Anonymous_1.SD_EVENT_EXITING;
alias SD_EVENT_FINISHED = _Anonymous_1.SD_EVENT_FINISHED;
alias SD_EVENT_PREPARING = _Anonymous_1.SD_EVENT_PREPARING;

enum _Anonymous_2
{
    SD_EVENT_PRIORITY_IMPORTANT = -100,
    SD_EVENT_PRIORITY_NORMAL = 0,
    SD_EVENT_PRIORITY_IDLE = 100
}

alias SD_EVENT_PRIORITY_IMPORTANT = _Anonymous_2.SD_EVENT_PRIORITY_IMPORTANT;
alias SD_EVENT_PRIORITY_NORMAL = _Anonymous_2.SD_EVENT_PRIORITY_NORMAL;
alias SD_EVENT_PRIORITY_IDLE = _Anonymous_2.SD_EVENT_PRIORITY_IDLE;

alias sd_event_handler_t = int function(sd_event_source* s, void* userdata);
alias sd_event_io_handler_t = int function(sd_event_source* s, int fd, uint revents, void* userdata);
alias sd_event_time_handler_t = int function(sd_event_source* s, ulong usec, void* userdata);
alias sd_event_signal_handler_t = int function(sd_event_source* s,
        const(signalfd_siginfo)* si, void* userdata);
alias sd_event_child_handler_t = int function(sd_event_source* s,
        const(siginfo_t)* si, void* userdata);

alias sd_event_inotify_handler_t = int function(sd_event_source* s,
        const(inotify_event)* event, void* userdata);
alias sd_event_destroy_t = void function();

int sd_event_default(sd_event** e);

int sd_event_new(sd_event** e);
sd_event* sd_event_ref(sd_event* e);
sd_event* sd_event_unref(sd_event* e);

int sd_event_add_io(sd_event* e, sd_event_source** s, int fd, uint events,
        sd_event_io_handler_t callback, void* userdata);
int sd_event_add_time(sd_event* e, sd_event_source** s, clockid_t clock,
        ulong usec, ulong accuracy, sd_event_time_handler_t callback, void* userdata);
int sd_event_add_time_relative(sd_event* e, sd_event_source** s, clockid_t clock,
        ulong usec, ulong accuracy, sd_event_time_handler_t callback, void* userdata);
int sd_event_add_signal(sd_event* e, sd_event_source** s, int sig,
        sd_event_signal_handler_t callback, void* userdata);
int sd_event_add_child(sd_event* e, sd_event_source** s, pid_t pid, int options,
        sd_event_child_handler_t callback, void* userdata);
int sd_event_add_child_pidfd(sd_event* e, sd_event_source** s, int pidfd,
        int options, sd_event_child_handler_t callback, void* userdata);
int sd_event_add_inotify(sd_event* e, sd_event_source** s, const(char)* path,
        uint mask, sd_event_inotify_handler_t callback, void* userdata);
int sd_event_add_inotify_fd(sd_event* e, sd_event_source** s, int fd, uint mask,
        sd_event_inotify_handler_t callback, void* userdata);
int sd_event_add_defer(sd_event* e, sd_event_source** s,
        sd_event_handler_t callback, void* userdata);
int sd_event_add_post(sd_event* e, sd_event_source** s,
        sd_event_handler_t callback, void* userdata);
int sd_event_add_exit(sd_event* e, sd_event_source** s,
        sd_event_handler_t callback, void* userdata);

int sd_event_prepare(sd_event* e);
int sd_event_wait(sd_event* e, ulong usec);
int sd_event_dispatch(sd_event* e);
int sd_event_run(sd_event* e, ulong usec);
int sd_event_loop(sd_event* e);
int sd_event_exit(sd_event* e, int code);

int sd_event_now(sd_event* e, clockid_t clock, ulong* usec);

int sd_event_get_fd(sd_event* e);
int sd_event_get_state(sd_event* e);
int sd_event_get_tid(sd_event* e, pid_t* tid);
int sd_event_get_exit_code(sd_event* e, int* code);
int sd_event_set_watchdog(sd_event* e, int b);
int sd_event_get_watchdog(sd_event* e);
int sd_event_get_iteration(sd_event* e, ulong* ret);

sd_event_source* sd_event_source_ref(sd_event_source* s);
sd_event_source* sd_event_source_unref(sd_event_source* s);
sd_event_source* sd_event_source_disable_unref(sd_event_source* s);

sd_event* sd_event_source_get_event(sd_event_source* s);
void* sd_event_source_get_userdata(sd_event_source* s);
void* sd_event_source_set_userdata(sd_event_source* s, void* userdata);

int sd_event_source_set_description(sd_event_source* s, const(char)* description);
int sd_event_source_get_description(sd_event_source* s, const(char*)* description);
int sd_event_source_set_prepare(sd_event_source* s, sd_event_handler_t callback);
int sd_event_source_get_pending(sd_event_source* s);
int sd_event_source_get_priority(sd_event_source* s, long* priority);
int sd_event_source_set_priority(sd_event_source* s, long priority);
int sd_event_source_get_enabled(sd_event_source* s, int* enabled);
int sd_event_source_set_enabled(sd_event_source* s, int enabled);
int sd_event_source_get_io_fd(sd_event_source* s);
int sd_event_source_set_io_fd(sd_event_source* s, int fd);
int sd_event_source_get_io_fd_own(sd_event_source* s);
int sd_event_source_set_io_fd_own(sd_event_source* s, int own);
int sd_event_source_get_io_events(sd_event_source* s, uint* events);
int sd_event_source_set_io_events(sd_event_source* s, uint events);
int sd_event_source_get_io_revents(sd_event_source* s, uint* revents);
int sd_event_source_get_time(sd_event_source* s, ulong* usec);
int sd_event_source_set_time(sd_event_source* s, ulong usec);
int sd_event_source_set_time_relative(sd_event_source* s, ulong usec);
int sd_event_source_get_time_accuracy(sd_event_source* s, ulong* usec);
int sd_event_source_set_time_accuracy(sd_event_source* s, ulong usec);
int sd_event_source_get_time_clock(sd_event_source* s, clockid_t* clock);
int sd_event_source_get_signal(sd_event_source* s);
int sd_event_source_get_child_pid(sd_event_source* s, pid_t* pid);
int sd_event_source_get_child_pidfd(sd_event_source* s);
int sd_event_source_get_child_pidfd_own(sd_event_source* s);
int sd_event_source_set_child_pidfd_own(sd_event_source* s, int own);
int sd_event_source_get_child_process_own(sd_event_source* s);
int sd_event_source_set_child_process_own(sd_event_source* s, int own);
int sd_event_source_send_child_signal(sd_event_source* s, int sig, const(siginfo_t)* si, uint flags);

int sd_event_source_get_inotify_mask(sd_event_source* s, uint* ret);
int sd_event_source_set_destroy_callback(sd_event_source* s, sd_event_destroy_t callback);
int sd_event_source_get_destroy_callback(sd_event_source* s, sd_event_destroy_t* ret);
int sd_event_source_get_floating(sd_event_source* s);
int sd_event_source_set_floating(sd_event_source* s, int b);
int sd_event_source_get_exit_on_failure(sd_event_source* s);
int sd_event_source_set_exit_on_failure(sd_event_source* s, int b);
int sd_event_source_set_ratelimit(sd_event_source* s, ulong interval_usec, uint burst);
int sd_event_source_get_ratelimit(sd_event_source* s, ulong* ret_interval_usec, uint* ret_burst);
int sd_event_source_is_ratelimited(sd_event_source* s);
int sd_event_source_set_ratelimit_expire_callback(sd_event_source* s, sd_event_handler_t callback);

void sd_event_unrefp(sd_event** p);
void sd_event_source_unrefp(sd_event_source** p);
void sd_event_source_disable_unrefp(sd_event_source** p);
