--Macaulay2: Alegebra and Algebraic Geometry
--Undergraduate Students Seminar
--∃ n, P(n) ∈ Science
--3rd Session
--SLU MADRID
--Book: David A. Cox John Little Donal O’Shea,
--Using Algebraic Geometry (2nd edition)
--(Alexandru Iosif)

--Consider the field with 7
F7 = GF (7)
netList table(
    {0,1,2,3,4,5,6},
    {0,1,2,3,4,5,6},
    (i,j)->promote(i+j,F7)
    )

netList table(
    {0,1,2,3,4,5,6},
    {0,1,2,3,4,5,6},
    (i,j)->promote(i*j,F7)
    )

restart
--Consider the field with 9 elements:
F = GF(3^2,Variable=>a)
--Polynomial defining F:
ambient F
--We check that the polynomial a^2-a-1=0 in F.
a^2-a-1
--Addition and multiplication tables of F_4:
netList table(
    {0,1,2,a,a+1,a+2,2*a,2*a+1,2*a+2},
    {0,1,2,a,a+1,a+2,2*a,2*a+1,2*a+2},
    (i,j) -> promote(i+j, F))
netList table({0,1,2,a,a+1,a+2,2*a,2*a+1,2*a+2},
    {0,1,2,a,a+1,a+2,2*a,2*a+1,2*a+2},
    (i,j) -> promote(i*j, F))

restart
--EXERCISE 1
--Consider the linear code with n=4, k=2 given by the
--generator matrix.
--That is, C is a function F^2_2 ---> F^4_2
F2 = GF(2,Variable=>a)
G=matrix{{1,1,1,1},{1,0,1,0}}
--a. Show that since we have only the two scalars 0,1
--in F2 to use making kinear combinations,
--there are exactly four elements of C:
C=flatten table({G},
    {matrix{{0,0}},
	matrix{{0,1}},
	matrix{{1,0}},
	matrix{{1,1}}},
    (i,j)->promote(j*i,F2))
--b. Show that
H=matrix{{1,1},{1,0},{1,1},{1,0}}
--is a parity check matrix for C by verifying that
--xH = 0 for all x in C
table(C,{H},(i,j)->promote(i*j,F2))
promote(G*H,F2)
--Do you remember what is a parity check matrix?

restart
--We want to study the error correcting capability of coded.
--Hence we need a way of measuring how close elements
--of F^n_q are.
----Hamming distance:
------d(x,y)=|i,1≤i≤n:x_i≠x_j}|

HammingDistance = (x,y,F) ->(
    n:=0;
    m := numgens source x-1;
    for i from 0 to m do(
	if promote((x_i)_0,F) =!= promote((y_i)_0,F)
	   then n = n+1;
	);
    print n
    )

F=GF(2)
N=matrix{{0,1}}
M=matrix{{2,3}}
HammingDistance(M,N,F)

F=ZZ
N=matrix{{0,1,2}}
M=matrix{{2,1,3}}
HammingDistance(M,N,F)
