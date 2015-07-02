  module.exports = (robot) ->
    robot.hear /showandtell?/i, (res) ->
      res.send "Omniscience"