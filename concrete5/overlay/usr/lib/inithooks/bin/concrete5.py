#!/usr/bin/python
"""Set Concrete5 admin password and domain to serve

Option:
    --pass=     unless provided, will ask interactively
    --email=    unless provided, will ask interactively
                DEFAULT=admin@example.com

"""

import sys
import getopt
import shutil
import md5
import random as random
import string

from dialog_wrapper import Dialog
from mysqlconf import MySQL

import os

def usage(s=None):
    if s:
        print >> sys.stderr, "Error:", s
    print >> sys.stderr, "Syntax: %s [options]" % sys.argv[0]
    print >> sys.stderr, __doc__
    sys.exit(1)

DEFAULT_EMAIL="admin@example.com"

def main():
    try:
        opts, args = getopt.gnu_getopt(sys.argv[1:], "h",
                                       ['help', 'pass=', 'email='])
    except getopt.GetoptError, e:
        usage(e)

    email = ""
    password = ""
    for opt, val in opts:
        if opt in ('-h', '--help'):
            usage()
        elif opt == '--pass':
            password = val
        elif opt == '--email':
            email = val

    if not password:
        d = Dialog('TurnKey Linux - First boot configuration')
        password = d.get_password(
            "Concrete5 Admin Password",
            "Enter new password for the Concrete5 'admin' account.")

    if not email:
        if 'd' not in locals():
            d = Dialog('TurnKey Linux - First boot configuration')

        email = d.get_input(
            "Concrete5 Admin email",
            "Enter the email address for the Concrete5 Admin user).",
            DEFAULT_EMAIL)

    if email == "DEFAULT":
        email = DEFAULT_EMAIL

        # Create salt and hash salted password
    salt = "".join(random.choice(string.letters+string.digits) for line in range(1, 65))
    hash = md5.md5(password+':'+salt)
    hashpass = hash.hexdigest()

# Write admin email and hashed & salted password to DB
    m = MySQL()
    m.execute('UPDATE concrete5.Users SET uPassword=\"%s\"  WHERE uName=\"admin\";' % hashpass)
    m.execute('UPDATE concrete5.Users SET uEmail=\"%s\" WHERE uName=\"admin\";' % email)

#Write conf file (site.php)
# Set some variables
    CONF_DIR = "/var/www/concrete5/config/"
    CONF_FILE = CONF_DIR+"site.php"
    BACKUP_FILE = CONF_FILE+".backup"
    TEMP_FILE = CONF_FILE+".tmp"
    start = "define('"
    mid = "', '"
    end = "'); \n"
    URL_LINE = start+"BASE_URL"+mid
    SALT_LINE = start+"PASSWORD_SALT"+mid
#    NEW_URL_LINE = URL_LINE+protocol+"://"+domain+end
    NEW_SALT_LINE = SALT_LINE+salt+end

# Backup conf
    shutil.copy2(CONF_FILE, BACKUP_FILE)

# Write new conf to temp file
    conf = open(CONF_FILE, "r")
    temp = open(TEMP_FILE, "w")
    temp.write(conf.readline())
    for line in conf:
#        if line.lstrip().startswith(URL_LINE):
#            temp.write(NEW_URL_LINE)
        if line.lstrip().startswith(SALT_LINE):
            temp.write(NEW_SALT_LINE)
        else:
            temp.write(line)
    conf.close()
    temp.close()

# Rename temp file (and overwrite old conf)
    shutil.move(TEMP_FILE, CONF_FILE)

if __name__ == "__main__":
    main()
