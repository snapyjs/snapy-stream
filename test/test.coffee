{test, fs} = require "snapy"


test (snap, cleanUp) =>
  filename = "./testFile"
  cleanUp => fs.remove filename
  # should correctly read line1 and line2 from file
  fs.writeFile filename, "line1\nline2\n"
  .then => snap stream: fs.createReadStream(filename)
  .then => fs.remove filename

test (snap, cleanUp) =>
  filename = "./testFile2"
  cleanUp => fs.remove filename
  # should correctly read line1 and line2 from file
  fs.writeFile filename, "line1\nline2\n"
  .then => snap obj: fs.createReadStream(filename), stream: ""