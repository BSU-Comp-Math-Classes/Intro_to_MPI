CC =gcc
CFLAGS= -Wall -lm
MPICC=mpicc

derivative_mpi: derivative_mpi.c finite_difference_mpi.c
	$(MPICC) $(CFLAGS) -o derivative_mpi derivative_mpi.c

clean:
	rm -f derivative_mpi

