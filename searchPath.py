import json

def funGetpath(userInput):
        for getList in data:
            if getList['entity_id'] == userInput:
                path.append(getList['entity_id'])
                funGetpath(getList['parent_id'])

f = open("C:/Users/OMI PATEL/Desktop/demo/DS/test_data.json")
data = json.loads(f.read())
path = []
userInput = int(input("Enter Entity Id :- "))
f.close()


if userInput==0:
    print("done")
else:
    funGetpath(userInput)
print("Path is:""/".join(path[::-1]))