#
# See https://github.com/collaborative-robotics/documentation/wiki/Robot-API-status
#
# Standard states include DISABLED, ENABLED, PAUSED and FAULT
#
std_msgs/Header header
string          state
bool            is_homed
bool            is_busy
