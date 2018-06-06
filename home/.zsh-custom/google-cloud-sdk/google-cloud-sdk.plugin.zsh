if [[ ! -d "$HOME/google-cloud-sdk" ]]; then
  echo "Google Cloud SDK is not installed"
  # TODO: Curl the tar and install here.
fi

# Update path for Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/path.zsh.inc";
fi

# Give gcloud auto-complete.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/completion.zsh.inc";
fi
