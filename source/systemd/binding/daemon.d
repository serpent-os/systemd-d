module systemd.binding.daemon;

import core.stdc.stdarg;
import core.sys.posix.sys.socket;
import core.sys.posix.sys.types;
import systemd.binding.common;
import systemd.binding.id128;

extern (C):
@nogc:
nothrow:

int sd_listen_fds(int unset_environment);

int sd_listen_fds_with_names(int unset_environment, char*** names);

int sd_is_fifo(int fd, const(char)* path);

int sd_is_special(int fd, const(char)* path);

int sd_is_socket(int fd, int family, int type, int listening);

int sd_is_socket_inet(int fd, int family, int type, int listening, ushort port);

int sd_is_socket_sockaddr(int fd, int type, const(sockaddr)* addr, uint addr_len, int listening);

int sd_is_socket_unix(int fd, int type, int listening, const(char)* path, size_t length);

int sd_is_mq(int fd, const(char)* path);

int sd_notify(int unset_environment, const(char)* state);

int sd_notifyf(int unset_environment, const(char)* format, ...);

int sd_pid_notify(pid_t pid, int unset_environment, const(char)* state);

int sd_pid_notifyf(pid_t pid, int unset_environment, const(char)* format, ...);

int sd_pid_notify_with_fds(pid_t pid, int unset_environment, const(char)* state,
        const(int)* fds, uint n_fds);

int sd_notify_barrier(int unset_environment, ulong timeout);

int sd_booted();

int sd_watchdog_enabled(int unset_environment, ulong* usec);
