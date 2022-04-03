def _impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name + ".out")
    args = ctx.actions.args()
    args.add(out.path)
    ctx.actions.run(
        outputs = [out],
        executable = ctx.executable.bin,
        arguments = [args],
        use_default_shell_env = True,
    )
    return [DefaultInfo(files = depset([out]), runfiles = ctx.runfiles(files = [out]))]

py_version = rule(
    implementation = _impl,
    attrs = {
        "bin": attr.label(
            executable = True,
            cfg = "host",
            allow_files = True,
            default = Label("//rule:bin"),
        ),
    },
)
