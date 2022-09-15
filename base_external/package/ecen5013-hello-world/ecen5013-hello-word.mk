# Credit goes to the University of Colorado - Boulder Coursera Edition
# URL: https://github.com/cu-ecen-aeld/buildroot-external/blob/ecen5013-hello-world/base_external/package/ecen5013-hello-world/ecen5013-hello-world.mk
#####


################################################################################
#
# ecen5013-hello-world
#
################################################################################

ECEN5013_HELLO_WORLD_VERSION = 452e6e18d1323df20a309e1e55300063d893777e
# Note: we use an https URL here because the repository is public
# If it were private, we'd use an SSH URL instead.
ECEN5013_HELLO_WORLD_SITE = https://github.com/cu-ecen-5013/ecen5013-hello-world.git
ECEN5013_HELLO_WORLD_SITE_METHOD = git

define ECEN5013_HELLO_WORLD_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define ECEN5013_HELLO_WORLD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/hello-ecen5013 $(TARGET_DIR)/bin
endef

$(eval $(generic-package))
