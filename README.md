# snapy-stream

Plugin of [snapy](https://github.com/snapyjs/snapy).

Take a snapshot of a stream.

```js
{test} = require("snapy")

test((snap) => {
  // simple
  snap({stream: someStream})

  // transform stream to obj
  snap({
    obj: {
      someProp: someStream,
      someOtherProp: someOtherStream
    },
    stream: "someProp, someOtherProp",
    encoding: "utf8" // default
    })
})
```

## License
Copyright (c) 2017 Paul Pflugradt
Licensed under the MIT license.
