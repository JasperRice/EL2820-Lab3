clear all
clc

syms I z y a b gama A mu N r g m pIe

adot = 1/m*(gama*a + A*mu*N^2*r^2/4*(I/z)^2 - 3*mu*m^2/(2*pIe*(y-z)^4) - m*g);
bdot = 1/m*(gama*b - A*mu*N^2*r^2/4*(I/y)^2 + 3*mu*m^2/(2*pIe*(y-z)^4) - m*g);
zdot = a;
ydot = b;

del_adot_dela = diff(adot,a);
del_adot_delb = diff(adot,b);
del_adot_delz = diff(adot,z);
del_adot_dely = diff(adot,y);
del_adot_delI = diff(adot,I);

del_bdot_dela = diff(bdot,a);
del_bdot_delb = diff(bdot,b);
del_bdot_delz = diff(bdot,z);
del_bdot_dely = diff(bdot,y);
del_bdot_delI = diff(bdot,I);

del_zdot_dela = diff(zdot,a);
del_zdot_delb = diff(zdot,b);
del_zdot_delz = diff(zdot,z);
del_zdot_dely = diff(zdot,y);
del_zdot_delI = diff(zdot,I);

del_ydot_dela = diff(ydot,a);
del_ydot_delb = diff(ydot,b);
del_ydot_delz = diff(ydot,z);
del_ydot_dely = diff(ydot,y);
del_ydot_delI = diff(ydot,I);

Amat = [del_adot_dela del_adot_delb del_adot_delz del_adot_dely;
        del_bdot_dela del_bdot_delb del_bdot_delz del_bdot_dely;
        del_zdot_dela del_zdot_delb del_zdot_delz del_zdot_dely;
        del_ydot_dela del_ydot_delb del_ydot_delz del_ydot_dely]
    
Bmat = [del_adot_delI;
        del_bdot_delI;
        del_zdot_delI;
        del_ydot_delI]