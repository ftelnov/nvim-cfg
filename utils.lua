local function pip_global_pkg(pkg)
    return ('pip install "%s" --user || pip install "%s" --break-system-packages'):format(pkg, pkg)
end

local function codelldb_path()
    local mason_registry = require("mason-registry")
    local codelldb = mason_registry.get_package("codelldb")
    codelldb:get_install_path()

    local extension_path = codelldb:get_install_path() .. "/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
    return {
        extension_path = extension_path,
        codelldb_path = codelldb_path,
        liblldb_path = liblldb_path,
    }
end

return {
    pip_global_pkg = pip_global_pkg,
    codelldb_path = codelldb_path,
}
