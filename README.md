# Cartographer ROS Test
This is a cartographer ros performance test, the codes are fetched from https://github.com/googlecartographer/cartographer_ros, thanks for Google's great job to share with us.

**Test Branch**
I will not modify any codes from master branch, while I will do some test, even modify the codes with other branches

**How to install**
there are 3 main modules in cartographer_ros_test:
```
ceres-solver
cartographer
cartographer_ros
```
Following the instructions from google official cartographer page: [https://google-cartographer-ros.readthedocs.io/en/latest/]

**for Eclipse usage**
suppose you put cartographer_ros_test into [catkin_ws/src]
```
  cd catkin_ws
  catkin_make_isolated -G"Eclipse CDT4 - Unix Makefiles"
```

**How to run**
If you do a offline data test, some data bags can be fetched from google offical site,Following the instructions from google official cartographer page: [https://google-cartographer-ros.readthedocs.io/en/latest/]

** Have fun and enjoy ;) **
