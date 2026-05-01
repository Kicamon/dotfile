th.git = th.git or {}
th.git.unknown_sign = ' '
th.git.untracked_sign = '?'
th.git.modified_sign = 'M'
th.git.deleted_sign = 'D'
th.git.added_sign = '+'
th.git.clean_sign = '✓'
th.git.ignored_sign = '.'
require('git'):setup()

require('full-border'):setup()
require('smart-enter'):setup({
  open_multi = true,
})
require('mime-ext.local'):setup({
  -- Expand the existing filename database (lowercase), for example:
  with_files = {
    makefile = 'text/makefile',
    -- ...
  },

  -- Expand the existing extension database (lowercase), for example:
  with_exts = {
    mk = 'text/makefile',
    -- ...
  },

  -- If the MIME type is not in both filename and extension databases,
  -- then fallback to Yazi's preset `mime.local` plugin, which uses `file(1)`
  fallback_file1 = false,
})
