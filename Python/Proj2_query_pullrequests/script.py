import requests

url = f'https://api.github.com/repos/kubernetes/kubernetes/pulls'

response = requests.get(url)

if response.status_code == 200:
    pull_requests = response.json()
    pr_creater = {}
    for pull in pull_requests:
        creater = pull['user']['login']
        if creater in pr_creater:
            pr_creater[creater] +=1
        else:
            pr_creater[creater] = 1
    for creater, count in pr_creater.items():
        print(f"{creater}: {count}")

# display the User Logins made pull requsts
#    for i in range(len(pull_requests)):
#        print(pull_requests[i]["user"]["login"])
#        #print(pull_requests)
else:
    print(f"failed to fetch data: {status_code}")