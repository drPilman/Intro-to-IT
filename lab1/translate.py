import requests, uuid
from secret import subscription_key

url = "https://api.cognitive.microsofttranslator.com/translate"

headers = {
    'Ocp-Apim-Subscription-Key': subscription_key,
    'Ocp-Apim-Subscription-Region': "global",
    'Content-type': 'application/json',
    'X-ClientTraceId': str(uuid.uuid4())
}
params = {
    'api-version': '3.0',
    'from': 'en',
    'to': 'ru'
}


def get(text, lg):
    result = ''
    if text:
        params['from'] = ({"ru", "en"} - {lg}).pop()
        params['to'] = lg
        response = requests.post(url, params=params, json=[{'text': text}], headers=headers)
        result = response.json()[0]['translations'][0]['text']
    return {'source': text, 'result': result}
