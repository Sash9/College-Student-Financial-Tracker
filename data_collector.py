# File used to collect data and rewrite to prolog file

#Function to collect data
def collect_user_data():
    questions = {
        #educational info
        "name" : "What is your name?",

        "age" : "What is your age?",

        "gender" : "What is your Gender? (insert M, F, or O?)",

        "resident" : "Are you a resident of Texas? (Y/N)",

        "transfer" : "Are you a transfer student? (Y/N)",

        "type" : "Are you an undergraduate or Graduate? (insert U or G)",

        "year" : "What year are you? (Freshman = 1, Sophmore = 2, Junior = 3, Senior = 4)",
        
        "school" : "What school are you a part of ? (Arts, Humanities, and Technology = 1, Behavioral and Brain Sciences = 2, Economic, Political and Policy Sciences = 3, Engineering and Computer Science = 4, Interdisciplinary Studies = 5, Management = 6, Natural Sciences and Mathematics = 7)",

        "gpa" : "What is cumulative GPA?",

        #financial info
        "monthly_budget" : "What is your monthly budget?",

        "percent_food" : "What percent do you want to allocate to food?",

        "percent_transportation" : "What percent do you want to allocate to transportation?",

        "percent_entertainment" : "What percent do you want to allocate to entertainment?",

        "percent_savings" : "What percent do you want to allocate to savings?",

        "monthly_food" : "How much did you spend on food?",

        "monthly_transportation" : "How much did you spend on transportation?",

        "monthly_entertainment" : "How much did you spend on entertainment?",

        "monthly_savings" : "How much did you keep into savings?",

        "tuition_per_sem" : "What is your tuition this semester?",

        "rent" : "How much do you pay for rent this semester?",

        "meal_plan_price" : "If you have a meal plan, how much is it (Put 0 if no meal plan)?",

        "ideal_college_expense" : "How much would you like to have to pay for college this semester?",
        
        "scholarships" : "How much are you getting payed in scholarships?"
    }

    responses = {}

    for key, question in questions.items():
        while True:
            value = input(question + " ").strip()
            try:
                if key == "age":
                    responses[key] = int(value)  # Convert to integer
                elif key == "year":
                    responses[key] = int(value)  # Convert to integer
                elif key == "school":
                    responses[key] = int(value)  # Convert to integer
                elif key == "gpa":
                    responses[key] = float(value)  # Convert to float
                elif key in ["monthly_budget", "tuition_per_sem", "rent", "meal_plan_price", "scholarships", "monthly_food", "monthly_transportation", "monthly_entertainment", "monthly_savings", "ideal_college_expense"]:
                    responses[key] = float(value)  # Convert to float
                elif key in ["percent_food", "percent_transportation", "percent_savings", "percent_entertainment"]:
                    responses[key] = float(responses['monthly_budget'] * float(value)/100)
                elif key in ["resident", "transfer"]:
                    if value.upper() not in ["Y", "N"]:
                        raise ValueError("Please enter Y or N.")
                    responses[key] = value.upper()
                elif key in ["gender", "type"]:
                    if value.upper() not in ["M", "F", "O", "U", "G"]:
                        raise ValueError("Please enter a valid option.")
                    responses[key] = value.upper()
                else:
                    responses[key] = value  # Keep as string for non-numeric fields
                break  # Exit loop if input is valid
            except ValueError as e:
                print(f"Invalid input: {e}")
    return responses


# Function used to write data taken in from 'collect_user_data()'
def write_data(responses, filename="user_data.pl"):
    try:
        with open(filename, "a") as file:
            file.write("% Collected Data\n")
            for key, value in responses.items():
                if(key == "name"):
                   file.write(f"{key}('{responses['name']}').\n") 
                elif isinstance(value, str):
                    file.write(f"{key}('{responses['name']}', '{value}').\n")
                else:  # Write numbers without quotes
                    file.write(f"{key}('{responses['name']}', {value}).\n")
        print("\n\n")
    except IOError as e:
        print(f"Error writing to file: {e}")



if __name__ == "__main__":
    user_data = collect_user_data()
    write_data(user_data)