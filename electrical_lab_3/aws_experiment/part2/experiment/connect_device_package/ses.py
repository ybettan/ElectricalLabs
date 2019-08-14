import boto3

ses_client = boto3.client('ses')
src =  'yonibettan@gamil.com'
msg = {
    'Subject': {
        'Data': 'from lambda'
    },
    'Body': {
        'Text': {
            'Data': 'temperature should be lower than 90'
        }
    }
}
dest = {
    'ToAddresses': ['yonibettan@gmail.com']
}
response = ses_client.send_email(Source=src, Destination=dest, Message=msg)
