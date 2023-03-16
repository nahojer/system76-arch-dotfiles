require('lualine').setup {
  options = {
    theme = COLORSCHEME,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_c = {
      {
        'filename',
        file_status = true, -- Displays file status (readonly status, modified status)
        newfile_status = false, -- Display new file status (new file means no write after created)
        path = 1, -- 0: Just the filename, 1: Relative path, 2: Absolute path, 3: Absolute path, with tilde as the home directory
      },
    },
  },
}
