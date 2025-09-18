return {
	cmd = { "jdtls", "-configuration", "~/.cache/jdtls/config", "-data", "~/.cache/jdtls/workspace" },
	filetypes = { "java" },
	init_options = {
		jvm_args = {},
		workspace = "~/.cache/jdtls/workspace",
	},
	root_markers = {
		".git",
		"build.gradle",
		"build.gradle.kts",
		"build.xml",
		"pom.xml",
		"settings.gradle",
		"settings.gradle.kts",
	},
}
