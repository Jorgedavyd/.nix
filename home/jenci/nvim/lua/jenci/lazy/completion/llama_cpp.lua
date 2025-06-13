return {
    'ggml-org/llama.vim',
    init = function()
        vim.g.llama_config = {
            endpoint = 'http://127.0.0.1:8012/infill',
            api_key = '',
            n_prefix = 256,
            n_suffix = 64,
            n_predict = 128,
            t_max_prompt_ms = 500,
            t_max_predict_ms = 1000,
            show_info = 2,
            auto_fim = true,
            max_line_suffix = 8,
            max_cache_keys = 250,
            ring_n_chunks = 16,
            ring_chunk_size = 64,
            ring_scope = 1024,
            ring_update_ms = 1000,
            keymap_trigger = "<C-w>",
            keymap_accept_full = "<C-y>",
            keymap_accept_line = "<C-Y>",
            keymap_accept_word = "<Tab>",
        }
    end
}
