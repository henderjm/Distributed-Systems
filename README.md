Distributed-Systems
===================

This is the first tutorial for class CS4032. 

Purpose is to get used to using Sockets and how to deal with TCP connections by letting server know when
it has received all the data from the client and vice versa. 

This system starts off by the user sending the contents of a file to the server. The server then
gets the word frequency of that file and sends it back to the client.

If extra command line params exist, the client will parse the results to only show the word freqs
that match params. If no params exist, the client will print all word freqs to terminal.
