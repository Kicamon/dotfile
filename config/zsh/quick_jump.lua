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
  ['algorithm'] = '~/Documents/Algorithm',
  ['project'] = '~/Documents/project',
  ['dotfile'] = '~/Documents/dotfile',
  ['note'] = '~/Documents/study/Note/wiki',
}

local dir = arg[1]
if dir == nil then
  print('~')
elseif dir == '-list' then
  for v, _ in pairs(jump) do
    print(v)
  end
elseif jump[dir] == nil then
  print(dir)
else
  print(jump[dir])
end
