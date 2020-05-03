# Shiny Reactive (Global)

Unfortunately, `reactivePoll` and other such things do not work as expected
outside of Shiny's reactive context. This is particularly apparent when wanting
to run a "global" (i.e. in the main R process) process every X seconds.

Enter the solution:
```
observe(invalidateLater(x))
```

This has some funky consequences in a development context that could probably be
remedied with some creative programming... but I just restart my R session.

**NOTE:** It may be tempting to feel like this pattern could work in any generic
R process. Alas, it is not so - `shiny` does specific checking of the
`invalidateLater()` tree and such that we take advantage of here. You can
probably accomplish this in generic R with `future` or `promises` or some such.
