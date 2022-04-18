/*

Michelle_Lai_laimic12_1007260250
Jasmine_Chahal_chahal44_1006872889
Katriel_Ung_ungkatri_1006747200

*/

### RESET: for reruns
reset;

### SETS: 

set shoe_num;			# associated index: i
set RM_num;				# associated index: j
set machine_num;		# associated index: k
set warehouse_num;		# associated index: w

### PARAMETERS: 

param price{i in shoe_num};											# price per shoe
param demand{i in shoe_num};										# average demand from Jan 1997 to 2003 for half of Feb 2007 demand
param materialAvail{j in RM_num};									# quantity of raw material available
param materialUsed{i in shoe_num,j in RM_num} default 0;		    # amount of raw material used
param materialCost{j in RM_num};		    						# cost of raw material
param machineCost{k in machine_num};								# cost to operate the machine
param machineTime{i in shoe_num, k in machine_num} default 0;		# time to produce one unit of one type of shoe (s)
param warehouseCap{w in warehouse_num};								# capacity of each warehouse
param warehouseCost{w in warehouse_num};        					# cost of each warehouse operation 

### VARIABLE: 

var x{i in shoe_num};
var y{w in warehouse_num} binary;

### OBJECTIVE FUNCTION:

maximize profit: sum{i in shoe_num} x[i] * price[i] 								# total revenue
	- sum{i in shoe_num} (2*10*demand[i] - x[i]) * 10 								# discrepancy: revenue lost from not meeting demand
	- sum{i in shoe_num, k in machine_num} machineTime[i,k] * x[i] * 25 / 3600		# wage of machine operator per hour 
	- sum{i in shoe_num, k in machine_num} machineTime[i,k] * machineCost[k] / 60 	# cost of operating machine
	- sum{i in shoe_num, j in RM_num} materialUsed[i, j] * materialCost[j] * x[i] 	# cost of raw materials
	- sum{w in warehouse_num} warehouseCost[w] * y[w];								# cost of warehouse operations

### CONSTRAINTS:

# 1. Cost of materials: budget of $10,000,000
subject to materialBudget: sum{i in shoe_num, j in RM_num} x[i] * materialUsed[i,j] * materialCost[j] <= 10000000;

# 2. Each machine will run up to 12h/day, 28days/mo. (1209600s/machine)
subject to machineRunTime{k in machine_num}: sum{i in shoe_num} machineTime[i,k] * x[i] <= 1209600;

# 3. Each warehouse has a specific capacity					
subject to maxShoes: sum{i in shoe_num} x[i] <= sum{w in warehouse_num} warehouseCap[w] * y[w];

# 4. Quantity of raw material used must be less than the available raw material
subject to materialSupply{j in RM_num}: sum{i in shoe_num} x[i] * materialUsed[i,j] <= materialAvail[j];

# 5. The production amount of a shoe type must be less than the demand for that specific shoe type
subject to produceAndDemand{i in shoe_num}: x[i] <= 2*10*demand[i];

# 6. Non-negativity
subject to nonneg{i in shoe_num} : x[i] >= 0;
