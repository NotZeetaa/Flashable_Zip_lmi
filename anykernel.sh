# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=aRise_kernel_lmi
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=lmi
device.name2=lmipro
supported.versions=11 - 13
'; } # end properties

# shell variables
block=/dev/block/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel install
dump_boot;

case "$ZIPFILE" in
  *66fps*|*66hz*)
    ui_print "  • Setting 66 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=1"
    ;;
  *69fps*|*69hz*)
    ui_print "  • Setting 69 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=2"
    ;;
  *72fps*|*72hz*)
    ui_print "  • Setting 72 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=3"
    ;;
  *77fps*|*77hz*)
    ui_print "  • Setting 77 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=4"
    ;;
  *79fps*|*79hz*)
    ui_print "  • Setting 79 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=5"
    ;;
  *80fps*|*80hz*)
    ui_print "  • Setting 80 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=6"
    ;;
    *OSSFOD*|*OSS*)
    ui_print "  • Setting OSS FOD"
    patch_cmdline "msm_drm.oss_fod" "msm_drm.oss_fod=1"
    ;;
  *DFFOD*|*OLDFOD*)
    ui_print "  • Setting DisplayFeature FOD"
    patch_cmdline "msm_drm.oss_fod" "msm_drm.oss_fod=0"
    ;;
  *)
    ui_print "  • Setting 60 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" ""
    patch_cmdline "msm_drm.oss_fod" "msm_drm.oss_fod=0"
    ;;
esac

write_boot;
## end install
