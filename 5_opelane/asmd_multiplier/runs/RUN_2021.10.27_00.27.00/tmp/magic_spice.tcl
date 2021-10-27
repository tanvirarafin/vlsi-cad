
if { [info exist ::env(MAGIC_EXT_USE_GDS)] && $::env(MAGIC_EXT_USE_GDS) } {
	gds read $::env(CURRENT_GDS)
} else {
	lef read /home/MSUCAP/tanvir.arafin/pdk/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd.tlef
	if {  [info exist ::env(EXTRA_LEFS)] } {
		set lefs_in $::env(EXTRA_LEFS)
		foreach lef_file $lefs_in {
			lef read $lef_file
		}
	}
	def read /openlane/designs/asmd_multiplier/runs/RUN_2021.10.27_00.27.00/results/routing/21-asmd_multiplier.def
}
load asmd_multiplier -dereference
cd /openlane/designs/asmd_multiplier/runs/RUN_2021.10.27_00.27.00/results/magic/
extract do local
extract no capacitance
extract no coupling
extract no resistance
extract no adjust
if { ! 0 } {
	extract unique
}
# extract warn all
extract

ext2spice lvs
ext2spice -o /openlane/designs/asmd_multiplier/runs/RUN_2021.10.27_00.27.00/results/magic/asmd_multiplier.spice asmd_multiplier.ext
feedback save /openlane/designs/asmd_multiplier/runs/RUN_2021.10.27_00.27.00/logs/magic/34-magic_ext2spice.feedback.txt
# exec cp asmd_multiplier.spice /openlane/designs/asmd_multiplier/runs/RUN_2021.10.27_00.27.00/results/magic/asmd_multiplier.spice

