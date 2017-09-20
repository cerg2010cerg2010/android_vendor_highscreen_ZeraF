#!/bin/bash

SOURCE=$1
TARGET=.

#
# wifi and gsm firmware's
#
#FIRMWARE="/etc/firmware/"

#
# wmt_loader init kernel device modules, and loades a driver for /dev/stpwmt, then
# 6620_launcher load a firmware to the CPU using /dev/stpwmt.
# mt6572_82_patch_e1_0_hdr.bin, mt6572_82_patch_e1_1_hdr.bin - wifi firmware.
#
#WIFI="/etc/wifi/ /bin/6620_wmt_lpbk /bin/6620_launcher /bin/6620_wmt_concurrency /bin/wmt_loader"

#
# gralloc && hwcomposer - hardware layer. rest is userspace lib.so layer.
#
#GL="/lib/egl/libGLESv1_CM_mali.so /lib/egl/libGLESv2_mali.so /lib/egl/libEGL_mali.so \
#/lib/libm4u.so /lib/hw/hwcomposer.mt6572.so /lib/hw/gralloc.mt6572.so \
#/lib/libdpframework.so /lib/libion.so /lib/libMali.so"

#
# ccci_mdinit starts, depends on additional services:
# - drvbd - unix socket connection
# - nvram - folders /data/nvram, modem settings like IMEI
# - gsm0710muxd - /dev/radio/ ports for accessing the modem
# - mdlogger
# - ccci_fsd
#
# ccci_mdinit loads modem_1_wg_n.img firmware to the CPU, waits for NVRAM to init using ENV variable.
# then starts the modem CPU. on success starts rest services mdlogger, gsm0710muxd ...
#
#RIL="/lib/mtk-ril.so /lib/librilmtk.so /lib/libaed.so \
#/bin/nvram_daemon /bin/nvram_agent_binder /lib/libnvram.so /lib/libcustom_nvram.so /lib/libnvram_sec.so \
#/lib/libhwm.so /lib/libnvram_platform.so /lib/libfile_op.so /lib/libnvram_daemon_callback.so /lib/libmtk_drvb.so \
#/bin/gsm0710muxd /bin/ccci_mdinit /bin/drvbd /bin/aee_aed /bin/aee /bin/mdlogger \
#/bin/dualmdlogger /bin/emcsmdlogger /lib/libmdloggerrecycle.so /bin/ccci_fsd"

#AUDIO="/lib/libaudio.primary.default.so /lib/libblisrc.so /lib/libspeech_enh_lib.so /lib/libaudiocustparam.so /lib/libaudiosetting.so \
#/lib/libaudiocompensationfilter.so /lib/libbessound_mtk.so /lib/libcvsd_mtk.so /lib/libmsbc_mtk.so /lib/libaudiocomponentengine.so \
#/lib/libblisrc32.so /lib/libbessound_hd_mtk.so /lib/libmtklimiter.so /lib/libmtkshifter.so /lib/libaudiodcrflt.so \
#/lib/libbluetoothdrv.so"

#SYSTEM="$FIRMWARE $WIFI $GL $RIL $AUDIO"
SYSTEM="bin/emcsmdlogger
bin/6620_launcher
bin/qmc5983d
bin/pppd
bin/6620_wmt_concurrency
bin/drvbd
bin/s62xd
bin/mc6420d
bin/dualmdlogger
bin/akmd09911
bin/mdlogger
bin/pppd_dt
bin/ccci_fsd
bin/permission_check
bin/msensord
bin/wifi2agps
bin/thermal
bin/nvram_agent_binder
bin/thermald
bin/ccci_mdinit
bin/terservice
bin/memsicd
bin/mtk_agpsd
bin/ipod
bin/boot_logo_updater
bin/md_minilog_util
bin/memsicd3416x
bin/muxreport
bin/6620_wmt_lpbk
bin/rild
bin/wmt_loader
bin/orientationd
bin/factory
bin/rildmd2
bin/ami304d
bin/bmm050d
bin/akmd8963
bin/bmm056d
bin/thermal_manager
bin/nvram_daemon
bin/geomagneticd
bin/akmd8975
etc/bluetooth
etc/firmware
etc/mtk_omx_core.cfg
etc/fmr
etc/wifi
lib/libSwJpgCodec.so
lib/egl/libEGL_mali.so
lib/egl/libGLESv2_mali.so
lib/egl/libGLESv1_CM_mali.so
lib/egl/libGLES_android.so
lib/libcam.utils.sensorlistener.so
lib/libcam_hwutils.so
lib/libmpodecoder.so
lib/libmtcloader.so
lib/libcam.campipe.so
lib/libvcodec_oal.so
lib/libjni_motion_track.so
lib/libcam_mmp.so
lib/libja3m.so
lib/libterservice.so
lib/libstlport.so
lib/libaudio.primary.default.so
lib/libaed.so
lib/libcorkscrew.so
lib/libvcodecdrv.so
lib/libgralloc_extra.so
lib/libBnMtkCodec.so
lib/mtk-ril.so
lib/libGdmaScalerPipe.so
lib/libnvram_sec.so
lib/libgui_ext.so
lib/libdpframework.so
lib/libmtkjpeg.so
lib/libshowlogo.so
lib/libaudiosetting.so
lib/libimageio_plat_drv.so
lib/libbessound_mtk.so
lib/hw/power.default.so
lib/hw/gps.mt6572.so
lib/hw/sensors.default.so
lib/hw/lights.mt6572.so
lib/hw/hwcomposer.mt6572.so
lib/hw/camera.default.so
lib/hw/lights.default.so
lib/hw/local_time.default.so
lib/hw/gralloc.mt6572.so
lib/hw/audio.primary.mt6572.so
lib/libcam.paramsmgr.so
lib/libcam.utils.so
lib/libmpojni.so
lib/libmtklimiter.so
lib/libMtkVideoTranscoder.so
lib/libaudiocustparam.so
lib/libcam_platform.so
lib/libcam.device1.so
lib/libcamalgo.so
lib/libm4u.so
lib/libimageio.so
lib/libcustom_prop.so
lib/libmjc.so
lib/libmtknfc.so
lib/libaudiodcrflt.so
lib/libblisrc32.so
lib/libmpoencoder.so
lib/libClearMotionFW.so
lib/libOpenMAXAL.so
lib/libhwm.so
lib/libmtkshifter.so
lib/libfeatureio.so
lib/libion_mtk.so
lib/libjtranscode.so
lib/libvc1dec_sa.ca7.so
lib/liba3m.so
lib/libgifEncoder_jni.so
lib/libion.so
lib/libbluetoothdrv.so
lib/libMJCjni.so
lib/libdrmmtkutil.so
lib/libmpo.so
lib/libcam.client.so
lib/libnvram_daemon_callback.so
lib/mtk-rilmd2.so
lib/libJpgEncPipe.so
lib/libnvram.so
lib/libMtkOmxVenc.so
lib/libadpcm.so
lib/libblisrc.so
lib/libvcodec_utility.so
lib/libbwc.so
lib/libcam.exif.so
lib/libcustom_nvram.so
lib/libfile_op.so
lib/libbessound_hd_mtk.so
lib/librilmtkmd2.so
lib/libcvsd_mtk.so
lib/libmp4enc_sa.ca7.so
lib/libAGifEncoder.so
lib/libcam_utils.so
lib/libbluetooth_mtk.so
lib/libmmprofile.so
lib/libvp9dec_sa.ca7.so
lib/libgccdemangle.so
lib/libMtkOmxVdec.so
lib/libMtkOmxCore.so
lib/libipod.so
lib/libmtk_cipher.so
lib/libmsbc_mtk.so
lib/libcurl.so
lib/libdrmmtkwhitelist.so
lib/lib3a.so
lib/libcam.camadapter.so
lib/libui_ext.so
lib/libmtk_mmutils.so
lib/libmtk_mali_user.so
lib/libmmprofile_jni.so
lib/libstagefrighthw.so
lib/libmtk_drvb.so
lib/libMali.so
lib/libcameracustom.so
lib/libaudiocomponentengine.so
lib/libcamera_client_mtk.so
lib/libcamdrv.so
lib/libJpgDecPipe.so
lib/libnvram_platform.so
lib/libmdloggerrecycle.so
lib/librilmtk.so
lib/libmatv_cust.so
lib/libmnl.so
lib/libcam.camshot.so
lib/libaudiocompensationfilter.so
lib/libvp8dec_sa.ca7.so
lib/libnativecheck-jni.so
lib/libspeech_enh_lib.so
lib/libmtkplayer.so
lib/libmhalImageCodec.so
vendor/
xbin/BGW
xbin/mnld"

# get data from a device
if [ -z $SOURCE ]; then
  for FILE in $SYSTEM ; do
    T=$TARGET/$FILE
    adb pull /system/$FILE $T
  done
  exit 0
fi

# get data from folder
for FILE in $SYSTEM ; do
  S=$SOURCE/$FILE
  T=$TARGET/$FILE
  mkdir -p $(dirname $T) || exit 1
  rsync -av --delete $S $T || exit 1
done
exit 0

