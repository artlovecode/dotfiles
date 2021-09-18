-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/audunmo/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/audunmo/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/audunmo/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/audunmo/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/audunmo/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["RltvNmbr.vim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/RltvNmbr.vim"
  },
  ["archman-vim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/archman-vim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["ayu-vim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/ayu-vim"
  },
  ["ctrlp.vim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/ctrlp.vim"
  },
  ["echodoc.vim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/echodoc.vim"
  },
  ["focusedpanic.vim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/focusedpanic.vim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["panic.vim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/panic.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["pulumi.vim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/pulumi.vim"
  },
  ["shades-of-purple.vim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/shades-of-purple.vim"
  },
  tabular = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-camelsnek"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-camelsnek"
  },
  ["vim-carbon-now-sh"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-carbon-now-sh"
  },
  ["vim-colors-rakr"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-colors-rakr"
  },
  ["vim-colors-xcode"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-colors-xcode"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-css-color"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-dispatch-neovim"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-dispatch-neovim"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-exchange"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-medic_chalk"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-medic_chalk"
  },
  ["vim-misc"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-misc"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-textobj-parameter"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-textobj-parameter"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-wwdc16-theme"] = {
    loaded = true,
    path = "/Users/audunmo/.local/share/nvim/site/pack/packer/start/vim-wwdc16-theme"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
