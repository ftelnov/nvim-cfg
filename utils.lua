local function pip_global_pkg(pkg)
    return ('pip install "%s" --user || pip install "%s" --break-system-packages'):format(pkg, pkg)
end

return {
    pip_global_pkg = pip_global_pkg,
}
