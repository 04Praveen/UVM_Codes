vlib work
vlog top.sv
vsim -coverage work.top +access+r
onfinish stop
run -all
coverage report -detail
coverage save fcover.ucdb
coverage report -detail -output cov.txt
exit 
