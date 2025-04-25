cmake_minimum_required(VERSION 3.16)
project(crtk_msgs VERSION 1.2.0)

# first test for ROS1
set (ROS1_depends std_msgs geometry_msgs)

find_package (catkin QUIET
  COMPONENTS message_generation ${ROS1_depends})

# ROS 1
if (catkin_FOUND)

  ## Generate messages in the 'msg' folder
  add_message_files (FILES
    OperatingState.msg
    StringStamped.msg
    CartesianImpedanceHalfPlaneGains.msg
    CartesianImpedance.msg
    CartesianState.msg
    SetpointMode.msg
    CartesianServo.msg
    JointServo.msg
    )

  ## Generate services in the 'srv' folder
  add_service_files (
    FILES
    TriggerOperatingState.srv
    QueryForwardKinematics.srv
    QueryInverseKinematics.srv
    )

  ## Generate added messages and services with any dependencies listed here
  generate_messages (DEPENDENCIES ${ROS1_depends})
  
  catkin_package (
    CATKIN_DEPENDS message_runtime ${ROS1_depends}
    )
  
else (catkin_FOUND)
  
  # look for ROS2
  find_package (ament_cmake QUIET)
  if (ament_cmake_FOUND)
    set (ROS2_depends ament_cmake rclcpp std_msgs geometry_msgs builtin_interfaces rosidl_default_generators)
    foreach (_dep ${ROS2_depends})
      find_package (${_dep} REQUIRED)
    endforeach ()

    rosidl_generate_interfaces (crtk_msgs
      msg/OperatingState.msg
      msg/StringStamped.msg
      msg/CartesianImpedanceHalfPlaneGains.msg
      msg/CartesianImpedance.msg
      msg/CartesianState.msg
      msg/SetpointMode.msg
      msg/CartesianServo.msg
      msg/JointServo.msg
      srv/TriggerOperatingState.srv
      srv/QueryForwardKinematics.srv
      srv/QueryInverseKinematics.srv
      DEPENDENCIES builtin_interfaces std_msgs geometry_msgs
      )

    ament_package ()

  endif (ament_cmake_FOUND)

endif (catkin_FOUND)
