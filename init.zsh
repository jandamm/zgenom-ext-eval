# Lazy load the extension
autoload -Uz zgenom-eval

# Lazy load the extensions completion
autoload -Uz _zgenom_eval

# Add description to zgenom help and completion
ZGENOM_EXTENSIONS+=('eval:create one-file "plugin" from provided code.')
