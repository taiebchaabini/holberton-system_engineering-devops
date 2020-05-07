#!/usr/bin/python3
"""
    Recursive function that queries the Reddit API, parses the title of all hot
    articles, and prints a sorted count of given keywords (case-insensitive,
    delimited by spaces. Javascript should count as javascript, but java should
    not).
"""
import json
import requests
import re
headers = {'user-agent': 'linux:taiebchaabini.tech:v1\
 (by /u/taiebchaabini)'}


def count_words(subreddit, word_list, after='', occurs={}):
    """
        Recursive function that queries the Reddit API, parses the title of all
        hot articles, and prints a sorted count of given keywords
        (case-insensitive, delimited by spaces.
        Javascript should count as javascript, but java should not).
    """
    url = 'https://api.reddit.com/r/' + subreddit + '?limit=100&after=' + after
    response = requests.get(url,
                            headers=headers)
    try:
        data = response.json()
    except:
        return None
    if (str(response.status_code) == '404'):
        return None
    dataLength = len(data['data']['children'])
    if (dataLength is 0):
        return None
    for i in range(0, dataLength):
        try:
            get_title = data['data']['children'][i]['data']['title']
            for a in word_list:
                try:
                    occurs[a]
                except KeyError:
                    occurs[a] = 0
                finally:
                    occurs[a] += re.subn(r'(?i)\b{}\b'.format(a), '',
                                         get_title)[1]
        except:
            pass
        afterVal = data['data']['after']
    if (afterVal is not None):
        return count_words(subreddit, word_list, afterVal, occurs)
    else:
        for key, val in sorted(occurs.items(), key=lambda k: (k[1], k[0]),
                               reverse=True):
            print("{}: {}".format(key, val))
        return
