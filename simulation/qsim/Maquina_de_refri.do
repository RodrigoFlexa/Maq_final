onerror {quit -f}
vlib work
vlog -work work Maquina_de_refri.vo
vlog -work work Maquina_de_refri.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Maquina_de_refri_vlg_vec_tst
vcd file -direction Maquina_de_refri.msim.vcd
vcd add -internal Maquina_de_refri_vlg_vec_tst/*
vcd add -internal Maquina_de_refri_vlg_vec_tst/i1/*
add wave /*
run -all
