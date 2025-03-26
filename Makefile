CC =gcc
CFLAGS= -Wall -lm
MPICC=mpicc

hello_world: hello_world.c
	$(MPICC) $(CFLAGS) -o hello_world hello_world.c

hello_world_mpi: hello_world_mpi.c
	$(MPICC) $(CFLAGS) -o hello_world_mpi hello_world_mpi.c

p2p_hello_world: p2p_hello_world.c
	$(MPICC) $(CFLAGS) -o p2p_hello_world p2p_hello_world.c

p2p_hello_world_v1: p2p_hello_world_v1.c
	$(MPICC) $(CFLAGS) -o p2p_hello_world_v1 p2p_hello_world_v1.c

clean:
	rm -f hello_world p2p_hello_world p2p_hello_world_v1

