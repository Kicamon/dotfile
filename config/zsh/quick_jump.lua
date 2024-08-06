local jump = {
  ['ebook'] = '~/Documents/ebook',
  ['nvim'] = '~/.config/nvim',
  ['zsh'] = '~/.config/zsh',
  ['dwm'] = '~/.config/dwm',
  ['algo'] = '~/Documents/Algorithm',
  ['pro'] = '~/Documents/project',
  ['dot'] = '~/Documents/dotfile',
}

local dir = arg[1]
if dir == nil then
  print('~')
elseif jump[dir] == nil then
  print(dir)
else
  print(jump[dir])
end
