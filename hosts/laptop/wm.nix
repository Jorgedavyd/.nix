_: {
    environment.variables = {
        LIBVA_DRIVER_NAME = "iHD";                      # for Intel VA-API acceleration
        VDPAU_DRIVER = "va_gl";                         # fallback for VDPAU apps via VA-API
        DRI_PRIME = "1";                                # if using PRIME offloading with hybrid GPU
        WLR_DRM_NO_ATOMIC = "0";                        # atomic modesetting (default = 0 = enabled)
        WLR_RENDERER_ALLOW_SOFTWARE = "1";              # fallback to software renderer if needed
    };
}
