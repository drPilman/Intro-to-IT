import requests, os

api_key = os.environ['API_IBM']

headers = {'Content-Type': 'application/json', }

params = (('version', '2018-05-01'),)

url = os.environ['API_URL']


def get(text: str, lg: str):
    result = ""
    if text:
        lg_from = 'ru' if lg == 'en' else 'en'
        data = f'{{"text": "{text}", "model_id":"{lg_from}-{lg}"}}'
        response = requests.post(url, headers=headers, params=params, data=data.encode('utf-8'), auth=('apikey', api_key))
        try:
            result = response.json()['translations'][0]['translation']
        except:
            result = response.text
    return {"source": text, "result": result}


if __name__ == "__main__":
    print("Test: (HI)", get("hi", "ru"))
