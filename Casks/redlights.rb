cask "redlights" do
  version "0.3.1"
  sha256 "2c8b5bbb8f7683f0944cbe8daee655ed93cb87621f61861cf4851839a14017e3"

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
