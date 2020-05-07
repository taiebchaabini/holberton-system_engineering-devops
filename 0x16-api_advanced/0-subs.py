#!/usr/bin/python3
""" function that queries the Reddit API and returns the number of subscribers
(not active users, total subscribers) for a given subreddit. If an invalid
subreddit is given, the function should return 0 """
import requests
headers = {'user-agent': 'linux:taiebchaabini.tech:v1\
 (by /u/taiebchaabini)'}


def number_of_subscribers(subreddit):
    """ returns the number of subscribers (not active users, total subscribers)
    for a given subreddit """
    url = 'https://api.reddit.com/r/' + subreddit + '/about'
    response = requests.get(url,
                            headers=headers)
    try:
        data = response.json()
        data = data['data']['subscribers']
    except:
        data = 0
    return data
