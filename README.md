# lulesh-chainsaw

Rewrite the lulesh problem using Chainsaw, a new parallel language

## Timeline

#### Week 9.11

- Most time-consuming parts (according to profiler)

	- `CalcElemShapeFunctionDerivative`
		- `LagrangeLeapFrog` (2640)
		- `LagrangeNodal` (1252)
		- `CalcForceForNodes` (1132)
		- `CalcVolumeForceForElems` (1090)
		- `IntegrateStressInElems` (523)
		- **~50%** `CalcElemShapeFunctionDerivative` (319)
	
	- `CalcKinematicForElems` + `CalcElemVolume`
		- `LagrangeLeapFrog` (2640)
		- `LagrangeElements` (2454)
		- `CalcLagrangeElements` (1601)
		- **~10%** `CalcKinematicsForElems` (1533)
		- **~2%** `CalcElemVolume` (1302)

#### Weak 9.18

- `Domain`: a collection of vectors, condition variables (time), constants
	- Mainly consists of a bunch of getters/setters
	- ~700 line constructor (can simply replicate, or some optimizations)

- Communication: everything is done through a 2-d array `fieldData`
	- No indication of saving old/new states of the cube
	- Boundary conditions: typical, every node gets a local `Domain`
	- Need to walk through `CommSend` and `CommRecv` since customized

- Next Steps: try to replicate the most time-consuming part `FunctionDerivative`
	- Modify original code to just time that part
	- Compare the performance results of original and Chainsaw
	- May require multiple weeks since we need more understanding of Chainsaw
