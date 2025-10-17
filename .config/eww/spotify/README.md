## Pre-Requisites
- Register an app in spotify developer portal to get client id and client secret
- Put the redirect uri as http://127.0.0.1:3000/callback
- Create a .env file in the root directory and add the following variables:
  - SPOTIFY_CLIENT_ID=your_client_id
  - SPOTIFY_CLIENT_SECRET=your_client_secret
- Before you start using the app, make sure to hit http://localhost:3000/login once to authenticate and get the refresh token.

