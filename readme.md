ICARLY-API

This API is designed as a backend for (but not limited to) a Slack Bot - iCarly. The bot is a to-do auto-reminder over slack, so all users within an organization can be reminded of basic tasks they are to do, even while chatting, across any platform they have Slack installed.


User story

Create

1.	All slack users in an organization should be able to create tasks.
2.	If the user isn't registered earlier, the user should get automatically registered without further prompting.
3.	All requests to create a tasks must possess a task, due time and user name. If the date is not specified, it defaults to the same day the request was made.
4.	A user should receive a success or error message upon creating a task.

Show

1.	A user can see a list of all tasks he/she created within a specified period of time, specifying the parameters.
2.	If he/she doesn't specify the period, then a list of tasks, beginning from the most recent, is sent to him. By default, this list is no more than 20 in number for a batch.

Edit

1.	A user is only allowed to edit tasks he/she created.
2.	A user should receive a success or error message upon editing a task.

Delete

1.	A user can delete a task he/she created.
