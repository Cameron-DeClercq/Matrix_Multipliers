##############################################################################################################
#####  
#####                                       Pegasus LVS COMPARISON
#####  
#####  Version                       :   22.20-p009
#####  NVN Run Start                 :   Sun Apr 20 22:38:09 2025
#####  ERC Summary File              :   sys_arr_unp.sum
#####  Extraction Report File        :   sys_arr_unp.rep
#####  Comparison Report File        :   sys_arr_unp.rep.cls
#####  Top Cell                      :   sys_arr_unp  <vs>  sys_arr_unp
#####  
#####  Run Result                    :   MATCH
#####  
#####  Run Summary                   :   [INFO]  ERC Results: Empty
#####                                :   [INFO]  Extraction Clean
#####                                :   [INFO]  Some Sections Have Been Truncated
#####  
#####  Layout Design                 :   systolic_array sys_arr_unp layout
#####  Schematic File                :   /home/ece558_658_2024/cdeclercq/559/unppl_design/lvs-runs/sys_arr_unp.cdl (cdl)
#####  Rules File                    :   /home/ece558_658_2024/cdeclercq/559/unppl_design/lvs-runs/.technology.rul
#####  Pin Swap File                 :   sys_arr_unp.rep.cps
#####  
#####  Extraction CPU Time           :   0h 0m 1s - (1s)
#####  Extraction Exec Time          :   0h 0m 2s - (2s)
#####  Extraction Peak Memory Usage  :   28.00MB
#####  NVN CPU Time                  :   0h 0m 0s - (0s)                 
#####  NVN Exec Time                 :   0h 0m 1s - (1s)                 
#####  NVN Peak Memory Usage         :   263.21MB
#####  LVS Total CPU Time            :   0h 0m 1s - (1s)                 
#####  LVS Total Exec Time           :   0h 0m 3s - (3s)                 
#####  LVS Total Peak Memory Usage   :   263.21MB
#####  
##############################################################################################################


##############################################################################################################
#
#                                            CELL MATCH STATISTICS                                            
#
##############################################################################################################

Cell Statistic Descriptions                  | Count
---------------------------------------------+----------
Cells matched                                |         1
Cells expanded                               |         0
Cells not run                                |         0
Cells which mismatch                         |         0
---------------------------------------------+----------
Total                                        |         1


Cell Statistic Detail                        | Count
---------------------------------------------+----------
Cells with parameter mismatches              |         0
Cells with mismatched instance subtypes      |         0
Cells that have been blackboxed              |         0


##############################################################################################################
#
#                                             CELL MATCH SUMMARY                                              
#
##############################################################################################################

                |     Initial Pins     |     Compare Pins     |            | 
Cell            |   lay    :    sch    |   lay    :    sch    | Status     | Detail
----------------+----------+-----------+----------+-----------+------------+--------------
sys_arr_unp     |      164 :       164 |      164 :       164 | match      | truncated


##############################################################################################################
#
#                                                  LVS RULES                                                  
#
##############################################################################################################

Command Line LVS Rule Values
----------------------------

    layout_primary                          sys_arr_unp {-top_cell sys_arr_unp}
    schematic_primary                       sys_arr_unp {-source_top_cell sys_arr_unp}

LVS Rules Given in the Rules File
---------------------------------

    lvs_abort                               -softchk                               no  
    lvs_abort                               -supply_error                          no  
    layout_path                             /home/ece558_658_2024/cdeclercq/559/unppl_design/lvs-runs/sys_arr_unp.gds.gz
    layout_format                           gdsii
    schematic_path                          /home/ece558_658_2024/cdeclercq/559/unppl_design/lvs-runs/sys_arr_unp.cdl
    schematic_format                        cdl
    lvs_black_box                           pll_vco_indsym1p3
                                             
    lvs_ignore_ports                        no  
    lvs_find_shorts                         no  
    lvs_break_ambig_max                     32
    lvs_reduce_device                       M -parallel yes ...
    lvs_reduce_device                       C ( g45cmim ) -parallel yes ...
    lvs_expand_cell_on_error                no  
    lvs_check_property                      M l l -tolerance 0
    lvs_check_property                      M w w -tolerance 2
    lvs_check_property                      C ( g45cmim ) l l -tolerance 0
    lvs_check_property                      C ( g45cmim ) w w -tolerance 0
    lvs_check_property                      g45inda width width -tolerance 1
    lvs_check_property                      g45inda space space -tolerance 1
    lvs_check_property                      g45inda nr nr -tolerance 1
    lvs_check_property                      g45inda rad rad -tolerance 1
    lvs_check_property                      g45inds width width -tolerance 1
    lvs_check_property                      g45inds space space -tolerance 1
    lvs_check_property                      g45inds nr nr -tolerance 1
    lvs_check_property                      g45inds rad rad -tolerance 1
    lvs_report_file                         sys_arr_unp.rep
    lvs_report_max                          50 -mismatched_net_limit 100 
    unit                                    -length u
    input_scale                             2000
    virtual_connect                         no  -colon
    virtual_connect                         yes -semicolon_as_colon
    virtual_connect                         no  -report
    virtual_connect                         -depth primary
    text_depth                              -primary

Default LVS Rule Values
-----------------------

    lvs_abort                               -check_device_for_property_rule no
    lvs_abort                               -missing_hcell no
    lvs_abort                               -erc_error yes
    lvs_abort                               -inconsistent_reduction yes
    layout_case_sensitive                   no
    // layout_cpf_file                       
    // schematic_cpf_file                    
    schematic_case_sensitive                no
    // hcell_file                            
    // hcell                                 
    // lvs_exclude_hcell                     
    // lvs_delete_cell                       
    lvs_push_devices                        yes
    lvs_push_devices_properties             no
    lvs_netlist                             yes -substrate_comment
    lvs_netlist                             yes -box_contents
    lvs_netlist                             yes -unnamed_box_pins
    lvs_netlist                             no -allow_inconsistent_model
    lvs_netlist                             yes -properties_comment
    // lvs_write_netlist                     
    // lvs_write_netlist_reduced             
    // lvs_delete_cell_pin                   
    // lvs_interposer                        
    lvs_spice                               yes -allow_floating_pins
    lvs_spice                               yes -allow_duplicate_subcircuit_names
    lvs_spice                               no  -conditional_ldd
    lvs_spice                               no  -prefer_pins
    lvs_spice                               no  -override_globals
    lvs_spice                               no  -redefine_param
    lvs_spice                               no  -replicate_devices
    lvs_spice                               no  -replicate_devices_enhanced
    lvs_spice                               yes -slash_is_space
    lvs_spice                               yes -keep_back_slash
    lvs_spice                               no  -allow_unquoted_strings
    lvs_spice                               no  -allow_inline_parameters
    lvs_spice                               no  -calculate_mos_area
    lvs_spice                               no  -strict_wl
    lvs_spice                               no  -cull_primitive_subcircuits
    lvs_spice                               no  -ignore_option_scale
    lvs_spice                               no  -show_neg_param_warning
    lvs_spice                               no  -scale_x_parameters
    lvs_spice                               yes -strict_subckts_order
    // lvs_spice_option                      
    lvs_reverse_wl                          no
    // lvs_spice_multiplier_name             
                                             
    lvs_compare_case                        no
    lvs_cname                               no  -cell
    lvs_cname                               yes -pin
    lvs_cname                               yes -net
    lvs_cname                               no  -instance
    lvs_non_user_name                       -port "^[0-9]+$"
    lvs_non_user_name                       -net  "^[0-9]+$"
    // lvs_non_user_name                    -instance 
    lvs_out_of_range_exclude_zero           no
    // lvs_group_models                      
    lvs_strict_subtypes                     no
    lvs_exact_subtypes                      no
    lvs_preserve_box_ports                  no
    // lvs_cpoint                            
    // lvs_power_name                        
    // lvs_ground_name                       
    // lvs_cell_list                         
    // lvs_device_type                       
    lvs_auto_pin_swap                       yes -swap_threshold 4000000
    lvs_swap_non_cpoint_pins                yes
    // lvs_swap_pins                         
    lvs_all_cap_pins_swappable              no
    lvs_builtin_device_pin_swap             yes
    // lvs_join_nets                         
    lvs_compare_port_names                  no
    lvs_global_sigs_are_ports               yes
    lvs_discard_pins                        no
    lvs_filter                              no  -bipolar
    lvs_filter                              no  -capacitors
    lvs_filter                              no  -diodes
    lvs_filter                              no  -mos
    lvs_filter                              no  -resistors
    // lvs_filter_option                     
    // lvs_filter_device                     
    lvs_reduction_priority                  -parallel
    lvs_reduce_split_gates                  yes
    lvs_derive_logic                        yes -sram
    lvs_derive_logic                        no  -dram
    lvs_derive_logic                        no  -rom
    lvs_recognize_gates                     -all  
    // lvs_recognize_gates_tolerance         
    lvs_reduce                              yes -parallel_bipolar
    lvs_reduce                              yes -parallel_caps
    lvs_reduce                              yes -series_caps
    lvs_reduce                              yes -parallel_diodes
    lvs_reduce                              no  -series_diodes
    lvs_reduce                              yes -parallel_mos
    lvs_reduce                              no  -series_mos
    lvs_reduce                              yes -parallel_resistors
    lvs_reduce                              yes -series_resistors
    // lvs_reduce_do_not_merge               
    lvs_expand_on_device_climbing           no
    lvs_expand_unbalanced_cells             yes
    // lvs_check_all_properties_by_name      
    // lvs_property_map                      
    // lvs_transfer_property                 
    lvs_warn_max                            50
    lvs_inconsistent_reduction_threshold    1000000
    // lvs_report_opt                        
    lvs_report_units                        yes
    lvs_keep_data                           no
    lvs_keep_source_cells                   no
    lvs_create_match_db                     no
    // lvs_map_device                        
    unit                                    -resistance ohm
    unit                                    -capacitance pf
    lvs_verilog_bus_map_by_position         no
    lvs_verilog_keep_backslash              no
    lvs_verilog_detect_buses                no
    lvs_do_not_normalize                    no
    // lvs_generic_device                    
    virtual_connect                         no  -colon
    virtual_connect                         yes -semicolon_as_colon
    // virtual_connect                      -name 
    virtual_connect                         no -report
    virtual_connect                         no -incremental
    lvs_preserve_parameterized_cells        no
    lvs_check_color                         no
    // lvs_schematic_color_path              
    // lvs_assign_conflict_layer             
    // lvs_conflict_layer_check             
    lvs_check_color_label                   no
    // lvs_preserve_cells                    
    port                                    -depth -primary

Effective LVS Rule Values
-------------------------

    lvs_swap_non_cpoint_pins                yes -unbound_pin_threshold 10000
    virtual_connect                         no  -report


##############################################################################################################
#
#                                               CELL COMPARISON                                               
#
##############################################################################################################

                              +------------------------------------------------+
                              |                                                |
                              |        ------->>>   MATCH   <<<-------         |
                              |                                                |
                              |         sys_arr_unp  <vs>  sys_arr_unp         |
                              |                                                |
                              |                                                |
                              +------------------------------------------------+
                              | * Some sections truncated                      |
                              +------------------------------------------------+

+===[sys_arr_unp]=============================================================================================
|                                                 STATISTICS                                                  
+=============================================================================================================


                 |        Original         |        Reduced         
Cell             |    lay     :    sch     |    lay     :    sch
-----------------+------------+------------+------------+-----------
M [4 pins]       |            :            |            :           
 M(G45N1SVT)     |      8,128 :      8,128 |      2,016 :      2,016
 M(G45P1SVT)     |      8,128 :      8,128 |      4,544 :      4,544
 M:SerMos2#1     |          - :          - |      4,848 :      4,848
-----------------+------------+------------+------------+-----------
Total            |     16,256 :     16,256 |     11,408 :     11,408
=================+============+============+============+===========
Pins             |            :            |        164 :        164
Nets             |            :            |      4,272 :      4,272
=================+============+============+============+===========

+===[sys_arr_unp]=============================================================================================
|                                           INITIAL CORRESPONDENCES                                           
+====================================================================================================truncated

Type | Name
-----+--------------------------------------------------------------------------------------------------------
Pin  | A00_0 A00_1 A00_2 A00_3 A01_0 A01_1 A01_2 A01_3 A02_0 A02_1 A02_2 A02_3 A03_0 A03_1 A03_2 A03_3 B00_0
     | B00_1 B00_2 B00_3 B10_0 B10_1 B10_2 B10_3 B20_0 B20_1 B20_2 B20_3 B30_0 B30_1 B30_2 B30_3 GND PHI RST
     | S00_0 S00_1 S00_2 S00_3 S00_4 S00_5 S00_6 S00_7 S01_0 S01_1 S01_2 S01_3 S01_4 S01_5 S01_6


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++ Section truncated to 50 issues, adjust this using the lvs_report_max rule +++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


##############################################################################################################
#
#                                                END OF REPORT                                                
#
##############################################################################################################

