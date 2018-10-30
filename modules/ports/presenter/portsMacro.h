#pragma once
#define OPEN_PORTS "pkexec netstat -tlnp | awk '{print $7, $4, $1}'"
