import pyjokes

msg = f"Joke of the day: {pyjokes.get_joke()}"

def handler(event, context):
    return {
        'statusCode': 200,
        'body': msg
    }
