import json

def recDict():
    #give a path of file
    f = open("C:/Users/OMI PATEL/Desktop/demo/DS/test_data.json")
    #load a json file in to the data var
    data = json.load(f)
    path = " "
    #enter the id
    userInput = input("Enter Entity Id :- ")#51

    for line in data:
        #if user input is = to the dec
        if(line['entity_id'] == userInput):
            #loop for the given id
            for secLine in data:
                    #print path
                    path = path+secLine['entity_id']+"/"#1/ then second time 1/2 and so on
                    #check the condition if given id=51 then start for the begining until >=51 then break
                    if(secLine['entity_id'] >= line['entity_id'] ):
                        break
    #print the path
    print(path)

recDict()
