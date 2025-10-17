import express from "express";
import fetch from "node-fetch";
import { readFileSync, writeFileSync } from "fs";


const app = express();

app.get("/login", (req, res) => {
  res.redirect("https://accounts.spotify.com/authorize?" +
    new URLSearchParams({
      response_type: "code",
      client_id: process.env.SPOTIFY_CLIENT_ID,
      scope: "app-remote-control user-read-playback-state user-modify-playback-state user-read-currently-playing",
      redirect_uri: "http://127.0.0.1:3000/callback"
    })
  )
})



app.get("/callback", async (req, res) => {
  let code = req.query.code || null;
  if (code === null) {
    res.send("No code provided");
    return;
  }

  const spotify_res = await fetch("https://accounts.spotify.com/api/token", {
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Basic " + Buffer.from(process.env.SPOTIFY_CLIENT_ID + ":" + process.env.SPOTIFY_CLIENT_SECRET).toString("base64")
    },
    body: new URLSearchParams({
      grant_type: "authorization_code",
      code: code,
      redirect_uri: "http://127.0.0.1:3000/callback"
    })
  })

  const data = await spotify_res.json();
  if (data.error) {
    res.send("Error: " + data.error_description);
  }
  else {
    writeFileSync("spotify_token.json", JSON.stringify(data, null, 2));
    res.send("Success! You can now close this tab.");
  }
})


app.get("/now-playing", async (req, res) => {
  try {
    const spotify_token = JSON.parse(readFileSync("spotify_token.json", "utf-8"));
    const spotify_res = await fetch("https://api.spotify.com/v1/me/player/currently-playing", {
      method: "GET",
      headers: {
        "Authorization": "Bearer " + spotify_token.access_token
      }
    })
    const data = await spotify_res.json();
    if (data.error) {
      if (data.error.status === 401) {
        console.log("Access token expired, refreshing...");
        const refresh_res = await fetch("https://accounts.spotify.com/api/token", {
          method: "POST",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Basic " + Buffer.from(process.env.SPOTIFY_CLIENT_ID + ":" + process.env.SPOTIFY_CLIENT_SECRET).toString("base64")
          },
          body: new URLSearchParams({
            grant_type: "refresh_token",
            refresh_token: spotify_token.refresh_token,
            client_id: process.env.SPOTIFY_CLIENT_ID,
          })
        })
        const data = await refresh_res.json();
        if (data.error) {
          console.log(data);
          res.send("Error: " + data.error.message);
          return;
        }
        spotify_token.access_token = data.access_token;
        writeFileSync("spotify_token.json", JSON.stringify(spotify_token, null, 2));
        res.redirect("/now-playing");
        return;
      }
      console.log(data);
      res.send("Error: " + data.error.message);
    }
    res.json(data);
  } catch {
    res.send("Error: No token found. Please login first at /login");
  }
  })





app.listen(3000, () => {
  console.log("Server is running on http://localhost:3000");
})
