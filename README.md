# Defer Server Command

[:coffee: fund my caffeine addiction :coffee:](https://buymeacoff.ee/nosoop)

A small utility to defer execution of a command until after all configs have been buffered.
Created in response to [nosoop/SM-YetAnotherMapConfigPlugin#1][issue].

[issue]: https://github.com/nosoop/SM-YetAnotherMapConfigPlugin/issues/1

## Example

In a configuration file:

```
defer echo "Hello from defer!";
echo "Hello from config!";
```

"Hello from config!" will be printed out as the configuration file is being executed, and
"Hello from defer!" will be printed after all configuration files have been buffered.
