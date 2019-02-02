
**On-The-Map**


The On The Map is result of Udacity's iOS Developer Nanodegree.

The On The Map app allows udacity students to share their location and a URL with their fellow students. 
data, On The Map uses a map with pins for location and pin annotations for student names and URLs and in the Second tab it shows its list in a Table View.


**- Implementation:**

The app has four view controller :

1-Login:allows the user to log in using their Udacity credentials .
When the user taps the Login button, the app will attempt to authenticate with Udacity’s servers. Clicking on the Sign Up link will open Safari to the Udacity sign-in page.

2-MapView:displays a map with pins .When the user taps a pin, it displays the pin annotation popup, with the student’s name (pulled from their Udacity profile) and the link associated with the student’s pin.

3-TableView: displays the most recent  locations posted by students in a table. 

4-Pin : allows users to input data in two steps: first adding their location string, then their link.
When the user clicks on the “Find on the Map” button, the app will forward geocode the string. If the forward geocode fails, the app will display an alert view notifying the user.
