from elasticsearch import Elasticsearch
import requests
import json

def init():
   host = '192.168.99.100'
   port = 31220
   url = 'http://%s:%s'%(host,port)
   stringsearch = "Handbill not printed"
   return (search(url,stringsearch))


def search(uri, term):
#    """Simple Elasticsearch Query"""
    query = json.dumps({
        "query": {
            "match": {
                "content": term
            }
        }
    })
    response = requests.get(uri, data=query)
    results = json.loads(response.text)
    return results

print(init())
