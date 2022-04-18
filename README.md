# Optimizing Company Profit Using Linear Programming 

# Context

In 2006, market analysts predicted that a shoe company would see a doubling in their customer’s demand for shoes in February from the previous month. A linear program (LP) has been formulated to create the most profitable production plan for the company. The model involves two decision variables: x_i, the amount of a specific type of shoe  produced i, and y_w, a binary variable indicating whether a certain warehouse space is utilized. The objective function seeks to maximize profit by minimizing expenses and is subject to five constraints: warehouse capacities, available quantity of raw materials, customer demands, budget for raw materials, total processing time for the machines and non-negativity. Upon solving this IP, using relaxation of the integer constraints, the optimal profit has been found to be $11,978,412.80. 

To maximize the company’s profit, the principles of linear programs (LPs) were used to model the expenses and incomes subject with specific constraints. The solution utilized SQL and MS Access for analysing and filtering data, AMPL for modeling the LP, and Gurobi for solving the LP. This method of deciding on the most profitable production plan is not only efficient, but it also increases objectivity – all assumptions will be detailed in a later section. This LP also facilitates sensitivity analyses, allowing the team to easily consider how sensitive the optimal solution is to external factors, such as changes in the cost of supply or demand for a specific shoe.

# Assumptions
1. Several assumptions were made during the formulation of this LP:
2. The product demand for February 2006 was assumed to be double the demand for January 2006 based on market prediction. To estimate the demand of January 2006, we calculated the mean demand for shoes in the month of January from 1997 to 2003 (inclusive). This mean past demand was multiplied by 2, to estimate the demand for February 2006
3. All manufacturing sequence and transportation costs are ignored
4. All set-up times for machines, manufacturing, and the like are ignored
5. All sales occur at the end of each month
6. All workers are paid equally at the rate of $25/hour, and each machine must be operated by one worker
7. All operation times must be added linearly – that is, no machines can be operated simultaneously. Finally, the mention of an “amount” or “unit” of shoes refers to one “box” or one “pair” of shoes. 
8. The budget for raw materials is $10,000,000
9. Failing to meet the product demands will result in a monetary loss of $10 per pair of shoes due to a loss of potential customers
10. All machines will operate up to 12 hours per day for 28 days per month
11. The cost for warehouse space is included as a production cost
12. No financial risks are involved in the production process 
13. Profit is modeled as a linear function
14. The order in which warehouses are filled does not matter
15. The order in which the optimal number of shoes is determined does not matter
16. The number of shoes produced is not an integer number, in order to adhere to the linear program

# Files (.mod, .dat, .run, .out)
The model created to maximize the company’s profit makes use of four types of files. These files are the data file (.dat), the module file (.mod), the executable file (.run), and the compiled executable file (.out). 

The purpose of the data file is to access the data provided for this project, as well as the SQL queries used to filter the data. In order to analyse the objective function, Microsoft Access was used to view the data provided. Next, queries were designed in order to read in the tables (for use in other files). Additionally, SQL queries were used to perform calculations on our data for use in answering the questions below. An example of one of these SQL queries is the query used to calculate the demand for February 2006. 

As for the module file, this file seeks to model represent the Integer Program above as a program in AMPL. This program includes the definition of parameters and variables, the declaration of the objective function, and the constraints (including non-negativity). Once this was complete, the Gurobi solver was used to solve the problem. 

The .run executable file contains the code to import the model (.mod) and data (.dat) files, import the solver (gurobi), and solve the model. Once the model is solved, the results are printed by their optimal objective function value, optimal numbers of shoe values, and the optimal warehouse values. Additionally, it prints each of the binding constraints.

Finally, the output executable file contains all of the objective function values for each of the shoes, each of the  values (warehouse used binary values, and each of the binding constraints. In the .run file, we formatted print statements to clearly present the optimal profit, optimal numbers of each shoe to produce, optimal number of factories to be operating, and the binding constraints. 

# Benefits and Limitations
A benefit of this model is that we can easily adjust our production plan upon any parameter changes (e.g. an increase in worker wages due to increased labor). The linear programming model can also easily be extended for sensitivity analysis – for instance, it can be used to see how sensitive our production plan is to factors like changes in machine operating time. Three major drawbacks exist in this deterministic model. Firstly, it fails to consider any risk in the production process, which is inevitable in the market. In fact, profit certainly takes on a statistical distribution, which is neglected in this model. A potential improvement to this model, then, would be to take this distribution into account. Secondly, it fails to consider qualitative parameters in the system – factors such as working environment, customer satisfaction, etc., are neglected for our purely quantitative analysis of the problem. Thirdly, the linear program does not take into account the fact that all values for shoes produced should be integer values. Overall, however, this model has successfully introduced a profitable production plan for the company, yielding an optimal profit of $11,978,412.80, resulting from 275 types of shoes produced and 5 warehouses used.

