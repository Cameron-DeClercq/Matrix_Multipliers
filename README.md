# Matrix_Multipliers
Keywords:
- First Design (Includes Unpipelined Multiplier Block in Processing Elements)
- Second Design (Includes Pipelined Multiplier Block in Processing Elements)

Change Notes:
**In the following changes, a "full matrix multiplication" refers to a matrix multiplication between two 4x4 arrays

- The first design was modified in the last push such that the reset signal propogates diagonally across the array from the 0,0th element so that it supports proper pipelining of matrix multiplications (after 7-cycle filling of pipeline it will take 5-cycles between matrix multiplications). This change proved succesful in both the schematic and layout, and now the laid out design can handle a throughput of ~36Gbps at ~1.42GHz.
- The second design was altered similarly to support the above change, except the reset logic associated with the input propogation registers were also removed. This way a full matrix multiplication can be realized every 5 cycles after the intial 7-cycle filling of the pipeline without a 6th cycle being necessary as 0's propagate through the pipelined multiplier in the cycle following a reset. This change proved succesful within the schematic, however the layout encountered timing issues during simulation. Further testing is necessary for a proper diagnosis, but the most likely causes currently suspected are either poor clock signal distribution (which could potentially be fixed by including an H-tree for the signal rather than relying only on abutment), or unreliable power distribution.


Repo Structure: (in systolic_array):

Component_Name
  - Schematic
  - Symbol (In all folders except those containing highest level design)
  - Layout
  - (Misc. Spice files for/from Testing)
