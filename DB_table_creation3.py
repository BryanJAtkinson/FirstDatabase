###how to run
#cd to directory .py file is held in
#enter python3
#input import os
#input exec(open("./DB_table_creation.py").read())

import random
import os
import errno

# Silently attempts to remove the filename provided
def silentremove(filename):
	try:
		os.remove(filename)
	except OSError as e:
		if e.errno != errno.ENOENT:
			raise

# Prints a row of data to the filename provided via append
def my_file(filename, *args):
	separator = ","
	
	# This try/except code checks if the random row generated has been generated before to help produce unique data
	previouslyWritten = False
	try:
		fread = open(filename, "r")
		count = 0
		while True:
			count = count + 1
			
			line = fread.readline()
			line = line.strip()
			splitLine = line.split(',')
			
			if (line == ''):
				break
			
			
			if (separator.join(splitLine[1:len(splitLine)]) == separator.join(args[1:len(args)])):
				previouslyWritten = True
			
		fread.close()
	except:
		print("Could Not Read File")
	
	# Writes the data line to filename
	if previouslyWritten == False:
		print(separator.join(args))
		f = open(filename, "a")
		f.write(separator.join(args))
		f.write("\n")
		f.close()
		return True
	
	return False

# This code shuffles a list and concatenates the first N elements together
def my_comb(numb_combine, array):
	options = array.split(',')
	
	# Unless a special format is given which generates and returns a random number instead
	if (numb_combine == 1 and options[0] == 'R'):
		return str(random.randrange(int(options[1]),int(options[2]),1))
	elif (numb_combine == 1 and options[0] == 'D'):
		return str(round(random.uniform(float(options[1]),float(options[2])),2))
	
	# Shuffle the list of data and combine the first N elements into a single string
	random.shuffle(options)
	entry = ''
	if (numb_combine <= len(options)):
		for x in range(0, numb_combine):
			entry = entry + options[x]
	else:
		for x in range(0, len(options)):
			entry = entry + options[x]
	return entry

# Takes an arbitrary number of arguments in a [number, data] format and creates a unique row of data iterator_end - 1 times
def my_iteration(file_name, iterator_end, *args):
	iterator = 1
	silentremove(file_name) # Removes the previous file from a prior run
	while iterator < iterator_end:
		temp=[]
		for value in args:
			temp.append(my_comb(value[0], value[1]))
		data = tuple(temp)
		repeat = my_file(file_name, str(iterator), *data) # Generates a row of data and returns if it is unique. If unique it writes to file.
		if repeat: #If not unique, the index does not increment until a unique row is generated
			iterator = iterator + 1
	
#####
state = 'MC,VS,EA,MR,JP,ST,UR,NP'
zipcode = str(random.randrange(100,1000,1))
for x in range(0, 14):
	zipcode = zipcode + ',' + str(random.randrange(100,1000,1))
city = 'Lunakhod,Yutu,Pragyan,Sojourner,Spirit,Opportunity,Curiosity,Perseverance,Minerva,Mascot'
street = 'Moon,Phobos,Deimos,Io,Europa,Ganymede,Callisto,Amalthea,Hinalia,Elara,Pasiphae,Sinope,Lysithea,Carme'

my_iteration('address.txt', 41, [1,state], [1,zipcode], [1,city], [1,street])
	
#####
classes = 'Biology I,Algebra,Biology II,Precalculus,Statistics,Anthropology,Psychology,Calculus,Advanced Calculus,Geometry,Linear Algebra,Genetics,Human Genetics,Plant Genetics,Sports Medicine,Anatomy,Astrology,Physics I,Physics II,Quantum Mechanics,Chemistry I,Chemistry II,Organic Chemistry,Analytical Chemistry,Fourier Series,Spatial Statistics,Machine Learning,Artificial Intelligence,Game Theory,Computer Science I,Computer Science II,Algorithms,Computer Organization,Operating Systems,Human Physiology'

my_iteration('classes.txt', 31, [1, classes], [1, 'R,15,121'])

#####
products = 'Toothbrush,Toothpaste,Tools,Model Truck,Energy Drink,Computer,Notecards,Pen,Pencile,Boxing Gloves,Baseball Bat,Soccer Ball,Hockey Stick,Printer,Printer Ink,Paper,Popsicle,Bike,Road Bike,Stationary Bike,Slippers,Shoes,Socks,Video Games,Baseball,Softball,Basketball,Juice,Fruit,Meat,Notebooks,Pants,Shirts,Bread'
Descriptions = 'A Healthy Snack to Eat,A Healthy Meal,An Unhealthy Food,Hygenic Care,Construction Tools,An Energy Drink,Writing Utensile,Writing Standard,Sports Materials,Sports Equipment,Printer,Printer Supplies,Outdoor Travel,Exercise Equipment,Foot Wear,Computer Recreation,Food,Clothes'

my_iteration('products.txt', 51, [1, products], [1, Descriptions], [1, 'R,1,115'])

#####
agency = 'Moogoo,Hatas,Pepus,Octron'

my_iteration('agency.txt', 21, [1, 'R,10000,1000000'], [2, agency])

#####
firstName = 'rum,tum,tuber,oct,mes,trun,spas,wai,haw'
lastName = 'haw,cat,ciz,snek,cra,step,daut,oct.rum'
title = 'Instructor,Instructor,Student,Student,Student,Student,Student,Student,Student,Student'

my_iteration('instructor_student.txt', 101, [3, firstName], [3, lastName], [1, 'R,1,41'], [1, 'R,1000,10000'], [1, title])

#####

my_iteration('grants.txt', 21, [1, 'R,1,21'], [1, 'R,1985,2077'], [1, 'R,1985,2077'])

#####
department = 'Biology,Math,Physics,Statistics,Anthropology,Psychology,Genomics,Sports,Medicine,Chemistry,Computer Science'
topic = 'Biology,Math,Statistics,Physics,Anthropology,Psychology,Genomics,Sports,Medicine,Chemistry,Computer Science'

my_iteration('research.txt', 16, [1, department], [1, topic], [1, 'R,1,21'])

#####

my_iteration('research_class.txt', 451, [1, 'R,1,31'], [1, 'R,1,16'])

#####

my_iteration('class_people.txt', 2001, [1, 'R,1,31'], [1, 'R,1,201'], [1, 'D,0.0,4.0'])

#####

my_iteration('people_credit_card.txt', 151, [1, 'R,1,201'], [1, 'R,10000,100000'], [1, 'R,2010,2100'], [1, 'R,10,100'])

#####

my_iteration('people_purchases.txt', 226, [1, 'R,1000000,10000000'], [1, 'R,2010,2100'])

#####

Review = 'Best Product Ever,It Was Okay,Would Not Recommend,It Fell Apart,'

my_iteration('purchases_products.txt', 4000, [1, 'R,1,226'], [1, 'R,1,51'], [1, 'R,1,10'], [1, Review])
