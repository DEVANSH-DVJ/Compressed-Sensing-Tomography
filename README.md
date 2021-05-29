# Compressed Sensing Tomography

Tomography is the task of reconstructing a 2D image (object) from its 1D projections, or a 3D image (object) from its 2D projections.  
We take 18 radon projections of an MRI volume of a brain.  
We reconstruct the MRI slices using Filtered Back Projection (FBP) algorithm using Ram-Lak filter, Compressed Sensing algorithm and slice Coupled Compressed Sensing algorithms.

## CS in Tomography

In most tomography applications, the number of angles of projection is limited due to cost, energy and health considerations.  
So the problem is of practical interest in the "angle starved" case.  
Hence tomography can be considered a compressed sensing problem.

The FBP algorithm which is used for inverse radon transform doesn't exploit the sparsity (or compressibility) of natural images in DCT bases.  
We use this principle (CS) to form a cost minimization problem:  
![](others/CS.png)

One can make use of additional redundancy in the data – the difference between two consecutive slices is sparse.  
This can be used to improve the tomographic reconstruction quality for the same number of measurements – if one chooses different angles for different slices.  
The cost minimization problem formed for 2 slice Coupled CS:  
![](others/CCS2.png)  
The cost minimization problem formed for 3 slice Coupled CS:  
![](others/CCS3.png)
