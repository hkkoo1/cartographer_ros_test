-- Copyright 2016 The Cartographer Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

include "map_builder.lua"

options = {
  map_builder = MAP_BUILDER,
  map_frame = "map",
  tracking_frame =  "base_link",
  published_frame = "base_odom",
  odom_frame = "base_odom",
  provide_odom_frame = false,  -- true the local, non-loop-closed, continuous pose will be published as the odom_frame in the map_frame.
  use_odometry = false,  -- if true => subscribe "odom" topic, but here I use ekf convert to base_odom frame inside tf
  use_laser_scan = true,
  use_multi_echo_laser_scan = false,
  num_point_clouds = 0,
  lookup_transform_timeout_sec = 0.2,
  submap_publish_period_sec = 15.0, -- useless
  pose_publish_period_sec = 5e-3,
}

-- imu data disable
TRAJECTORY_BUILDER_2D.use_imu_data = false

-- laser data config
TRAJECTORY_BUILDER_2D.laser_min_range = 0.05
TRAJECTORY_BUILDER_2D.laser_max_range = 10.0
TRAJECTORY_BUILDER_2D.laser_missing_echo_ray_length = 0.0
-- maximum number of previous odometry states to keep
TRAJECTORY_BUILDER_2D.num_odometry_states = 99999

-- online scan match enable
TRAJECTORY_BUILDER_2D.use_online_correlative_scan_matching = true
TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.linear_search_window = 0.35
TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.angular_search_window = math.rad(45.)
TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.translation_delta_cost_weight = 0.0
TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.rotation_delta_cost_weight = 0.0

-- submap config
TRAJECTORY_BUILDER_2D.submaps.num_laser_fans = 999999 -- scan number for submap, submap disable
TRAJECTORY_BUILDER_2D.submaps.laser_fan_inserter.hit_probability = 0.95
TRAJECTORY_BUILDER_2D.submaps.laser_fan_inserter.miss_probability = 0.25

-- register scan trigger
TRAJECTORY_BUILDER_2D.motion_filter.max_time_seconds    = 999999 -- time triger disable
TRAJECTORY_BUILDER_2D.motion_filter.max_distance_meters = 0.5    -- linear  distance 0.5 m
TRAJECTORY_BUILDER_2D.motion_filter.max_angle_radians   = 0.25   -- angular distance 14.32 degree

-- build 2d map
MAP_BUILDER.use_trajectory_builder_2d = true

-- sparse pose graph optimization config
SPARSE_POSE_GRAPH.optimize_every_n_scans = 10 -- loop closure detection
SPARSE_POSE_GRAPH.constraint_builder.min_score = 0.8

return options
