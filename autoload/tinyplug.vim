function! tinyplug#get_root() abort
	return expand('~/.vim/pack/plugins/start/')
endfunction

let s:plugins = []

function! tinyplug#define(plugins) abort
	command! PluginSync call tinyplug#sync()
	command! -nargs=1 PluginInstall call tinyplug#install(<args>)

	let s:plugins = a:plugins

	let root = tinyplug#get_root()

	if !isdirectory(glob(root))
		silent execute '!mkdir -p ' . root
	endif
endfunction

function! s:out_cb(job, msg) abort
	echow 'PluginSync: ' . a:msg
endfunction

function! s:exit(job, status) abort
	if a:status != 0
		echow 'PluginSync: failed'
	else
		echow 'PluginSync: done'
	endif
endfunction

function! tinyplug#sync() abort
	let root = tinyplug#get_root()

	for url in s:plugins
		let dirname = split(url, '/')[-1]
		let target = root . dirname

		if !isdirectory(target)
			call job_start(['git', 'clone', url, '--depth=1', target],
				\ {'err_cb': 's:out_cb', 'out_cb': 's:out_cb', 'exit_cb': 's:exit'})
		else
			call job_start(['cd', target, '&&', 'git', 'pull'],
				\ {'err_cb': 's:out_cb', 'out_cb': 's:out_cb', 'exit_cb': 's:exit'})
		endif
	endfor

	redraw!
endfunction

function! tinyplug#install(git_repo_url) abort
	let root = tinyplug#get_root()
	let dirname = split(a:git_repo_url, '/')[-1]
	let target = root . dirname

	if !isdirectory(target)
		call job_start(['git', 'clone', a:git_repo_url, '--depth=1', target],
			\ {'err_cb': 's:out_cb', 'out_cb': 's:out_cb', 'exit_cb': 's:exit'})
	endif
endfunction
