# URL Shortener Microservice

## Project aims

The URL Shortener is a small project for Ruby on Rails, meant to exercise proper development workflow (version control, integration and unit testing, etc).

## Functionality

The microservice features a small number of routes (two) and a limited database layer (managed via a single ActiveRecord model). The microservice accepts GET requests to the `/new` endpoint, with an accompanying paramter that defines a link. A JSON object is returned that specifies the original link and a new link to the microservice site. Visiting that link will erdrect the user to the original link.

## Example Usage: Input

`https://little-url-site.com/new/https://www.google.com`

## Example Usage: Output

```
{ "original_url":"https://google.com", "short_url":"https://little-url-site.com/123" }
```

## Example Usage
Visiting `https://little-url-site.com/123` will redirect to `https://google.com`.
