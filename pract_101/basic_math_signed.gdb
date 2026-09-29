
# Inside pract_101/basic_math_signed.gdb

# 1. Pull the universal macro from the parent directory
source ../my_shared_macros.gdb

# 2. Set the breakpoint right after the division label in this specific file
break *after_div_label

# 3. Tell Breakpoint 1 to automatically run the macro
commands 1
    silent
    checkdiv
end

# 4. Start execution instantly
run
