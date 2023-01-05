vlog encoder_file.v
vsim encoder
add wave *
force encoder/enable 0
force encoder/in 00000000
run
force encoder/in 00000001
run
force encoder/in 00000010
run
force encoder/in 00000100
run
force encoder/in 00001000
run
force encoder/in 00010000
run
force encoder/in 00100000
run
force encoder/in 01000000
run
force encoder/in 10000000
run

force encoder/enable 1
force encoder/in 00000000
run
force encoder/in 00000001
run
force encoder/in 00000010
run
force encoder/in 00000100
run
force encoder/in 00001000
run
force encoder/in 00010000
run
force encoder/in 00100000
run
force encoder/in 01000000
run
force encoder/in 10000000
run
