#include <stdio.h>
#include <mpi.h>  // This is the header file for MPI functions

/*
  int main(int argc, char* argv[])

  The main program is the starting point for an MPI program.
  This one simply prints each process rank in order.  Sorting is done
  by using message passing to coordinate.

  Inputs: none

  Outputs: Prints "Hello World #" where # is the rank of the process 
  in order.

*/

int main(int argc, char* argv[])
{
  // First thing is to initialize the MPI interface.  Some arguments can
  // be passed through to the MPI interface, so the argument list is
  // sent by sending the argument list
  MPI_Init(&argc, &argv);

  // Determine the rank of the current process
  int irank;
  MPI_Comm_rank(MPI_COMM_WORLD, &irank);

  // Determine the number of processes
  int nproc;
  MPI_Comm_size(MPI_COMM_WORLD, &nproc);

  int data;
  //printf("Initialize program by rank %d\n",irank);

    // All processes send the go ahead message except the last process
  if (irank == nproc-1) {
    data = irank*irank;
    // Send the go ahead message to rank+1.  Using rank^2 as fake data
    MPI_Send(&data, 1, MPI_INT, 0, 100, MPI_COMM_WORLD);
    }

  if (irank < nproc-1) {
    data = irank*irank;
    // Send the go ahead message to rank+1.  Using rank^2 as fake data
    MPI_Send(&data, 1, MPI_INT, irank+1, 101, MPI_COMM_WORLD);
  }



  // All processes print hello
  printf("Hello from rank %d out of %d\n", irank, nproc);

  
    // If not the first process, wait for permission to proceed
  if(irank==0) {
  MPI_Recv(&data, 1, MPI_INT, nproc-1, 100, MPI_COMM_WORLD, 
	     MPI_STATUS_IGNORE);
    printf("Rank %d has received message with data %d from rank %d\n",
	   irank, data, nproc-1);
	   }

  if (irank > 0) {
    // Wait for a message from rank-1 process
    MPI_Recv(&data, 1, MPI_INT, irank-1, 101, MPI_COMM_WORLD, 
	     MPI_STATUS_IGNORE);
    printf("Rank %d has received message with data %d from rank %d\n",
	   irank, data, irank-1);
    }



  // Must shut down the MPI system when you're done.  
  // If you don't, there can be lots of junk left behind.
  MPI_Finalize();

  return 0;
}
