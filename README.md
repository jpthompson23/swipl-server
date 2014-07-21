swipl-server
============

-   A script for SWI-Prolog that runs a server listening for requests to execute
assertions and queries.
-   A client module for Python to issue Prolog assertions & queries.

You must install SWI-Prolog.  You can download it on Ubuntu like so:

    sudo apt-get install swi-prolog
    
It comes with the http package required to run the server.

## Usage:

    from swiplclient import PrologDB
    
    PL_HOST = "localhost"
    PL_PORT = 5000
    PL_PASSWORD = "xyzzy"
    
    prolog = PrologDB(PL_HOST, PL_PORT, PL_PASSWORD)
    
    # Sample assertions and query:
    
    prolog.add("father(jack, john)")
    prolog.add("brothers(joey, jack)")
    prolog.add("brothers(A,B) :- "
                            "B @< A, brothers(B,A)") # Make brothers/2 symmetric
    prolog.add("uncle(X,Y) :- brothers(Z,X), father(Z,Y)")
    print prolog.query("uncle(Uncle,Nephew)")

DISCLAIMER: This code is provided as-is.  I take no responsibility for any security vulnerabilities related to hosting a server that executes procedures called remotely.  There's a password that can be set for the server, but that's just my little band-aid -- I don't know enough about SWI-Prolog to know whether this program is secure.
