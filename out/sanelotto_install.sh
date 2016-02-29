#!/usr/bin/env python3

import os
import base64
import zipfile

archive = b"""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"""

# installing
def install():
    # dir for installing
    install_dir = '/usr/share/'

    # access check
    if not os.access('/usr/local/bin', os.W_OK) or not os.access(install_dir, os.W_OK):
        print('[\033[91mERROR\033[0m] Permission denied')
        return False

    # install check
    if os.access(install_dir + '/Sanelotto', os.F_OK):
        print('[\033[91mERROR\033[0m] Sanelotto already installed')
        return False

    # creating main dir
    try:
        os.mkdir(install_dir + '/Sanelotto')
        print('[\033[92mOK\033[0m] Directory created')
    except:
        print('[\033[91mERROR\033[0m] Failed to create /usr/share/Sanelotto')
        return False

    # unpacking
    try:
        # creating
        temp_archive = open(install_dir + '/Sanelotto/temp_sl.zip', 'wb')
        temp_archive.write(base64.decodebytes(archive))
        temp_archive.close()
        # extracting
        temp_archive_obj = zipfile.ZipFile(install_dir + '/Sanelotto/temp_sl.zip', 'r')
        temp_archive_obj.extractall(install_dir + '/Sanelotto')
        # deleting temp archive
        os.remove(install_dir + '/Sanelotto/temp_sl.zip')
        print('[\033[92mOK\033[0m] Sanelotto extracted')
    except:
        print('[\033[91mERROR\033[0m] Failed to unpack Sanelotto')
        return False

    # creating link
    try:
        os.symlink(install_dir + '/Sanelotto/sanelotto', '/usr/local/bin/sanelotto')
        os.chmod('/usr/local/bin/sanelotto', 0o777)
        print('[\033[92mOK\033[0m] Link created')
    except:
        print('[\033[91mERROR\033[0m] Failed to create symlink')
        return False

    print('[\033[92mDONE\033[0m] Sanelotto successfully installed')

# start
install()