-- Config location: ~/.config/termit
-- Config filename: rc.lua

require("termit.colormaps")
require("termit.utils")

defaults = {}
defaults.windowTitle = 'Termit'
defaults.startMaximized = false
defaults.hideTitlebarWhenMaximized = true
defaults.tabName = ''
defaults.encoding = 'UTF-8'
defaults.wordCharExceptions = '- .,_/'
--defaults.font = 'Courier 10 Pitch'
defaults.font = 'FreeMono 12'
--defaults.foregroundColor = '#00FF00'
--defaults.backgroundColor = 'black'
defaults.showScrollbar = false
defaults.hideSingleTab = false
defaults.hideTabbar = false
defaults.showBorder = true
defaults.hideMenubar = true
defaults.fillTabbar = true
defaults.scrollbackLines = 4096
defaults.geometry = '80x24'
defaults.allowChangingTitle = true
--defaults.backspaceBinding = 'AsciiBksp'
--defaults.deleteBinding = 'AsciiDel'
defaults.cursorBlinkMode = 'BlinkOn'
defaults.cursorShape = 'Block'
defaults.tabPos = 'Top'
defaults.setStatusbar = function (tabInd)
    tab = tabs[tabInd]
    if tab then
        return tab.encoding..'  Bksp: '..tab.backspaceBinding..'  Del: '..tab.deleteBinding
    end
    return ''
end
defaults.colormap = termit.colormaps.dracula
defaults.matches = {['http[^ ]+'] = function (url) print('Matching url: '..url) end}
defaults.tabs = {{workingDir = '~'}}
setOptions(defaults)
--setColormap(termit.colormaps.dracula)


bindKey('AltShift-n', openTab)
bindKey('Ctrl-Left', prevTab)
bindKey('Ctrl-Right', nextTab)
bindKey('Ctrl-F', findDlg)
bindKey('AltShift-t', 
	function ()
		defaults.hideTabbar = not defaults.hideTabbar
		setOptions(defaults)
		closeTab()
	end)
bindKey('Ctrl-2', function () print('Hello2!') end)
bindKey('Ctrl-3', function () print('Hello3!') end)
bindKey('Ctrl-3', nil) -- remove previous binding

-- don't close tab with Ctrl-w, use CtrlShift-w
bindKey('Ctrl-w', nil)
bindKey('AltShift-c', closeTab)

setKbPolicy('keycode')

bindMouse('DoubleClick', openTab)

-- 
userMenu = {}
table.insert(userMenu, {name='Close tab', action=closeTab})
table.insert(userMenu, {name='New tab name', action=function () setTabTitle('New tab name') end})

mi = {}
mi.name = 'Zsh tab'
mi.action = function ()
    tabInfo = {}
    tabInfo.title = 'Zsh tab'
    tabInfo.command = 'zsh'
    tabInfo.encoding = 'UTF-8'
    tabInfo.workingDir = '/tmp'
    tabInfo.backspaceBinding = 'AsciiBksp'
    tabInfo.deleteBinding = 'EraseDel'
    openTab(tabInfo)
end
table.insert(userMenu, mi)

table.insert(userMenu, {name='set red color', action=function () setTabForegroundColor('red') end})
table.insert(userMenu, {name='Reconfigure', action=reconfigure, accel='Ctrl-r'})
table.insert(userMenu, {name='Selection', action=function () print(selection()) end})
table.insert(userMenu, {name='dumpAllRows', action=function () forEachRow(print) end})
table.insert(userMenu, {name='dumpVisibleRowsToFile',
    action=function () termit.utils.dumpToFile(forEachVisibleRow, '/tmp/termit.dump') end})
table.insert(userMenu, {name='findNext', action=findNext, accel='Alt-n'})
table.insert(userMenu, {name='findPrev', action=findPrev, accel='Alt-p'})
table.insert(userMenu, {name='new colormap', action=function () setColormap(termit.colormaps.mikado) end})
table.insert(userMenu, {name='toggle menubar', action=function () toggleMenubar() end})
table.insert(userMenu, {name='toggle tabbar', action=function () toggleTabbar()  end})

mi = {}
mi.name = 'Get tab info'
mi.action = function ()
    tab = tabs[currentTabIndex()]
    if tab then
        termit.utils.printTable(tab, '  ')
    end
end
table.insert(userMenu, mi)

function changeTabFontSize(delta)
    tab = tabs[currentTabIndex()]
    setTabFont(string.sub(tab.font, 1, string.find(tab.font, '%d+$') - 1)..(tab.fontSize + delta))
end

table.insert(userMenu, {name='Increase font size', action=function () changeTabFontSize(1) end})
table.insert(userMenu, {name='Decrease font size', action=function () changeTabFontSize(-1) end})
table.insert(userMenu, {name='feed example', action=function () feed('example') end})
table.insert(userMenu, {name='feedChild example', action=function () feedChild('date\n') end})
table.insert(userMenu, {name='move tab left', action=function () setTabPos(currentTabIndex() - 1) end})
table.insert(userMenu, {name='move tab right', action=function () setTabPos(currentTabIndex() + 1) end})
table.insert(userMenu, {name='User quit', action=quit})

--addMenu(userMenu, "User menu")
--addPopupMenu(userMenu, "User menu")

--addMenu(termit.utils.encMenu(), "Encodings")
--addPopupMenu(termit.utils.encMenu(), "Encodings")
