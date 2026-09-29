define checkdiv
    set $ax_val = $rax & 0xFFFF
    set $ah_val = ($ax_val >> 8) & 0xFF    
    set $al_val = $ax_val & 0xFF           

    printf "\n===================================\n"
    printf "  AUTOMATIC DIVISION BREAKDOWN\n"
    printf "===================================\n"
    printf "  Combined AX: Hex: 0x%04x | Dec: %d\n", $ax_val, $ax_val
    printf "  ---------------------------------\n"
    printf "  High Byte (AH) [Remainder]: Hex: 0x%02x | Dec: %d\n", $ah_val, $ah_val
    printf "  Low Byte  (AL) [Quotient ]: Hex: 0x%02x | Dec: %d\n", $al_val, $al_val
    printf "===================================\n\n"
end

# 2. Set a breakpoint exactly at the memory target or label *after* the division
# Replace 'after_div_label' with your actual code label or exact line number
break something_new.asm:137

# 3. Tell GDB to run your macro automatically ONLY when this breakpoint triggers
commands 1
    silent    
    checkdiv 
    continue 
end

run 
