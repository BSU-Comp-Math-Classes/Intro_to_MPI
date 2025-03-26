CC =gcc
CFLAGS= -Wall -lm
MPICC=mpicc

p2p_hello_world: p2p_hello_world.c
	$(MPICC) $(CFLAGS) -o p2p_hello_world p2p_hello_world.c

p2p_hello_world_v1: p2p_hello_world_v1.c
	$(MPICC) $(CFLAGS) -o p2p_hello_world_v1 p2p_hello_world_v1.c

clean:
	rm -f p2p_hello_world p2p_hello_world_v1

