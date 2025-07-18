# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cita/ros2_practice/hesai_lidar_ws

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver

# Include any dependencies generated for this target.
include src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/compiler_depend.make

# Include the progress variables for this target.
include src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/progress.make

# Include the compile flags for this target's objects.
include src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/flags.make

src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/plat_utils.cc.o: src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/flags.make
src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/plat_utils.cc.o: ../../src/driver/HesaiLidar_SDK_2.0/libhesai/Common/src/plat_utils.cc
src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/plat_utils.cc.o: src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/plat_utils.cc.o"
	cd /home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver/src/driver/HesaiLidar_SDK_2.0/libhesai && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/plat_utils.cc.o -MF CMakeFiles/platutils_lib.dir/Common/src/plat_utils.cc.o.d -o CMakeFiles/platutils_lib.dir/Common/src/plat_utils.cc.o -c /home/cita/ros2_practice/hesai_lidar_ws/src/driver/HesaiLidar_SDK_2.0/libhesai/Common/src/plat_utils.cc

src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/plat_utils.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/platutils_lib.dir/Common/src/plat_utils.cc.i"
	cd /home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver/src/driver/HesaiLidar_SDK_2.0/libhesai && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cita/ros2_practice/hesai_lidar_ws/src/driver/HesaiLidar_SDK_2.0/libhesai/Common/src/plat_utils.cc > CMakeFiles/platutils_lib.dir/Common/src/plat_utils.cc.i

src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/plat_utils.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/platutils_lib.dir/Common/src/plat_utils.cc.s"
	cd /home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver/src/driver/HesaiLidar_SDK_2.0/libhesai && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cita/ros2_practice/hesai_lidar_ws/src/driver/HesaiLidar_SDK_2.0/libhesai/Common/src/plat_utils.cc -o CMakeFiles/platutils_lib.dir/Common/src/plat_utils.cc.s

src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/auto_tick_count.cc.o: src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/flags.make
src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/auto_tick_count.cc.o: ../../src/driver/HesaiLidar_SDK_2.0/libhesai/Common/src/auto_tick_count.cc
src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/auto_tick_count.cc.o: src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/auto_tick_count.cc.o"
	cd /home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver/src/driver/HesaiLidar_SDK_2.0/libhesai && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/auto_tick_count.cc.o -MF CMakeFiles/platutils_lib.dir/Common/src/auto_tick_count.cc.o.d -o CMakeFiles/platutils_lib.dir/Common/src/auto_tick_count.cc.o -c /home/cita/ros2_practice/hesai_lidar_ws/src/driver/HesaiLidar_SDK_2.0/libhesai/Common/src/auto_tick_count.cc

src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/auto_tick_count.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/platutils_lib.dir/Common/src/auto_tick_count.cc.i"
	cd /home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver/src/driver/HesaiLidar_SDK_2.0/libhesai && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cita/ros2_practice/hesai_lidar_ws/src/driver/HesaiLidar_SDK_2.0/libhesai/Common/src/auto_tick_count.cc > CMakeFiles/platutils_lib.dir/Common/src/auto_tick_count.cc.i

src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/auto_tick_count.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/platutils_lib.dir/Common/src/auto_tick_count.cc.s"
	cd /home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver/src/driver/HesaiLidar_SDK_2.0/libhesai && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cita/ros2_practice/hesai_lidar_ws/src/driver/HesaiLidar_SDK_2.0/libhesai/Common/src/auto_tick_count.cc -o CMakeFiles/platutils_lib.dir/Common/src/auto_tick_count.cc.s

# Object files for target platutils_lib
platutils_lib_OBJECTS = \
"CMakeFiles/platutils_lib.dir/Common/src/plat_utils.cc.o" \
"CMakeFiles/platutils_lib.dir/Common/src/auto_tick_count.cc.o"

# External object files for target platutils_lib
platutils_lib_EXTERNAL_OBJECTS =

src/driver/HesaiLidar_SDK_2.0/libhesai/libplatutils_lib.so: src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/plat_utils.cc.o
src/driver/HesaiLidar_SDK_2.0/libhesai/libplatutils_lib.so: src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/Common/src/auto_tick_count.cc.o
src/driver/HesaiLidar_SDK_2.0/libhesai/libplatutils_lib.so: src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/build.make
src/driver/HesaiLidar_SDK_2.0/libhesai/libplatutils_lib.so: src/driver/HesaiLidar_SDK_2.0/libhesai/liblog_lib.so
src/driver/HesaiLidar_SDK_2.0/libhesai/libplatutils_lib.so: src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library libplatutils_lib.so"
	cd /home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver/src/driver/HesaiLidar_SDK_2.0/libhesai && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/platutils_lib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/build: src/driver/HesaiLidar_SDK_2.0/libhesai/libplatutils_lib.so
.PHONY : src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/build

src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/clean:
	cd /home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver/src/driver/HesaiLidar_SDK_2.0/libhesai && $(CMAKE_COMMAND) -P CMakeFiles/platutils_lib.dir/cmake_clean.cmake
.PHONY : src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/clean

src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/depend:
	cd /home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cita/ros2_practice/hesai_lidar_ws /home/cita/ros2_practice/hesai_lidar_ws/src/driver/HesaiLidar_SDK_2.0/libhesai /home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver /home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver/src/driver/HesaiLidar_SDK_2.0/libhesai /home/cita/ros2_practice/hesai_lidar_ws/build/hesai_ros_driver/src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/driver/HesaiLidar_SDK_2.0/libhesai/CMakeFiles/platutils_lib.dir/depend

