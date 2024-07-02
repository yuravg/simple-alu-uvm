onerror {resume}
quietly WaveActivateNextPane {} 0
# -----------------------------------------------------------------------------------------------

add wave -noupdate -divider alu_vif
add wave -noupdate -radix hexadecimal /alu_tb/alu_vif/*

add wave -noupdate -divider dut
add wave -noupdate -radix hexadecimal /alu_tb/dut/*

# -----------------------------------------------------------------------------------------------
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1 us} 0}
quietly wave cursor active 1
configure wave -namecolwidth 179
configure wave -valuecolwidth 60
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update

wave zoom full
