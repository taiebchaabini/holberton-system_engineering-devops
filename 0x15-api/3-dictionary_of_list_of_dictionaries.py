#!/usr/bin/python3
""" Python script that, using a REST API, for a given employee ID, returns
information about his/her TODO list progress and export data to CSV """
import csv
from collections import OrderedDict
import json
import requests
from sys import argv


if __name__ == "__main__":

    user_response = requests.get('https://jsonplaceholder.typicode.com/\
users/').text
    user = json.loads(user_response)

    td_response = requests.get('https://jsonplaceholder.typicode.com/todos\
').text
    tasks = json.loads(td_response)
    data = OrderedDict()
    for task in tasks:
        employee_id = str(task['userId'])
        single_data = OrderedDict()
        single_data["username"] = user[int(employee_id) - 1]['username']
        single_data["task"] = task['title']
        single_data["completed"] = task['completed']
        try:
            data[employee_id].append(single_data)
        except Exception:
            data[employee_id] = []
            data[employee_id].append(single_data)

    with open('todo_all_employees.json', 'w') as file:
        json.dump(data, file)
