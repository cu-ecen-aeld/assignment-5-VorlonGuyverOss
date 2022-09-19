
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
#AESD_ASSIGNMENTS_VERSION = '#COMMIT VERSION NUMBER'
#AESD_ASSIGNMENTS_VERSION = '636ac625aa2aecb5a731469a18f77998bba2e545'
#AESD_ASSIGNMENTS_VERSION = '982c57906478b1a99056ce88431a374c74b20aef'
#AESD_ASSIGNMENTS_VERSION = '570d44761f1c27245b1619077bd533f0953406fa'
#AESD_ASSIGNMENTS_VERSION = 'dc1c593c9207e1d1d5535b2c0b7a21c4e64bcd3b'
#AESD_ASSIGNMENTS_VERSION = '3ddf2a699e918e7031e2de1698aa82852c6b3cac'
#AESD_ASSIGNMENTS_VERSION = '791f5839bf319d0131e62c73cc52e96df7afc960'

#Assignment 4 part 2
#AESD_ASSIGNMENTS_VERSION = '773c11671b100b34b43b170a5b9ee1c2a43e274b'

#Assignment 5 part 2
#AESD_ASSIGNMENTS_VERSION = '4a833f0ec7df6466a815919974277736ba2c7ce4'
#AESD_ASSIGNMENTS_VERSION = '0bacf990743c7789b67e7b1350aa105a1062f63e'
#AESD_ASSIGNMENTS_VERSION = '202ef0d2f638e90e54998b342a509afa3df287a5'
#AESD_ASSIGNMENTS_VERSION = '5ce244e695000ad17f2fe70b6e37c2455df2256d'
AESD_ASSIGNMENTS_VERSION = 'fef296a5eca2566126c9bc1784a8dd78fc2ac967'

# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
#AESD_ASSIGNMENTS_SITE = '#GITHUB REPOSITORY LINK'
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-VorlonGuyverOss.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin

# Added code below

	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin


	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
	$(INSTALL) -m 0755 $(@D)/server/TEST_DIR/sockettest.sh $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/TEST_DIR/sockettest-FGREEN.sh $(TARGET_DIR)/usr/bin

endef

$(eval $(generic-package))
