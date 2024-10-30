// import middy from '@middy/core'
import type { APIGatewayProxyEvent, APIGatewayProxyResult } from 'aws-lambda'
import { format } from 'date-fns'

const msg = format(new Date(), "'Hello, today is 'do MMMM yyyy h:mmbbb")

export const handler = async (req: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
	return {
		statusCode: 200,
		body: JSON.stringify({
			message: `${msg}!`,
			input: req,
		}),
	}
}
