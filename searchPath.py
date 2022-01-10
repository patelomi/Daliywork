import json

def recDict():
    f = open("C:/Users/OMI PATEL/Desktop/demo/DS/test_data.json")
    data = json.load(f)
    
    userInput = input("Enter entity Id :- ")


    for line in data:
        if(line['entity_id'] == userInput):
            for secLine in data:
                print(secLine['entity_id'])
                if(secLine['entity_id'] == line['entity_id'] ):
                    break

recDict()
