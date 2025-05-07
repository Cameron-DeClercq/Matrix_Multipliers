# Matrix_Multipliers
Keywords:
- First Design (Includes Unpipelined Multiplier Block in Processing Elements)
- Second Design (Includes Pipelined Multiplier Block in Processing Elements)

Working Change Notes:
**In the following working changes, a 4x4 * 4x4 matrix multiplication is meant when refering to a "full matrix multiplication"

- The first design will be modified in the next push such that the reset signal propogates diagonally across the array from the 0,0th element so that it supports proper pipelining of matrix multiplications (after 7-cycle filling of pipeline it will take 5-cycles between matrix multiplications)
- The second design will be altered similarly to support the above change, except the reset logic associated with the input propogation registers will be removed. This way a full matrix multiplication can be realized every 5 cycles after the intial 7-cycle filling of the pipeline without a 6th cycle being necessary as 0's propagate through the pipelined multiplier in the cycle following a reset.


Repo Structure: (in systolic_array)

Component
  - Schematic
  - Symbol (In all folders except those containing highest level design)
  - Layout
  - (Misc. Spice files for/from Testing)
