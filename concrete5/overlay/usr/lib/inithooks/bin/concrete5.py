#!/usr/bin/python
"""Set Concrete5 admin password and domain to serve

Option:
    --pass=     unless provided, will ask interactively # Not working yet
    --protocol= unless provided, will ask interactively
                DEFAULT=http
    --domain=   unless provided, will ask interactively
                DEFAULT=concrete5.example.com
"""

import sys
import getopt
import shutil
import hashlib

from dialog_wrapper import Dialog

def usage(s=None):
    if s:
        print >> sys.stderr, "Error:", s
    print >> sys.stderr, "Syntax: %s [options]" % sys.argv[0]
    print >> sys.stderr, __doc__
    sys.exit(1)

DEFAULT_DOMAIN="concrete5.example.com"
DEFAULT_PROTOCOL="http"

def main():
    try:
        opts, args = getopt.gnu_getopt(sys.argv[1:], "h",
                                       ['help', 'pass=', 'protocol=', 'domain='])
    except getopt.GetoptError, e:
        usage(e)

    protocol = ""
    domain = ""
    password = ""
    for opt, val in opts:
        if opt in ('-h', '--help'):
            usage()
        elif opt == '--pass':
            password = val
        elif opt == '--protocol':
            protocol = val
        elif opt == '--domain':
            domain = val

# Set password part - commented out for now as I can't get this working.
#    if not password:
#        d = Dialog('TurnKey Linux - First boot configuration')
#        password = d.get_password(
#            "Concrete5 Password",
#            "Enter new password for the Concrete5 'admin' account.")
    
    if not protocol:
        if 'd' not in locals():
            d = Dialog('TurnKey Linux - First boot configuration')

        protocol = d.get_input(
            "Concrete5 Protocol",
            "Enter the protocol to serve Concrete5 (http or https).",
            DEFAULT_PROTOCOL)

    if protocol == "DEFAULT":
        protocol = DEFAULT_PROTOCOL

    if not domain:
        if 'd' not in locals():
            d = Dialog('TurnKey Linux - First boot configuration')

        domain = d.get_input(
            "Concrete5 Domain",
            "Enter the domain to serve Concrete5.",
            DEFAULT_DOMAIN)

    if domain == "DEFAULT":
        domain = DEFAULT_DOMAIN

# This is from TKL Magento config - doesn't work for Concrete5 - needs some jigging...
#    hashpass = hashlib.md5("qX" + password).hexdigest() + ":qX"

# Set some variables
    CONF_DIR = "/var/www/concrete5/config/"
    CONF_FILE = CONF_DIR+"site.php"
    OLD_CONF_FILE = CONF_DIR+"oldsite.php"
    BLANK_CONF_FILE = CONF_DIR+"blanksite.php"
    URL_FILE = CONF_DIR+"baseurl.php"
    DB_FILE = CONF_DIR+"dbpass.php"

# Create baseurl.php with relevant info
    urlfile = open(URL_FILE, "w")
    urlfile.write("define('BASE_URL', '")
    urlfile.write(protocol)
    urlfile.write("://")
    urlfile.write(domain)
    urlfile.write("');")
    urlfile.close()

# Backup current site.php & replace site.php with blanksite.php
    shutil.copy2(CONF_FILE, OLD_CONF_FILE)
    shutil.copy2(BLANK_CONF_FILE, CONF_FILE)

# Create new site.php
    urlfile = open(URL_FILE)
    urlline = urlfile.read()
    urlfile.close()

    dbfile = open(DB_FILE)
    dbpassline = dbfile.read()
    dbfile.close()

    conffile = open(CONF_FILE, "a")
    conffile.write("\n")
    conffile.write(dbpassline)
    conffile.write(urlline)
    conffile.close()

if __name__ == "__main__":
    main()

