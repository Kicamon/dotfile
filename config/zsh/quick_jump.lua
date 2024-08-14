local jump = {
  ['nvim'] = '~/.config/nvim',
  ['zsh'] = '~/.config/zsh',
  ['dwm'] = '~/.config/dwm',
  ['st'] = '~/.config/st',
  ['kitty'] = '~/.config/kitty',
  ['picom'] = '~/.config/picom',
  ['yazi'] = '~/.config/yazi',
  ['tmux'] = '~/.config/tmux',
  ['ebook'] = '~/Documents/ebook',
  ['algo'] = '~/Documents/Algorithm',
  ['pro'] = '~/Documents/project',
  ['dot'] = '~/Documents/dotfile',
  ['note'] = '~/Documents/study/Note/wiki'
}

local dir = arg[1]
if dir == nil then
  print('~')
elseif jump[dir] == nil then
  print(dir)
else
  print(jump[dir])
end
