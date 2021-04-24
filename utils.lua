function center_print(message, y, color)
  local width = #message * 4
  local x = (screen_width - width) / 2
  print(message, x, y, color)
end

function merge_tables(a, b)
  for k, v in pairs(b) do
    a[k] = v
  end
  return a
end
