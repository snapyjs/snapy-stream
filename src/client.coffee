prop = "stream"
module.exports = client: ({snap,position,Promise,util}) ->

  snap.hookIn position.init, util.normalizeMapping.bind null, prop
  snap.hookIn position.before, 
    util.processMapping.bind null, prop, (parent,name,stream, {encoding}) -> 
      return unless stream
      return new Promise (resolve) ->
        allLines = []
        buf = null
        encoding ?= "utf8"
        stream.setEncoding?(encoding) if encoding
        stream.on "data", (data) ->
          if data.split?
            lines = data.split("\n")
            lines.pop() if lines[lines.length-1] == ""
            Array.prototype.push.apply allLines, lines
          else 
            if buf?
              buf = Buffer.concat [buf, data]
            else
              buf = data
        stream.on "end", ->
          if Buffer.isBuffer(buf)
            parent[name] = buf
          else
            parent[name] = allLines.join("\n")
          resolve()
