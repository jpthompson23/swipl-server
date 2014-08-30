swipl-server
============

-   A script for SWI-Prolog that runs a server listening for requests to execute
assertions and queries.
-   A client module for Python to issue Prolog assertions & queries.

You must install the latest development version of SWI-Prolog (it needs to have the serialize_unknown option available for [json_write](http://www.swi-prolog.org/pldoc/man?predicate=json_write/2).)

## Usage:

    from swiplclient import Prolog

    PL_HOST = "localhost"
    PL_PORT = 5000
    PL_PASSWORD = "xyzzy"

    prolog = Prolog(PL_HOST, PL_PORT, PL_PASSWORD)

    # Sample assertions and query:

    prolog.add("father(jack, john)")
    prolog.add("brothers(joey, jack)")
    prolog.add("brothers(A,B) :- "
                            "B @< A, brothers(B,A)") # Make brothers/2 symmetric
    prolog.add("uncle(X,Y) :- brothers(Z,X), father(Z,Y)")
    print prolog.query("uncle(Uncle,Nephew)")

#### DISCLAIMER:
This code is provided *as-is*.  I take no responsibility for any security vulnerabilities related to hosting a server on your machine that executes procedures called by a remote client.  There's a password that can be set for the server, but that's just my little band-aid.  Obviously, since this program doesn't use SSL, anyone sniffing your traffic can get the password.  So just be careful.  I take no responsibility for anything going wrong.
