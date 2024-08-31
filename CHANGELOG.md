Change log
==========

1.2.0 (2024-08-09)
==================

* Updated `package.xml` and `CMakeLists.txt` so the same repository can be used for both ROS1 and ROS2

1.1.0 (2023-11-21)
==================

* Renamed `msg/operating_state` to `msg/OperatingState` and
  `srv/trigger_operating_state` to `srv/TriggerOperatingState` to
  follow standard ROS 1 (and 2) naming convention
* Added service definitions for QueryForwardKinematics and
  QueryInverseKinematics
