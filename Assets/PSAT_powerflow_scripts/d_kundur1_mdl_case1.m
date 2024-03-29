Bus.con = [ ... 
  1  20  1.03  0.3229  1  1;
  2  20  1.01  0.1536  1  1;
  3  20  1.03  -0.1187  2  1;
  4  20  1.01  -0.295  2  1;
  5  230  1.01  0.2112  1  1;
  6  230  0.9876  0.03665  1  1;
  7  230  1  -0.1065  1  1;
  8  230  1  -0.3368  3  1;
  9  230  0.9899  -0.555  2  1;
  10  230  0.9938  -0.4119  2  1;
  11  230  1.013  -0.2339  2  1;
 ];

Line.con = [ ... 
  5  6  100  230  60  0  0  0.0025  0.025  0.04375  0  0  1  0  0  1;
  6  7  100  230  60  0  0  0.001  0.01  0.0175  0  0  1  0  0  1;
  7  8  100  230  60  0  0  0.011  0.11  0.1925  0  0  1  0  0  1;
  8  9  100  230  60  0  0  0.011  0.11  0.09625  0  0  1  0  0  1;
  8  9  100  230  60  0  0  0.011  0.11  0.1925  0  0  1  0  0  1;
  11  10  100  230  60  0  0  0.0025  0.025  0.04375  0  0  1  0  0  1;
  9  10  100  230  60  0  0  0.001  0.01  0.0175  0  0  1  0  0  1;
  7  8  100  230  60  0  0  0.011  0.11  0.09625  0  0  1  0  0  1;
  1  5  900  20  60  0  0.08695652  0  0.15  0  0  0  1  0  0  1;
  2  6  900  20  60  0  0.08695652  0  0.15  0  0  0  1  0  0  1;
  4  10  900  20  60  0  0.08695652  0  0.15  0  0  0  1  0  0  1;
  3  11  900  20  60  0  0.08695652  0  0.15  0  0  0  1  0  0  1;
 ];

Fault.con = [ ... 
  8  100  230  60  1  1.05  0  1e-05;
 ];

SW.con = [ ... 
  3  100  20  1.03  -0.1186824  99  -99  1.1  0.9  7  1  1  1;
 ];

PV.con = [ ... 
  1  100  20  5  1.03  5  -2  1.1  0.9  1  1;
  2  100  20  5  1.01  5  -2  1.1  0.9  1  1;
  4  100  20  5  1.01  5  -2  1.1  0.9  1  1;
 ];

PQ.con = [ ... 
  9  100  230  10.00 0.0  1.05  0.95  0;
  7  100  230  5.00  0.0  1.05  0.95  0;
 ];

Pl.con = [ ... 
  7  100  230  60  0  100  0  0  0  100  1  1;
  9  100  230  60  0  100  0  0  0  100  1  1;
 ];

Syn.con = [ ... 
  4  900  20  60  6  0.2  0.0025  1.8  0.3  0.25  8  0.03  1.7  0.55  0.25  0.4  0.05  12.35  0  0  0  1  1  0  0  0  1  1;
  2  900  20  60  6  0.2  0.0025  1.8  0.3  0.25  8  0.03  1.7  0.55  0.25  0.4  0.05  13  0  0  0  1  1  0  0  0  1  1;
  1  900  20  60  6  0.2  0.0025  1.8  0.3  0.25  8  0.03  1.7  0.55  0.25  0.4  0.05  13  0  0  0  1  1  0.002  0  0  1  1;
  3  900  20  60  6  0.2  0.0025  1.8  0.3  0.25  8  0.03  1.7  0.55  0.25  0.4  0.05  12.35  0  0  0  1  1  0  0  0  1  1;
 ];

Bus.names = {... 
  'Bus 01'; 'Bus 02'; 'Bus 03'; 'Bus 04'; 'Bus 05'; 
  'Bus 06'; 'Bus 07'; 'Bus 08'; 'Bus 09'; 'Bus 10'; 
  'Bus 11'};

