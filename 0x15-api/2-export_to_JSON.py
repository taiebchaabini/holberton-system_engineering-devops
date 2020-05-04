#!/usr/bin/python3
""" Python script that, using a REST API, for a given employee ID, returns
information about his/her TODO list progress and export data to JSON """
import csv
from collections import OrderedDict
import json
import requests
from sys import argv


if __name__ == "__main__":
    employee_id = argv[1]
    user_response = requests.get('https://jsonplaceholder.typicode.com/users/\
' + employee_id).text
    user = json.loads(user_response)

    td_response = requests.get('https://jsonplaceholder.typicode.com/todos?\
userId=' + employee_id).text
    tasks = json.loads(td_response)
    data = OrderedDict()
    data[employee_id] = []
    for task in tasks:
        single_data = OrderedDict()
        single_data["task"] = task['title']
        single_data["completed"] = task['completed']
        single_data["username"] = user['username']
        data[employee_id].append(single_data)

    with open(employee_id + '.json', 'w') as file:
        json.dump(data, file)
