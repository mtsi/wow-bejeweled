-- startswith("hello world", "hel") -> true
-- startswith("hello world", {"hel","blah"}) -> true
function startswith(sbig, slittle)
  if type(slittle) == "table" then
    for k,v in ipairs(slittle) do
      if string.sub(sbig, 1, string.len(v)) == v then 
        return true
      end
    end
    return false
  end
  return string.sub(sbig, 1, string.len(slittle)) == slittle
end

-- endswith("hello world", "world") -> true
-- endswith("hello world", {"world","blah"}) -> true
function endswith(sbig, slittle)
  if type(slittle) == "table" then
    for k,v in ipairs(slittle) do
      if string.sub(sbig, string.len(sbig) - string.len(v) + 1) == v then 
        return true
      end
    end
    return false
  end
  return string.sub(sbig, string.len(sbig) - string.len(slittle) + 1) == slittle
end

-- contains("hello world", "llo wor") -> true
-- contains("hello world", {"llo wor","blah"}) -> true
function contains(sbig, slittle)
  if type(slittle) == "table" then
    for k,v in ipairs(slittle) do
      if string.find(sbig, v, 1, true) == v then 
        return true
      end
    end
    return false
  end
  return string.find(sbig, slittle, 1, true)
end

function trim(s)
  return (string.gsub(s,"^%s*(.-)%s*$", "%1"))
end

function crappyindent(block, indentation, indent_sequence)
  local result, line_start, line_end
  result = ""
  indentation = 0
  indent_sequence = "  "
  line_start = 1
  while true do
    line_end = string.find(block, "\n", line_start, true)
    if line_end then
      v = string.sub(block, line_start, line_end-1)
    else
      v = string.sub(block, line_start)
    end
    v = trim(v)
    indent = startswith(v, {"function", "if", "for", "repeat"}) or 
      contains(v, {"function (", "function("}) or endswith(v, "do")
    oddindent = startswith(v, {"else", "elseif"})
    unindent = endswith(v, "end") or startswith(v, "until")
    if indent and not unindent then
      result = result .. string.rep(indent_sequence, indentation) .. v .. "\n"
      indentation = indentation + 1
    elseif unindent and not indent then
      indentation = indentation - 1
      result = result .. string.rep(indent_sequence, indentation) .. v .. "\n"
    elseif oddindent then
      indentation = indentation - 1
      result = result .. string.rep(indent_sequence, indentation) .. v .. "\n"
      indentation = indentation + 1
    else
      result = result .. string.rep(indent_sequence, indentation) .. v .. "\n"
    end
    if line_end then
      line_start = line_end + 1
    else
      break
    end
  end
  return result
end

function indent_selection()
  local txt
  txt = crappyindent(editor:GetSelText())
  if string.sub(txt, string.len(txt)) == "\n" then
    txt = string.sub(txt, 1, string.len(txt)-1)
  end
  editor:ReplaceSel(txt)
end
