import json

print('Loading function')


def lambda_handler(event, context):
    print("Received event: " + json.dumps(event, indent=2))
    print("--------------------Event source = " + event['Records'][0]['EventSource'])
    print("--------------------Subject = " + event['Records'][0]['Sns']['Subject'])
    print("--------------------Message = " + event['Records'][0]['Sns']['Message'])
    #print("value1 = " + event['key1'])
    #print("value2 = " + event['key2'])
    #print("value3 = " + event['key3'])
    #return event['key1']  # Echo back the first key value
    #raise Exception('Something went wrong'))))))))))))
