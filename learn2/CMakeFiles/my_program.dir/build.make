# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

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
CMAKE_SOURCE_DIR = /home/neolcr/Nasm/learn2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/neolcr/Nasm/learn2

# Include any dependencies generated for this target.
include CMakeFiles/my_program.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/my_program.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/my_program.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/my_program.dir/flags.make

CMakeFiles/my_program.dir/codegen:
.PHONY : CMakeFiles/my_program.dir/codegen

CMakeFiles/my_program.dir/calculator.asm.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/calculator.asm.o: calculator.asm
CMakeFiles/my_program.dir/calculator.asm.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/neolcr/Nasm/learn2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building ASM_NASM object CMakeFiles/my_program.dir/calculator.asm.o"
	/usr/bin/nasm $(ASM_NASM_DEFINES) $(ASM_NASM_INCLUDES) $(ASM_NASM_FLAGS) -MD CMakeFiles/my_program.dir/calculator.asm.o.d -MT CMakeFiles/my_program.dir/calculator.asm.o -f elf64 -o CMakeFiles/my_program.dir/calculator.asm.o /home/neolcr/Nasm/learn2/calculator.asm

# Object files for target my_program
my_program_OBJECTS = \
"CMakeFiles/my_program.dir/calculator.asm.o"

# External object files for target my_program
my_program_EXTERNAL_OBJECTS =

my_program: CMakeFiles/my_program.dir/calculator.asm.o
my_program: CMakeFiles/my_program.dir/build.make
my_program: CMakeFiles/my_program.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/neolcr/Nasm/learn2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking ASM_NASM executable my_program"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/my_program.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/my_program.dir/build: my_program
.PHONY : CMakeFiles/my_program.dir/build

CMakeFiles/my_program.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/my_program.dir/cmake_clean.cmake
.PHONY : CMakeFiles/my_program.dir/clean

CMakeFiles/my_program.dir/depend:
	cd /home/neolcr/Nasm/learn2 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/neolcr/Nasm/learn2 /home/neolcr/Nasm/learn2 /home/neolcr/Nasm/learn2 /home/neolcr/Nasm/learn2 /home/neolcr/Nasm/learn2/CMakeFiles/my_program.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/my_program.dir/depend

