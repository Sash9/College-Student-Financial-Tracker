comets_Scholars_Program(Name):-
    gpa(Name, GPA),
    (GPA >= 3.0).

dr_John_Jagger_Scholarship(Name):-
    school(Name, School),
    School = 7.

pirkul_Family_Scholarship(Name):-
     school(Name, School),
	School = 6.

axxess_Scholarship_For_The_Jonsson_School(Name):-
	school(Name, School),
	School = 4,
    gpa(Name, GPA),
	(GPA >= 3.3),
	year(Name, Year),
	(Year > 2).

erik_Jonnson_School_Of_Engineering_And_Computer_Science_Endowed_Scholarship(Name):-
	school(Name, School),
	School = 4,
    type(Name, X),
	X = 'U'.

naveen_Jindal_School_Of_Management_Graduate_Scholarship(Name):-
	school(Name, School),
	School = 6,
    gpa(Name, GPA),
	(GPA >= 3.0),
    type(Name, X),
	X = 'G'.

behavior_And_Brain_Sciences_Undergraduate_Scholarship(Name):-
	school(Name, School),
	School = 2,
    type(Name, X),
	X = 'U'.

diane_Milot_Tucker_Scholarship(Name):-
    school(Name, School),
	School = 2,
	resident(Name, X),
	X = 'Y'.

helen_Smal_Scholarship(Name):-
    school(Name, School),
	School = 2,
	resident(Name, X),
	X = 'Y'.

ragen_S_And_Roy_D_Elterman_Endowed_Scholarship(Name):-
	school(Name, School),
	School = 1,
	gpa(Name, GPA),
	(GPA >= 3.0).

carolyn_Galerstein_Endowed_Scholarship(Name):-
	school(Name, School),
	School = 5,
    type(Name, X),
	X = 'U'.

neila_Skinner_Petrick_And_Thomas_W_Petrick_Endowed_Scholarship(Name):-
	school(Name, School),
	School = 5.

charles_C_McKinney_Scholarship(Name):-
	school(Name, School),
	School = 3,
	gpa(Name, GPA),
	(GPA >= 3.0).

global_Engagement_Scholarship(Name):-
	school(Name, School),
	School = 3,
    resident(Name, X),
	X = 'Y',
	gpa(Name, GPA),
	(GPA >= 3.0),
	type(Name, Y),
	Y = 'U'.

gil_And_Frances_Lease_Scholarship(Name):-
	school(Name, School),
	School = 4,
    resident(Name, X),
	X = 'Y',
	gpa(Name, GPA),
	(GPA >= 3.0),
	type(Name, Y),
	Y = 'U',
    transfer(Name, Z),
	Z='Y'.

%Methods for checkall
check_all(Name, comets_Scholars_Program):-
    name(Name),
    comets_Scholars_Program(Name).

check_all(Name, dr_John_Jagger_Scholarship):-
    name(Name),
    dr_John_Jagger_Scholarship(Name).

check_all(Name, pirkul_Family_Scholarship):-
    name(Name),
    pirkul_Family_Scholarship(Name).

check_all(Name, axxess_Scholarship_For_The_Jonsson_School):-
    name(Name),
    axxess_Scholarship_For_The_Jonsson_School(Name).

check_all(Name, erik_Jonnson_School_Of_Engineering_And_Computer_Science_Endowed_Scholarship):-
    name(Name),
    erik_Jonnson_School_Of_Engineering_And_Computer_Science_Endowed_Scholarship(Name).

check_all(Name, naveen_Jindal_School_Of_Management_Graduate_Scholarship):-
    name(Name),
    naveen_Jindal_School_Of_Management_Graduate_Scholarship(Name).

check_all(Name, behavior_And_Brain_Sciences_Undergraduate_Scholarship):-
    name(Name),
    behavior_And_Brain_Sciences_Undergraduate_Scholarship(Name).

check_all(Name, diane_Milot_Tucker_Scholarship):-
    name(Name),
    diane_Milot_Tucker_Scholarship(Name).

check_all(Name, helen_Smal_Scholarship):-
    name(Name),
   helen_Smal_Scholarship(Name).

check_all(Name, ragen_S_And_Roy_D_Elterman_Endowed_Scholarship):-
    name(Name),
    ragen_S_And_Roy_D_Elterman_Endowed_Scholarship(Name).

check_all(Name, carolyn_Galerstein_Endowed_Scholarship):-
    name(Name),
    carolyn_Galerstein_Endowed_Scholarship(Name).

check_all(Name, neila_Skinner_Petrick_And_Thomas_W_Petrick_Endowed_Scholarship):-
    name(Name),
    neila_Skinner_Petrick_And_Thomas_W_Petrick_Endowed_Scholarship(Name).

check_all(Name, charles_C_McKinney_Scholarship):-
    name(Name),
    charles_C_McKinney_Scholarship(Name).

check_all(Name, global_Engagement_Scholarship):-
    name(Name),
    global_Engagement_Scholarship(Name).

check_all(Name, gil_And_Frances_Lease_Scholarship):-
    name(Name),
    gil_And_Frances_Lease_Scholarship(Name).

%Budget Situations
in_budget_food(Name) :-
    monthly_food(Name, Food),
    percent_food(Name, Food2),
    Food2 >= Food.

in_budget_transportation(Name) :-
    monthly_transportation(Name, Transportation),
    percent_transportation(Name, Transportation2),
    Transportation2 >= Transportation.

in_budget_savings(Name) :-
    monthly_savings(Name, Savings),
    percent_savings(Name, Savings2),
    Savings >= Savings2.

in_budget_entertainment(Name) :-
    monthly_entertainment(Name, Entertainment),
    percent_entertainment(Name, Entertainment2),
    Entertainment2 >= Entertainment.

worst_spender(Name) :- 
    not in_budget_entertainment(Name), 
    not in_budget_food(Name), 
    not in_budget_transportation(Name), 
    not in_budget_savings(Name).
%generalize anyone who is worst spender
check_all_worst_spenders(Name) :-
    name(Name),
    worst_spender(Name).

perfect_spender(Name) :- in_budget_entertainment(Name), in_budget_food(Name), in_budget_transportation(Name), in_budget_savings(Name).
%generalize anyone who is perfect spender
check_all_perfect_spenders(Name) :-
    name(Name),
    perfect_spender(Name).


over_budget(Name) :- not perfect_spender(Name).
%generalize anyone who is over budget
check_all_over_budget(Name):-
    name(Name),
    over_budget(Name).


good_spender(Name) :-
    name(Name),
    not in_budget_entertainment(Name),
    in_budget_food(Name),
    in_budget_transportation(Name),
    in_budget_savings(Name).
good_spender(Name) :-
    name(Name),
    in_budget_entertainment(Name),
    not in_budget_food(Name),
    in_budget_transportation(Name),
    in_budget_savings(Name).
good_spender(Name) :-
    name(Name),
    in_budget_entertainment(Name),
    in_budget_food(Name),
    not in_budget_transportation(Name),
    in_budget_savings(Name).
good_spender(Name) :-
    name(Name),
    in_budget_entertainment(Name),
    in_budget_food(Name),
    in_budget_transportation(Name),
    not in_budget_savings(Name).

ideal_college_price(Name) :-
    name(Name),
    tuition_per_sem(Name, Tuition),
    rent(Name, Rent),
    meal_plan_price(Name, Meal),
    ideal_college_expense(Name, Ideal),
    scholarships(Name, Scholarship),
    Ideal >= Tuition + Rent + Meal - Scholarship.

non_ideal_college_price(Name) :-
    name(Name),
    not ideal_college_price(Name),
    check_all(Name, Y).

