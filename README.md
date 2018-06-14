# Zendesk Ticket Viewer

Accessing Zendesk API and display all tickets available.
Please click [here](https://zendesk-ticket-viewer.herokuapp.com) to view the app on heroku.

## Installation

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### 1. Clone the repository to your local machine:
```
git clone https://zendesk-ticket-viewer.herokuapp.com
```
### 2. Start local host server:

While inside the working directory:
```
ruby main.rb
```
After starting the server, you need to check what channel is the app available on
eg. Listening on localhost:4567
In above situation, you must type into your url below: http://localhost:4567/

## Prerequisites(OS X)

To run this app, you will require below gems:
* [Sinatra](https://rubygems.org/gems/sinatra/versions/1.4.6) - The web framework used
```
gem install sinatra
```
* [Ruby](https://www.ruby-lang.org/en/downloads/)-Programming language
```
brew install ruby
```
* [HTTParty](https://rubygems.org/gems/httparty/versions/0.13.7)-Access API
```
gem install httparty
```
* [RSPEC](https://rubygems.org/gems/rspec/versions/3.4.0)-Testing
```
gem install rspec -v 3.4.0
```

## Usage Instructions

To start, follow the instructions above, start your server and type into url: http://localhost:4567/
First page will be displayed('/'). Please follow the instructions on that page.
After clicking the link, the app will take you to ('/api?page=1'). You can click on any of the tickets which will take you to ('/api/{id}')

Note: {id} will be integer that is the id number of the ticket that you have selected.
By now, you should see a single ticket with additional info.
To go back to the same page that you were on, simply click "Go Back" button.

At this stage, my app doesn't take your credentials to access the API. The credentials are being given in the code so tickets that are being displayed are my API tickets.
If you want to create your own API, please sign up on the [zendesk website](https://www.zendesk.com/) for a free trial and follow the instructions on how to upload tickets and access them later.
Hint:
Below is the code that you need to use to access the API:
```
 url = "https://kasiatest.zendesk.com/api/v2/tickets.json?&per_page=25&page=#{params[:page]}"  
  auth = {:username => "kasiazendesk@gmail.com", :password => "zendesk2012"}
  result = HTTParty.get(url,:basic_auth => auth)
```
Please keep in mind, this isn't enough to access the API, you will need to run authentication command in terminal, please see [zendesk developers](https://developer.zendesk.com/rest_api/docs/core/tickets) pages for further details.

## Running the tests

To run the tests, ensure you are inside the app directory and type in terminal:
```
rspec main_spec.rb
```
This command should return: 
```
....

Finished in 0.77485 seconds (files took 0.35165 seconds to load)
4 examples, 0 failures
```
## Deployment

You will need the following commands to deploy this app to heroku:
Please make sure that you are in a working directory!
Before the following steps, please ensure this app already has a github repository and the working directory is clean (meaning: you have pushed up all the changes to github)
```
heroku login
```
The request for your email and password will appear. If you don't have an account with heroku, please click on this [link](https://signup.heroku.com/) to create an account.
```
heroku create
```
Will create the app.
```
git remote -v
```
Above command is not necessary, but it's useful to see if the heroku app is inside your github repository.
```
git push heroku master
```
To push the files to heroku.
```
heroku open
```
This command will open the app in a new window on your browser. 
If you can view the site, your lucky!
Often, heroku will display error in the browser and then you have to use following command to see the logs, follow the logs to solve any issues.
```
heroku logs
```
You will probably notice that url that heroku gave you is very random and you would probably want to change the url. Please use the below command to achieve that.
```
heroku apps:rename newname --app oldname
```
newname -> is the new name you want to give to your app, please use hyphen between words
oldname -> is the random name heroku gave you
Please make sure you spell the oldname correctly, otherwise the command won't work.

## Built With

* [RUBY](https://www.ruby-lang.org/en/)
* [Sinatra](http://sinatrarb.com/)
* [RSPEC](http://rspec.info/documentation/)

## Author

* **Kasia Misirli** 











