return {
	-- lazy.nvim使用の場合
	{
	'rainbowhxch/accelerated-jk.nvim',
	config = function()
	  require('accelerated-jk').setup({
	    mode = 'time_driven',  -- 時間ベースで加速
	    enable_deceleration = false,
	    acceleration_motions = {},
	    acceleration_limit = 150,  -- 最大加速度
	    acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 }  -- 加速カーブ
	  })
	    
	  vim.keymap.set('n', 'j', '<Plug>(accelerated_jk_gj)', {})
	  vim.keymap.set('n', 'k', '<Plug>(accelerated_jk_gk)', {})
	end,
	}
}
