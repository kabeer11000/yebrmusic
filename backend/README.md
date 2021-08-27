# Yebr Backend
Handles app logic. for authentication and API access
### Auth Architecture
When using the app. Yebr client requests user accounts from Kabeer Identity Platform ( which looks for a user auth sessions cookie ). then client sends a `authuser` param to Yebr Bckend requesting a Access Key.
Keys are permentant identifiers.
When user is not signed_in no key is issued. and subsequent requests to logged-in requests will be denied. 
