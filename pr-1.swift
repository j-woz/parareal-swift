
import files;
import io;
import sys;

SLICES     = 5;
ITERATIONS = 5;

// D[iteration][slice]
int D[][];

app (file f) simulation(int start, int i, int s, int v)
{
  "simulation.sh" start i s v f ;
}

start = clock_seconds();

foreach iteration in [1:ITERATIONS]
{
  foreach slice in [1:SLICES]
  {
    printf("iteration: %i slice: %i", iteration, slice);
    name = "out-%i-%i.txt" % (iteration, slice);
    if (iteration == 1 && slice == 1) // base case (lower left)
    {
      file f<name>;
      f = simulation(start, iteration, slice, 0);
      value = string2int(read(f));
      D[1][1] = value;
    }
    else if (iteration <= slice)
    {
      if (iteration == 1) // left column
      {
        file f<name>;
        f = simulation(start, iteration, slice, D[iteration][slice-1]);
        value = string2int(read(f));
        D[iteration][slice] = value;
      }
      else // remaining cells
      {
        file f<name>;
        f = simulation(start, iteration, slice, D[iteration-1][slice]);
        value = string2int(read(f));
        D[iteration][slice] = value;
      }
    }
  }
}
