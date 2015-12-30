# Typeformx

[![Build Status](https://semaphoreci.com/api/v1/projects/5b5cbac3-9d62-4e5b-8d1e-65b08ac491bc/647079/badge.svg)](https://semaphoreci.com/sforkin/typeformx)

An Elixir client library for the Typeform API (http://typeform.io)

## Using

It is simple to add to any project.

1. If you are using the hex package manager, just add the following to your mix file:


``` elixir
def deps do
  [ { :typeformx, '~> 0.0.1' } ]
end
```

If you aren't using hex, add the a reference to the github repo.

``` elixir
def deps do
  [ { :typeformx, github: "netflakes/typeformx" } ]
end
```

2. Ensure typeformx is started with your application:

``` elixir
def application do
  [applications: [:typeformx]]
end
```

3. Then run `mix deps.get` in the shell to fetch and compile the dependencies.


## Configuration

Next, set the environment variables for the API host and your secret key. You can obtain a secret key from
the [developer portal](http://typeform.io). Once you register on the site, you will be provided
a key as well as information on the API documentation.

Then create a file in the config folder to contain the typeform host and api key - see the file below for details on the format.

```
config/typeform_secrets.exs.example
```
