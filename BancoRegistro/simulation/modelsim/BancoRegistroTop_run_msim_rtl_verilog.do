transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Digital/lab04-2021-2-grupo03-2021-2/src {C:/Digital/lab04-2021-2-grupo03-2021-2/src/display.v}
vlog -vlog01compat -work work +incdir+C:/Digital/lab04-2021-2-grupo03-2021-2/src {C:/Digital/lab04-2021-2-grupo03-2021-2/src/BCDtoSSeg.v}
vlog -vlog01compat -work work +incdir+C:/Digital/lab04-2021-2-grupo03-2021-2/src {C:/Digital/lab04-2021-2-grupo03-2021-2/src/BancoRegistroTop.v}
vlog -vlog01compat -work work +incdir+C:/Digital/lab04-2021-2-grupo03-2021-2/src {C:/Digital/lab04-2021-2-grupo03-2021-2/src/BancoRegistro.v}

vlog -vlog01compat -work work +incdir+C:/Digital/lab04-2021-2-grupo03-2021-2/BancoRegistro/../src {C:/Digital/lab04-2021-2-grupo03-2021-2/BancoRegistro/../src/TestBench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  TestBench

add wave *
view structure
view signals
run -all
