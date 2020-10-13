local utils = {}

-- Outpost collection of random functions and associated calls



function sendToDiscordWebhook(self, discord_username, avatarurl, message)
  local httpdone = registerAnonymousEventHandler('sysPostHttpDone', 
    function(event, rurl, response)
      if rurl == url then display(r) else return true end
    end, true)

  local httperror = registerAnonymousEventHandler('sysPostHttpError', 
    function(event, response, rurl)
      if rurl == url then display(r) else return true end
    end, true)

  local url = "Nothing to see here"
  local data = {
    username = discord_username, 
    avatar_url = avatarurl,
    content = message
  }
  local header = {
    ["Content-Type"] = "application/json",
    --["Content-Length"] = data:len()
  }
  
  postHTTP(yajl.to_string(data), url, header)
  
  killAnonymousEventHandler(httpdone)
  killAnonymousEventHandler(httperror)
end



return utils