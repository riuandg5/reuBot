# reuBot
Just a batch file bot to have some chat.

# For Windows only!
- Copy the code from reuBot.bat file
- Paste it in any text editor and save it with .bat extension.
- Run the batch file and start chatting with rB bot.

# Feature
- It is coded to respond normal conversations only but you can extend its capabilities.
- It can tell you about time, date and even weather.
- It tells weather report by parsing data from http://wttr.in
- There is a login system also coded in it which you can use as per your needs.
- You can use its simple structure to make a great AI bot.

# Command Instructions
> YourProfileName-
- This is the default prefix to tell the user to type, where YourProfileName is the name of profile from which you are logged in.

> time, date, weather, signup, signin, signout, bye
- These are just like keywords from which you can make some request and rB understands.
- You could make request from these keywords which does not depends upon how you converse with rB.

> time
- rB will tell you the time.

> date
- rB will tell you the date.

> weather
- rb will ask you for the name of place and the default prefix YourProfileName- will change to YourProfileName-place-
- Just tell him the PlaceName and wait for few seconds till rB gathers weather report for you.
- For PlaceName you could type in city name (bangalore), any location (~eiffel+tower), unicode name of any location in any language (Москва), airport code (3 letters only - del), domain name (@github.com), area codes (94107) and GPS coordinates (25.6,85.1).

> weather-PlaceName
- This is just a quick way to ask for weather report of PlaceName from rB.
- Parameters for PlaceName are same as mentioned above.

> signup
- rB will ask for NewUserName and NewPassword and create your account.
- rB also checks for available usernames while signing up new account.

> signin
- rB will for UserName and check if there is any account with that username or not.
- After succesfully checking he will ask you for password to signin.
- If signin goes correct then the default prefix YourProfileName- will change to YourAccountName-

> signout
- rB closes the signed in account and the prefix is change back to its default value.

> bye
- rB take this keyword as request to close.
