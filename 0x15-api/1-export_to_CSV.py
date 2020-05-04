#!/usr/bin/python3
""" Python script that, using a REST API, for a given employee ID, returns
information about his/her TODO list progress and export data to CSV """
import csv
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
    with open(employee_id + '.csv', 'w', newline='') as file:
        writer = csv.writer(file, quoting=1)
        for my_dict in tasks:
            my_list = [employee_id, user['username'], my_dict['completed'],
                       my_dict['title']]
            writer.writerow(my_list)
