## Hi

This is a mono-repo called `sun-exploded` containing:

- Backend: `rails-dock-api/`
  - Rails 6.1.4 API Only <-------------------|
- Frontend `svelte-vite-frontend-dock` |
  - Vite + Svelte |
- Database: |
  - Postgres v14 <---------------------------|

## Building

- Make sure you have Docker installed (I use Docker Desktop on MacOS)
- Clone this repo locally
- From the root of the repo run:
  - `docker-compose -f docker-compose.yml up --build`
  - You can add the `-d` flag if you prefer to run detached
  - Check out the `docker-compose.yml` file to see what ports are exposed
- Seed Db if you like first via:
  ```
  docker-compose -f docker-compose-yml build && \
  docker-compose run web-api bundle exec rails db:seed && \
  docker-compose up
  ```

^ Change `3001` to whatever you need it to be on your local

## Bundle Install & Running migrations

- If you added a new gem and/or migration it's best to just build the image which will run both `bundle` and `db:migrate`, but if you must run a separate migration or bundle install
  ```
  docker-compose down # or kill the session if not running detached with `-d`
  docker-compose run web-api bundle exec rails db:migrate
  docker-compose run web-api bundle install
  ```

## To get a Rails console

```
docker-compose run web-api bin/rails c
```

## It works?

To view the Svelte App (I've only scaffolded and not yet hooked up to the Rails API) nagigate to http://localhost:3001/
If you need to change the exposed port on your local, then simply alter the port mapping in `docker-compose.yml` for `web-frontend`:

```
    ports:
      - 3001:3000
```

You can also poll the Rails API locally on port `3002` which you can also change in the same manner as above.

You will have to create some scenarios if you want to have them in your db obviously. You can achieve this with the below requests.

Requests to the Rails 6 API `scenarios` endpoint:

```
// GET => http://localhost:3002/scenarios/new
// Generates a new scenario and gives it to you
{
    "scenario": {
        "sun_exploded": true,
        "dice": [
            6,
            6
        ]
    }
}

// POST => http://localhost:3002/scenarios/create
// Use the output + `user_convinced` value to create & save a new scenario
{
    "scenario": {
        "sun_exploded": false,
        "dice": [
            1,
            4
        ],
        "user_convinced": false
    }
}


// GET => http://localhost:3002/scenarios
// Returns all past scenarios
```

^ we could probably use websockets and make these scenarios more "live"-ish

### Rails caveats

Right now if you create a migration then it's best to just restart:

```
docker-compose down # <- you might not need to do that actually ????
docker-compose up
```

To use `byebug` or `binding.pry` you must attach your terminal to the container.

1. Find your container id with `docker ps`
2. `docker attach <container-id>`

## The future

Right now only the development build is available. I have not yet decided on how/where this will be deployed in production, and so there are no production Dockerfiles as of yet.

I may or may not use `docker-compose.yml` in production - it would be the easy way to go, but it might be useful for DevOps-y learning purposes to try a "real" production deployment w/o using compose. That comes with the challenges of:

- Using a hosted db somewhere (or not ??\_(???)\_/?? )
- Figuring out where to host the FE vs the BE - or same place?
- For security purposes it's ideal to host them both on the same domain and make sure we're adequately protected against CSRF / XSS

I may use the Ruby `graphql` gem over REST to add more beneficial output from this fun/learning project.

Adding a reverse proxy would be interesting - maybe Varnish for both reverse proxying and HTTP caching?

Using domain we bought: sunexploded.com

## Why is called the sun exploded

I had an idea for a fun/learning project based on this article and the associated XKCD cartoon.

![Frequentists vs Bayesians](https://imgs.xkcd.com/comics/frequentists_vs_bayesians.png)

[Bayesian vs Frequentist A/B Testing: What's the difference?](https://cxl.com/blog/bayesian-frequentist-ab-testing/)
