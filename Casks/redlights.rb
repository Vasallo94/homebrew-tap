cask "redlights" do
  version "0.1.0"
  sha256 "b32645a28f40e7f5e1423aee365eb5ba15006ec3eab1d76dc69078a9c26d3630"

  url "https://github.com/Vasallo94/redlights/releases/download/v#{version}/RedLights-#{version}.zip"
  name "RedLights"
  desc "Menu bar app that turns every display pure red for astronomy"
  homepage "https://github.com/Vasallo94/redlights"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "RedLights.app"

  # La app va firmada ad-hoc, sin notarizar: sin esto Gatekeeper la bloquea al abrirla.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/RedLights.app"]
  end

  uninstall quit: "es.quique.redlights"

  zap trash: "~/Library/Preferences/es.quique.redlights.plist"
end
