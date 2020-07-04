import xml.etree.ElementTree as ETree
import getpass
from pbxproj import XcodeProject
import sys

file = "KognitaModels.xcodeproj/xcshareddata/xcschemes/KognitaModels-Package.xcscheme"

tree = ETree.parse(file)

launch_action = ETree.SubElement(tree.getroot(), "LaunchAction")
launch_action.set("buildConfiguration", "Debug")
launch_action.set("selectedDebuggerIdentifier", "Xcode.DebuggerFoundation.Debugger.LLDB")
launch_action.set("selectedLauncherIdentifier", "Xcode.DebuggerFoundation.Launcher.LLDB")
launch_action.set("launchStyle", "0")
launch_action.set("useCustomWorkingDirectory", "NO")
launch_action.set("ignoresPersistentStateOnLaunch", "NO")
launch_action.set("debugDocumentVersioning", "YES")
launch_action.set("debugServiceExtension", "internal")
launch_action.set("allowLocationSimulation", "YES")

env_var_section = ETree.SubElement(launch_action, "EnvironmentVariables")

tree.write(file)

# Adding swiftlint script
project = XcodeProject.load("KognitaModels.xcodeproj/project.pbxproj")
project.add_run_script("""
if which swiftlint >/dev/null; then
  swiftlint
  swiftlint autocorrect
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
""", target_name="KognitaModels")
project.save()
