                                       
! Generated Namelist for maekIC_se.ncl 
!------------------                   
&makeic_nl
 MYTMPDIR="./TMP/11/"
 MYOUTDIR="/glade/derecho/scratch/sweidman/era_regridded/"
 INPUTDIR="/glade/derecho/scratch/sweidman/era_holding/"
                                    
 TMP_clean  ="True"
                                    
 REF_DATE              ="20111111"
 CASE                  ="ERA5_fv19_"
 DYCORE                ="fv"
 PRECISION             ="float"
 VORT_DIV_TO_UV        ="False"
 SST_MASK              ="False"
 ICE_MASK              ="False"
 OUTPUT_PHIS           ="True"
 REGRID_ALL            ="False"
 ADJUST_STATE_FROM_TOPO="True"
                                    
 fname_phis_output     ="/glade/campaign/cesm/cesmdata/cseg/inputdata/atm/cam/topo/USGS-gtopo30_1.9x2.5_remap_c050602.nc"
 ftype_phis_output     ="FV_TOPOGRAPHY"
 fname_grid_info       ="/glade/campaign/cesm/cesmdata/cseg/inputdata/atm/cam/inic/fv/cami_0000-01-01_1.9x2.5_L26_c070408.nc"
                                    
 fields       ="U,US,V,VS,T,Q,PS"
 source_files ="0,0,0,0,0,0,0"
 fname_phis_in=0
                                    
 fname0="ERA5_e5.oper.ml.v3.uvtqps.2011111121.nc"
 fname1="none"
 fname2="none"
 fname3="none"
 fname4="none"
 fname5="none"
                                    
 ftype0="ERA5"
 ftype1="none"
 ftype2="none"
 ftype3="none"
 ftype4="none"
 ftype5="none"
                                    
 fdate0="2011111175600"
 fdate1="-1"
 fdate2="-1"
 fdate3="-1"
 fdate4="-1"
 fdate5="-1"
/
